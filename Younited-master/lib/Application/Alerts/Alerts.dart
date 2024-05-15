import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:http/http.dart' as http;
import 'package:younited_application/Utils/constaints.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';

import 'AlertModel.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {

  Future<AlertModelList> alertModelData;

  String _apiStatus = "Loading...";

  void initState() {
    super.initState();
    alertModelData = fetchAlertData();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, "/dashboard");
        return;
      },
      child: Scaffold(
        backgroundColor: ThemeColors.appbarColor,
        appBar: AppBarWidget.centerTitleAppbar(context, 'Alerts'),
        drawer: Drawer(
          child: SideDrawer.sideDrawer(context),
        ),
        body: MainContainerWidget(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  /*CustomWidgets.sizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _showMyDialog(context);
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 45,
                          width: 120,
                          child: Card(
                            child: Center(
                              child: Text(
                                "+ Notice",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    letterSpacing: 1.0),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            elevation: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomWidgets.sizedBox(height: 15),*/
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder<AlertModelList>(
                        future: alertModelData,
                        builder: (context, snapshot){
                          if(snapshot.hasData && snapshot != null){
                            return ListView.builder(
                                itemCount: snapshot.data.alertModelLists.length,
                                itemBuilder: (context, index){
                                  return listItems(mediaQueryWidth, mediaQueryHeight, snapshot.data.alertModelLists[index], index);
                                }
                            );
                          }else{
                            return Center(child: Text('$_apiStatus'),);
                          }

                        },
                      ),
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

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: AspectRatio(
              aspectRatio: 5 / 4,
              child: Container(
                decoration: containerDecorations.copyWith(
                  color: ThemeColors.appbarColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Notice",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      CustomWidgets.sizedBox(height: 20.0),
                      Expanded(
                        child: Container(
                          decoration: containerDecorations.copyWith(
                              color: Colors.white),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "This notice is inform you regarding new policy changes in our association. Check atteched documnet below",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      CustomWidgets.sizedBox(height: 20.0),
                      Container(
                        //padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 35,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.upload_rounded,
                                      size: 15,
                                    ),
                                    Text(
                                      "Upload",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                elevation: 15.0,
                              ),
                            ),
                            Container(
                              height: 35,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Send Notice",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    CustomWidgets.sizedBox(width: 2.0),
                                    Icon(
                                      Icons.send_outlined,
                                      size: 15,
                                    ),
                                  ],
                                ),
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                elevation: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomWidgets.sizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget listItems(final mediaQueryWidth, final mediaQueryHeight, AlertModel alertModel, int index){
    print(alertModel.alertList.length);
    return AspectRatio(
      aspectRatio: 5 / 1.7,
      child: Container(
        width: mediaQueryWidth,
        child: Card(
          shape: cardDecoration,
          color: Colors.white,
          elevation: 10.0,
          child: alertModel.alertList[0]["isEvent"] != true
              ? GestureDetector(
            onTap:(){
              Navigator.of(context).pushNamed('/meetings');
            },
                child: Container(
            width: mediaQueryWidth * 0.25,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                        child: Text("New meetings are waiting for you...", maxLines: 5, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                    CustomWidgets.sizedBox(height: 10),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${alertModel.alertList[0]["MeetingDate"].split(" ")[0].split("-")[1]} - ${alertModel.alertList[0]["MeetingDate"].split(" ")[0].split("-")[2]}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                            Text("${alertModel.alertList[0]["MeetingDate"].split(" ")[0].split("-")[0]}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),)
                          ],
                        ),
                        CustomWidgets.sizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Meeting Agenda : ${alertModel.alertList[0]["Agenda"]}", maxLines: 5, style: TextStyle(color: Colors.black),),
                            Text("Meeting Venue : ${alertModel.alertList[0]["Venue"]}", maxLines: 5, style: TextStyle(color: Colors.black),),
                            Text("Meeting Description : ${alertModel.alertList[0]["MeetingDesc"]}", maxLines: 5, style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ),
          ),
              )
              : GestureDetector(
            onTap:(){
              Navigator.of(context).pushNamed('/events');
            },
                child: Container(
            width: mediaQueryWidth * 0.25,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text("New Event is going to happen near you...", maxLines: 5, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),

                    CustomWidgets.sizedBox(height: 10),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${alertModel.alertList[0]["DateFrom"].split(" ")[0].split("-")[1]} - ${alertModel.alertList[0]["DateFrom"].split(" ")[0].split("-")[2]}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                            Text("${alertModel.alertList[0]["DateFrom"].split(" ")[0].split("-")[0]}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),)
                          ],
                        ),
                        CustomWidgets.sizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Event Name : ${alertModel.alertList[0]["EventName"]}", maxLines: 5, style: TextStyle(color: Colors.black),),
                            Text("Event Venue : ${alertModel.alertList[0]["Venue"]}", maxLines: 5, style: TextStyle(color: Colors.black),),
                            Text("Event Desc : ${alertModel.alertList[0]["Description"]}", maxLines: 5, style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ),
          ),
              )
        ),
      ),
    );
  }

  /*// Alert Main Title image or date
  Widget alertMain(final mediaQueryWidth, final mediaQueryHeight, String date, String year, bool isDate){
    return isDate ? Container(
      width: mediaQueryWidth * 0.25,
      decoration:
      committeeConatinerDecoration.copyWith(
          image: DecorationImage(
              image: AssetImage(
                'images/comm.jpg',
              ),
              fit: BoxFit.fill)),
    ) : Container(
      width: mediaQueryWidth * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$date', style: TextStyle(fontSize: 22, color: ThemeColors.blackText),),
          Text('$year', style: TextStyle(fontSize: 35, color: ThemeColors.blackText),),
        ],
      ),
    );
  }*/

  Future<AlertModelList> fetchAlertData() async {
    final response = await http.post(
      WebApis.GET_ALERTS,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      Map data = WebResponseExtractor.filterWebData(response, dataObject: 'ALERTS');
      setState(() {
        _apiStatus = data['message'];
        print(data['message']);
      });
      if (data["code"] == 1) {
        List<Map<String, dynamic>> alertListData = new List();

        for(int i = 0; i < data['data'][0]['UPCOMMING_EVENTS'].length; i++){
          data['data'][0]['UPCOMMING_EVENTS'][i]["isEvent"] = true;
          data['data'][0]['UPCOMMING_EVENTS'][i]["isMeeting"] = false;
          alertListData.add(data['data'][0]['UPCOMMING_EVENTS'][i]);
        }
        for(int i = 0; i < data['data'][0]['UPCOMMING_MEETINGS'].length; i++){
          data['data'][0]['UPCOMMING_MEETINGS'][i]["isEvent"] = false;
          data['data'][0]['UPCOMMING_MEETINGS'][i]["isMeeting"] = true;
          alertListData.add(data['data'][0]['UPCOMMING_MEETINGS'][i]);
        }
       // print(alertListData.toString());
        return AlertModelList.fromJson(alertListData);
      }
    } else {
      throw Exception('failed to load');
    }
  }


}

/*Container(
            width: mediaQueryWidth * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("20-DEC", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                      Text("2020", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),)
                    ],
                  ),
                  CustomWidgets.sizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New Event is going to happen near you...", maxLines: 5, style: TextStyle(color: Colors.black),),
                      Text("Event Name : ", maxLines: 5, style: TextStyle(color: Colors.black),),
                      Text("Event Venue : ", maxLines: 5, style: TextStyle(color: Colors.black),),
                      Text("Event Description : ", maxLines: 5, style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ],
              ),
            ),
          )*/

/* listItems(mediaQueryWidth, mediaQueryHeight, "", "", true), // true for image
                        listItems(mediaQueryWidth, mediaQueryHeight, "19th Oct", "2020", false), // false for Date
                        listItems(mediaQueryWidth, mediaQueryHeight, "", "", true),
                        listItems(mediaQueryWidth, mediaQueryHeight, "29th Oct", "2020", false),
                        listItems(mediaQueryWidth, mediaQueryHeight, "", "", true), // true for image
                        listItems(mediaQueryWidth, mediaQueryHeight, "19th Oct", "2020", false), // false for Date
                        listItems(mediaQueryWidth, mediaQueryHeight, "", "", true),
                        listItems(mediaQueryWidth, mediaQueryHeight, "29th Oct", "2020", false),*/

/*Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Narayan Metha viewed your profile ",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0,
                        ),
                      ),
                      CustomWidgets.sizedBox(height: 10.0),
                      Container(
                        height: mediaQueryHeight * 0.04,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            "Check his profile",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          color: Colors.yellow[700],
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(50.0),
                          ),
                          elevation: 15.0,
                        ),
                      ),
                      CustomWidgets.sizedBox(height: 5.0),
                    ],
                  ),
                ),
              ),*/
/*Container(
                height: 50,
                width: mediaQueryWidth,
                child: Column(
                  children: [
                    Container(
                      height: 1,
                      width: mediaQueryWidth,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),*/
