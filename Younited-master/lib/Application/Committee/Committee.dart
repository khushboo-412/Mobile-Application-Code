import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Application/Meeting/MeetingsCardCreate.dart';
import 'package:younited_application/Models/CommitteeMember.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Utils/Constaints.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:http/http.dart' as http;
import 'package:younited_application/Application/Committee/CommitteeModel.dart';
import 'dart:convert';

import 'package:younited_application/main.dart';

class Committee extends StatefulWidget {
  @override
  _CommitteeState createState() => _CommitteeState();
}

class _CommitteeState extends State<Committee> {

  List<bool> _visible;

  Future<CommitteeList> committeeData;
  String _apiStatus = "Loading...";
 // Future<CommitteeMembersList> committeeMembersData;

  String _queryForSearch;
  String _queryForSearchInnerList;

  bool _isSearchingInCommitteeList = true;
  bool _isSearchingInCommitteeMembersList = true;

  TextEditingController mainListViewController = new TextEditingController();
  TextEditingController _innerListViewController = new TextEditingController();
  Future<CommitteeMembersList> committeeMembersDetails;
  List<CommitteeModel> _filterList;
  List<CommitteeMember> _filterCommitteeMembersList;

  List<String> _memberIds = new List();
  bool canAddMemberId = true;

  _CommitteeState(){
    mainListViewController.addListener(() {
      if(mainListViewController.text.isEmpty){
        setState(() {
          _isSearchingInCommitteeList = true;
          _queryForSearch = "";
        });
      }else{
        setState(() {
          _isSearchingInCommitteeList = false;
          _queryForSearch = mainListViewController.text.trim();
        });
      }
    });

    _innerListViewController.addListener(() {
      if(_innerListViewController.text.isEmpty){
        setState(() {
          _isSearchingInCommitteeMembersList = true;
          _queryForSearchInnerList = "";
        });
      }else{
        setState(() {
          _isSearchingInCommitteeMembersList = false;
          _queryForSearchInnerList = _innerListViewController.text.trim();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _visible = new List();
    committeeData = fetchCommitteeData();
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
        appBar: AppBarWidget.centerTitleAppbar(context, 'Committee'),
        drawer: Drawer(
          child: SideDrawer.sideDrawer(context),
        ),
        body: MainContainerWidget(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: mediaQueryWidth * 0.45,
                          child: TextField(
                            controller: mainListViewController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                                hintText: "Search"),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/createCommittee', arguments: null);
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
                                  color: ThemeColors.appbarColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomWidgets.sizedBox(height: 20),
                  Expanded(
                    child: FutureBuilder<CommitteeList>(
                      future: committeeData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return _isSearchingInCommitteeList ? defaultCommitteeList(snapshot) : filterList(snapshot);
                        } else {
                          return Text("$_apiStatus");
                        }
                      },
                    ),
                  ),
                  /*Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          mainList(),
                          CustomWidgets.sizedBox(height: 10),
                          mainList(),
                          CustomWidgets.sizedBox(height: 10),
                          mainList(),
                          CustomWidgets.sizedBox(height: 10),
                          //mainList(),
                        ],
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Committee List View committee Members Lists
  Widget defaultCommitteeList(snapshot){
    return ListView.builder(
      itemCount: snapshot.data.committeeDataLists.length,
      itemBuilder: (context, index) {
        if(_visible.length < snapshot.data.committeeDataLists.length){
          _visible.add(false);
        }
        return committeeList(snapshot.data.committeeDataLists[index], index);
      },
    );
  }

  // Main Searching Widget For Searching in Committee
  Widget filterList(snapshot){
    _filterList = new List();
    for(int i = 0; i < snapshot.data.committeeDataLists.length; i++){
      String item = snapshot.data.committeeDataLists[i].committeeName;

      if(item.toLowerCase().contains(_queryForSearch.toLowerCase())){
        _filterList.add(snapshot.data.committeeDataLists[i]);
      }
    }
    return ListView.builder(
      itemCount: _filterList.length,
      itemBuilder: (context, index) {
        if(_visible.length < _filterList.length){
          _visible.add(false);
        }
        return committeeList(
            _filterList[index], index);
      },
    );
  }

  // Committee Members List View
  Widget defaultCommitteeMembersList(snapshot){
    return ListView.builder(
      itemCount: snapshot.data.committeeMembersLists.length,
      itemBuilder: (context, index) {
        if(canAddMemberId) {
          if (_memberIds.contains(snapshot.data.committeeMembersLists[index].id) == false) {
            _memberIds.add(snapshot.data.committeeMembersLists[index].id);
          }
        }
        WidgetsBinding.instance.addPostFrameCallback((_){
          setState(() {
            canAddMemberId = false;
          });
        });
        return committeeMembersList(
            snapshot.data.committeeMembersLists[index]);
      },
    );
  }

  // Main Searching Widget For Searching in Committee
  Widget filterMemberList(snapshot){
    _filterCommitteeMembersList = new List();
    for(int i = 0; i < snapshot.data.committeeMembersLists.length; i++){
      String item = snapshot.data.committeeMembersLists[i].committeeMemberName;

      if(item.toLowerCase().contains(_queryForSearchInnerList.toLowerCase())){
        _filterCommitteeMembersList.add(snapshot.data.committeeMembersLists[i]);
      }
    }
    return ListView.builder(
      itemCount: _filterCommitteeMembersList.length,
      itemBuilder: (context, index) {
        return committeeMembersList(_filterCommitteeMembersList[index]);
      },
    );
  }

  // Toggle For Show hide members list
  void _toggle(int index, bool visible) {
    //print(_visible.toString());
    setState(() {
      for(int i = 0; i < _visible.length; i++){
        if(i == index){
          _visible[i] = !visible;
        }else{
          _visible[i] = false;
        }
      }
    });
   // print(_visible.toString());
  }

  // Main Committee List
  Widget committeeList(CommitteeModel committeeModel, int i) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

   // List membersData = json.decode(committeeModel.associationAndMembers);
    int membersCount = 0;

    //committeeMembersData = fetchCommitteeMembersData(json.decode(committeeModel.associationAndMembers));

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Visibility(
          visible: _visible[i],
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 60),
            child: AspectRatio(
              aspectRatio: 5 / 5.5,
              child: Container(
                child: Card(
                  shape: cardDecoration,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 16, top: 16),
                          child: Container(
                            height: mediaQueryHeight * 0.045,
                            width: mediaQueryWidth * 0.5,
                            child: TextField(
                              controller: _innerListViewController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: "Search"),
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 5 / 3.8,
                          child: Container(
                            child: FutureBuilder<CommitteeMembersList>(
                              future: committeeMembersDetails,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                 /* setState(() {
                                    membersCount += 1;
                                  });
                                  print("GENKJDFBHEk");*/
                                  return _isSearchingInCommitteeMembersList ? defaultCommitteeMembersList(snapshot) : filterMemberList(snapshot);
                                } else {
                                  return Text("$_apiStatus");
                                }
                              }
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
          /*  _toggle(i, _visible.elementAt(i));
            committeeMembersDetails= fetchCommitteeMemberData(committeeModel.id);*/
            Navigator.pushNamed(context, '/createCommittee', arguments: committeeModel);
          },

          child: AspectRatio(
            aspectRatio: 5 / 1.5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Card(
                shape: cardDecoration,
                elevation: 10.0,
                //color: _visible == true ? Colors.yellow : Colors.white,
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 5 / 4.5,
                      child: Container(
                        decoration: committeeConatinerDecoration.copyWith(
                            image: DecorationImage(
                                image: AssetImage(
                                  'images/comm.jpg',
                                ),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(top: 5.0, left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      committeeModel.committeeName,
                                      style: TextStyle(
                                          fontSize: 18, letterSpacing: 1.0),
                                    ),
                                    /*SizedBox(
                                      height: 2.0,
                                    ),
                                    Text(
                                      '$membersCount Members',
                                      style: TextStyle(fontSize: 12),
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FlatButton.icon(
                                        onPressed: () {
                                          Map<String, String> arguments = {
                                            "isMap" : "true",
                                            "CommitteeId" : committeeModel.id,
                                            "CommitteeName" : committeeModel.committeeName,
                                          };
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MeetingCardCreate(data: arguments,)));
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline,
                                          color: ThemeColors.appbarColor,
                                          size: 25,
                                        ),
                                        label: Text(
                                          "Meeting",
                                          style: TextStyle(
                                              color: ThemeColors.appbarColor,
                                              fontSize: 18),
                                        )),
                                   /* FlatButton.icon(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.chat_outlined,
                                        color: ThemeColors.appbarColor,
                                        size: 25,
                                      ),
                                      label: Text(
                                        'Chat',
                                        style: TextStyle(
                                            color: ThemeColors.appbarColor,
                                            fontSize: 18),
                                      ),
                                    ),*/
                                    FlatButton.icon(
                                      onPressed: () async{
                                        exitCommittee(committeeModel.id);
                                      },
                                      icon: Icon(Icons.close,
                                          size: 25,
                                          color: ThemeColors.appbarColor),
                                      label: Text(
                                        'Exit Group',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    IconButton(
                                        icon: !_visible[i]?Icon(Icons
                                            .arrow_drop_down_circle_outlined):Icon(Icons.arrow_circle_up),
                                        onPressed: () {
                                          _toggle(i, _visible.elementAt(i));
                                          committeeMembersDetails = fetchCommitteeMemberData(committeeModel.id);
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Committee Members List
  Widget committeeMembersList(CommitteeMember committeeMembersModel) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: 50,
          width: mediaQueryWidth,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                committeeMembersModel.committeeMemberImage == ""
                    ? Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/comm.jpg'),
                        fit: BoxFit.cover),
                  ),
                )
                    : Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:committeeMembersModel.committeeMemberImage,
                    placeholder: (context, url) =>
                    new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Image.asset(
                      'images/comm.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                CustomWidgets.sizedBox(width: 20),
                Expanded(
                  child: Container(
                    child: Text(
                      "${committeeMembersModel.committeeMemberName}",
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                committeeMembersModel.id != userIDMain
                    ? FlatButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/chat');
                    },
                    icon: Icon(
                      Icons.chat,
                      color: ThemeColors.appbarColor,
                      size: 18,
                    ),
                    label: Text(
                      "Chat",
                      style: TextStyle(
                          color: ThemeColors.appbarColor, fontSize: 12),
                    )) : SizedBox(),
              ],
            ),
          ),
        ),
        Container(
          width: mediaQueryWidth * 0.4,
          height: 1.0,
          color: ThemeColors.appbarColor,
        ),
      ],
    );

  }

  // Fetching Committee List
  Future<CommitteeList> fetchCommitteeData() async {
    try{
      Map data = {
        "AssociationID": associationIdMain,
        "MemberID": userIDMain,
      };
      final response = await http.post(
        WebApis.GET_COMMITTEE_LIST_FOR_COMMITTEE_LIST_PAGE,
        body: json.encode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        Map data = WebResponseExtractor.filterWebData(response,
            dataObject: 'COMMITTEE_MEMBER_DATA', innerDataObject: "commitee_data");
        setState(() {
          _apiStatus = data['message'];
        });
        if (data["code"] == 1) {
          List globalCommitteeList = data['data'] as List;
          List<dynamic> committeeList = new List();
          for(int i = 0; i < globalCommitteeList.length; i++){
            committeeList.add(globalCommitteeList[i]['commitee_data']);
          }
          return CommitteeList.fromJson(committeeList);
        }else{
          return null;
        }
      } else {
        throw Exception('Failed to load');
      }
    }catch(e){
      print(e + " Getting some issue try again later");
      return null;
    }
  }

  Future<CommitteeMembersList> fetchCommitteeMemberData(String committeeId) async {
    try{
      Map data = {
        "AssociationID": associationIdMain,
        "CommitteeID": committeeId,
      };
      final response = await http.post(
        WebApis.COMMITTEE_MEMBER_LIST,
        body: json.encode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        Map data = WebResponseExtractor.filterWebData(response,
            dataObject: 'COMMITTEE_AND_ASSOCIATION_MEMBERS', innerDataObject: "");
        setState(() {
          _apiStatus = data['message'];

        });
        if (data["code"] == 1) {
         // List<Map<String,dynamic>> membersList= data['data'];
         // print("committee data:"+data['data'].toString());

        return CommitteeMembersList.fromJson(data['data']);
        }else{
          return null;
        }
      } else {
        throw Exception('Failed to load');
      }
    }catch(e){
      print(e + " Getting some issue try again later");
      return null;
    }
  }

  void exitCommittee(String committeeID) async{
    try{
      Map data = {
        "AssociationId": associationIdMain,
        "Committee_ID":committeeID,
        "MemberID": userIDMain,
      };
      final response = await http.post(
        WebApis.EXIT_COMMITTEE_MEMBER,
        body: json.encode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        Map data = WebResponseExtractor.filterWebData(response, isSubmit: true);
        if (data["code"] == 1) {
          Navigator.of(context).pushNamed('/committee');
          //Navigator.pushReplacementNamed(context, '/opinionPollSummary');
        }
      }
    }catch(e){
      print(e + " Getting some issue try again later");
      return null;
    }
  }
  // Fetching Committee Members List

}

/*
  Future<CommitteeMembersList> fetchCommitteeMembersData(List<dynamic> dataList) async {
    try{
      return CommitteeMembersList.fromJson(dataList);
    }catch(e){
      print("Getting some issue try again later");
      return null;
    }
  }*/
