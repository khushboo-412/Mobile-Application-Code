import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Models/EventModel.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Utils/constaints.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:younited_application/main.dart';
class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  double eventContainerHeight;
  List<bool> _visible;
  String eventShowId = "";
  String message = "";
  bool _isSearchingInMeetingList = false;
  String _queryForSearch;
  TextEditingController _mainListViewController = new TextEditingController();
  List<Event> _filterList;
  Future<EventList> eventsList;
  String _apiStatus = "Loading...";
  String checkEvent="UP";

  _EventsState(){
    _mainListViewController.addListener(() {
      if(_mainListViewController.text.isEmpty){
        setState(() {
          _isSearchingInMeetingList = false;
          _queryForSearch = "";
        });
      }else{
        setState(() {
          _isSearchingInMeetingList = true;
          _queryForSearch = _mainListViewController.text.trim();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _visible = new List();
    eventsList = fetchEventList();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    eventContainerHeight = mediaQueryHeight * 0.35;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, "/dashboard");
        return;
      },
      child: Scaffold(
        backgroundColor: ThemeColors.appbarColor,
        appBar: AppBarWidget.centerTitleAppbar(context, 'Events'),
        drawer: Drawer(
          child: SideDrawer.sideDrawer(context),
        ),
        body: MainContainerWidget(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 15, 15, 0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: mediaQueryWidth,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              controller: _mainListViewController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: "Search"),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/createEvent");
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              elevation: 15,
                              shadowColor: ThemeColors.shadowColor,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: Colors.indigo[400],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder<EventList>(
                        future: eventsList,
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot != null) {
                            return _isSearchingInMeetingList ?
                            filterList(snapshot, mediaQueryWidth, mediaQueryHeight) :
                            defaultEventList(snapshot, mediaQueryWidth, mediaQueryHeight);
                          } else {
                            return Text("$_apiStatus");
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: mediaQueryWidth,
                    color: Colors.grey,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton.icon(
                            onPressed: () {
                              setState(() {
                                checkEvent="PE";

                              });
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: checkEvent=="PE"?Colors.indigo[400]:Colors.grey[800],
                              size: 18,
                            ),
                            label: Text(
                              "Past Events",
                              style: TextStyle(fontSize: 10.0,color: checkEvent=="PE"?Colors.indigo[400]:Colors.grey[800]),
                            )),
                        FlatButton.icon(
                            onPressed: () {
                              setState(() {
                                checkEvent="UP";
                              });
                            },
                            label: Text(
                              "Upcoming Events",
                              style: TextStyle(
                                  fontSize: 10.0, color: checkEvent=="UP"?Colors.indigo[400]:Colors.grey[800]),
                            ),
                            icon: Icon(
                          Icons.arrow_forward,
                          color: checkEvent=="UP"?Colors.indigo[400]:Colors.grey[800],
                          size: 18,
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  // Toggle For Show hide members list
  void _toggle(int index, bool visible) {
    setState(() {
      for(int i = 0; i < _visible.length; i++){
        if(i == index){
          _visible[i] = !visible;
        }else{
          _visible[i] = false;
        }
      }
    });
  }

  // Event List View
  Widget defaultEventList(snapshot, final mediaQueryWidth, final mediaQueryHeight){
    var currentDate=DateTime.now();

    return ListView.builder(
      itemCount: snapshot.data.events.length,
      itemBuilder: (context, index) {
        DateTime eventDate= DateTime.parse(snapshot.data.events[index].dateFrom);
        if(_visible.length < snapshot.data.events.length){
          _visible.add(false);
        }

        var now = new DateTime.now();
        var formatter = new DateFormat('yyyy-MM-dd');
        String formattedDate = formatter.format(now);
        //print(formattedDate);

        return checkEvent == "UP"
            ? eventDate.isAfter(currentDate) || snapshot.data.events[index].dateFrom.split(" ")[0] == formattedDate
            ? eventList(
            mediaQueryWidth,
            mediaQueryHeight,
            snapshot.data.events[index], index)
            : SizedBox() :checkEvent == "PE"
            ? eventDate.isBefore(currentDate) && snapshot.data.events[index].dateFrom.split(" ")[0] != formattedDate
            ? eventList(
            mediaQueryWidth,
            mediaQueryHeight,
            snapshot.data.events[index], index) : SizedBox() : SizedBox();

      },
    );
  }
  // Main Searching Widget For Searching in Committee
  Widget filterList(snapshot, final mediaQueryWidth, final mediaQueryHeight){
    _filterList = new List();
    for(int i = 0; i < snapshot.data.events.length; i++){
      String item = snapshot.data.events[i].eventName;

      if(item.toLowerCase().contains(_queryForSearch.toLowerCase())){
        _filterList.add(snapshot.data.events[i]);
      }
    }
    return ListView.builder(
      itemCount: _filterList.length,
      itemBuilder: (context, index) {
        if(_visible.length < _filterList.length){
          _visible.add(false);
        }
        return eventList(mediaQueryWidth, mediaQueryHeight, _filterList[index], index);
      },
    );
  }

  //show Event List
  Widget eventList(final mediaQueryWidth, final mediaQueryHeight, Event event, int index) {

   List<String> eventTitle = event.title.split(",");
  List<String> eventEntryFees = event.eventFeeAmount.split(",");

    List<String> eventDate = event.dateFrom.split(' ');

    var newFormat = DateFormat('dd-MM-yyyy');
    DateTime date = DateTime.parse(eventDate[0]);
    String updatedDt = newFormat.format(date);

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        shape: eventsCardDecoration,
        elevation: 5.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 1.5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: mediaQueryHeight*0.14,
                decoration: eventsConatinerDecoration.copyWith(
                    image: DecorationImage(
                        image: NetworkImage(event.eventCardImage, scale: 1),
                        fit: BoxFit.cover)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.eventName,
                    style: TextStyle(fontSize: 18, letterSpacing: 1.0),
                  ),
                checkEvent=="UP"?  FlatButton.icon(
                      onPressed: () {
                        setState(() {
                          _toggle(index, _visible.elementAt(index));
                          eventShowId = event.entryFeeId.toString();
                        });
                      },
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        color: ThemeColors.appbarColor,
                        size: 18,
                      ),
                      label: Text(
                        "Register",
                        style: TextStyle(
                            color: ThemeColors.appbarColor, fontSize: 15.0),
                      )):SizedBox(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    updatedDt,
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    "Time:" + event.timeFrom + "PM" + "-" + event.timeTo + "PM",
                    style: TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text("Venue:" + event.venue,
                  style: TextStyle(fontSize: 12.0)),
            ),
            Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: _visible[index],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    event.eventFeeAmount.split(',')[0]!=''?Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Fees",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ):SizedBox(),
                     event.eventFeeAmount.split(',')[0]!=""?Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Wrap(
                        children: [
                          Container(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text(
                                   eventTitle[0],
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                                CustomWidgets.sizedBox(height: 5.0),
                                Container(
                                  height: 35,
                                  width: 100,
                                  child: Card(
                                    child: Center(
                                      child: Text(eventEntryFees[0]),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    color: ThemeColors.buttonYellow,
                                    elevation: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        eventTitle[1]!=null && eventTitle[1]!="" && eventEntryFees[1]!=null && eventEntryFees[1]!="" ?  Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    eventTitle[1],
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                                CustomWidgets.sizedBox(height: 5.0),
                                Container(
                                  height: 35,
                                  width: 100,
                                  child: Card(
                                    child: Center(
                                      child: Text(eventEntryFees[1]),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    color: ThemeColors.buttonYellow,
                                    elevation: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ):SizedBox(),
                         eventTitle[2]!=null && eventTitle[2]!="" && eventEntryFees[2]!=null && eventEntryFees[2]!="" ? Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    eventTitle[2],
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                                CustomWidgets.sizedBox(height: 5.0),
                                Container(
                                  height: 35,
                                  width: 100,
                                  child: Card(
                                    child: Center(
                                      child: Text(eventEntryFees[2]),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    color: ThemeColors.buttonYellow,
                                    elevation: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ):SizedBox() ,
                        ],
                      ),
                    ):SizedBox(),
                    CustomWidgets.sizedBox(height: 5),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          CustomWidgets.sizedBox(height: 5),
                          Container(
                            height: 50,
                            width: mediaQueryWidth,
                            decoration: BoxDecoration(
                              //color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(10.0),
                              border:
                              Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                event.description,
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: event.status=="yes"? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Registration Successful",style:TextStyle(fontSize: 15.0,
                              color: ThemeColors.appbarColor
                              )),
                            ):FlatButton(
                              onPressed: (){
                                registerEvent(event.entryFeeId.toString());
                              },
                              child:Text("Register",style: TextStyle(fontSize: 15.0,color: ThemeColors.appbarColor),),
                            ),
                          ),
                          CustomWidgets.sizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );

  }

  // get Event List Data
  Future<EventList> fetchEventList() async {
    Map data={
      "MemberID":userIDMain
    };
    final response = await http.post(
      WebApis.GET_EVENTS,
       body: json.encode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      Map data = WebResponseExtractor.filterWebData(response,
          dataObject: 'EVENT_DATA');
     // print("Event Data:"+data['data']['register'].toString());
      setState(() {
        _apiStatus = data['message'];
      });
      return EventList.fromJson(data['data']);
    } else {
      throw Exception('failed to load');
    }
  }
  void  registerEvent(String id) async{
    Map data={
      "MemberID":userIDMain,
      "event_id":id
    };
    final response = await http.post(
      WebApis.REGISTER_EVENT,
      body: json.encode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
     /* Map data = WebResponseExtractor.filterWebData(response,
          dataObject: '');*/
      eventsList = fetchEventList();

      setState(() {
        _apiStatus = data['message'];
      });
    //  return EventList.fromJson(data['data']);
    } else {
      throw Exception('failed to load');
    }
  }
}
