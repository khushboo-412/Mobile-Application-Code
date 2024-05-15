import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Committee/CommitteeMemberModel.dart';
import 'package:younited_application/Models/CommitteeMember.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Utils/Constaints.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:http/http.dart' as http;
import 'package:younited_application/main.dart';

import 'CommitteeModel.dart';

List<bool> isNotAdd;
List<Map<String, dynamic>> memberList;

// ignore: must_be_immutable
class CreateCommittee extends StatefulWidget {
  CommitteeModel committeeModel;

  CreateCommittee(this.committeeModel);

  @override
  _CreateCommitteeState createState() => _CreateCommitteeState(committeeModel);
}

var now = DateTime.now();

class _CreateCommitteeState extends State<CreateCommittee> {

  CommitteeModel committeeModel;


  List<String> _membersId = new List();
  final _formKey = GlobalKey<FormState>();
  Future<CommitteeMemberList> committeeMemberData;
  String _apiStatus = "Loading...";
  List<TextEditingController> _createCommitteeController = [
    for (int i = 0; i < 2; i++) TextEditingController()
  ];
  List<dynamic> committeeMembers;
  bool _isSearchingInCommitteeMember = true;
  TextEditingController memberListController = new TextEditingController();

  List<CommitteeMemberModel> _filterList;
  Future<CommitteeMembersList> committeeMembersDetails;
  String _queryForSearch;

  _CreateCommitteeState(this.committeeModel) {
    memberListController.addListener(() {
      if (memberListController.text.isEmpty) {
        setState(() {
          _isSearchingInCommitteeMember = true;
          _queryForSearch = "";
        });
      } else {
        setState(() {
          _isSearchingInCommitteeMember = false;
          _queryForSearch = memberListController.text.trim();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    memberList = new List();
    isNotAdd = new List();
    if(committeeModel != null) {
      committeeMembersDetails = fetchCommitteeMemberData(committeeModel.id).then((value) {
        CommitteeMembersList committeeMembersList = value;
        for(int i = 0; i < committeeMembersList.committeeMembersLists.length; i++){
          _membersId.add(committeeMembersList.committeeMembersLists[i].id);
          print("Member ID :  ${committeeMembersList.committeeMembersLists[i].id}");
        }
        return;
      });
      setState(() {
        _createCommitteeController
            .elementAt(0)
            .text = committeeModel.committeeName;
        _createCommitteeController
            .elementAt(1)
            .text = committeeModel.validTill.split(" ")[0];
      });
    }
    committeeMemberData = fetchAssociationMemberData();
    /*if (committeeModel != null) {
      committeeMembersDetails = fetchCommitteeMemberDetails(widget.id);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: ThemeColors.appbarColor,
      appBar: AppBarWidget.centerTitleAppbar(context, committeeModel == null ? 'Create Committee' : 'Update Committee'),
      body: MainContainerWidget(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Container(
            height: mediaQueryHeight,
            width: mediaQueryWidth,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                          committeeModel == null ? "Create" : "Update",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      width: mediaQueryWidth,
                      child: Card(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
                        shape: eventsCardDecoration,
                        elevation: 10.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          child: Column(
                            children: [
                              Container(
                                width: mediaQueryWidth,
                                child: Row(
                                  children: [
                                    Container(
                                      width: mediaQueryWidth * 0.2,
                                      child: Text(
                                        "Committee Name",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 25,
                                        child: TextFormField(
                                          controller: _createCommitteeController
                                              .elementAt(0),
                                          decoration: InputDecoration(
                                            hintText: "Group Name",
                                            contentPadding: EdgeInsets.only(
                                                left: 5.0, top: 2.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomWidgets.sizedBox(height: 10.0),
                              Container(
                                height: 50,
                                width: mediaQueryWidth,
                                child: Row(
                                  children: [
                                    Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        width: mediaQueryWidth * 0.2,
                                        child: Text(
                                          "Valid Till",
                                          style: TextStyle(fontSize: 12.0),
                                        )),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: mediaQueryWidth * 0.5,
                                        child: TextFormField(
                                          controller: _createCommitteeController
                                              .elementAt(1),
                                          maxLength: 10,
                                          onTap: () {
                                            FocusScope.of(context)
                                                .requestFocus(new FocusNode());
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 5, top: 5, bottom: 5),
                                            hintStyle: TextStyle(fontSize: 12),
                                            hintText: "yyyy-mm-dd",
                                            isDense: true,
                                            counter: SizedBox(),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    CustomWidgets.sizedBox(width: 2.0),
                                    GestureDetector(
                                      onTap: () async {
                                        FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                        CustomWidgets.pickDate(context)
                                            .then((value) {
                                          _createCommitteeController
                                              .elementAt(1)
                                              .text = value;
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.calendar_today_outlined,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomWidgets.sizedBox(height: 5.0),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 10.0, 8.0, 2.0),
                                child: Container(
                                  width: mediaQueryWidth,
                                  height: 25,
                                  //color: Colors.grey,
                                  child: Container(
                                      child: Text(
                                    "Add Members",
                                    style: TextStyle(fontSize: 12.0),
                                  )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: mediaQueryWidth,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Card(
                                    elevation: 10.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, bottom: 10, top: 10),
                                          child: Container(
                                            height: mediaQueryHeight * 0.04,
                                            width: 200,
                                            child: TextField(
                                              controller: memberListController,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(8),
                                                  isDense: true,
                                                  prefixIcon:
                                                      Icon(Icons.search),
                                                  hintText: "Search"),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: FutureBuilder<
                                              CommitteeMemberList>(
                                            future: committeeMemberData,
                                            builder: (context, snapshot) {
                                              //print(snapshot);
                                              if (snapshot.hasData) {
                                                return _isSearchingInCommitteeMember
                                                    ? defaultCommitteeMembersList(
                                                        snapshot)
                                                    : filterList(snapshot);
                                              } else {
                                                return Center(
                                                    child: Text("$_apiStatus"));
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: mediaQueryHeight * 0.05,
                                width: mediaQueryWidth * 0.5,
                                margin: EdgeInsets.symmetric(vertical: 22),
                                child: committeeModel == null
                                    ? RaisedButton(
                                        shape: new RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.amber[400],
                                                style: BorderStyle.solid),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text(
                                          'Create Committee',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                        color: Colors.amber[400],
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            _formKey.currentState.save();
                                            if (_createCommitteeController
                                                .elementAt(0)
                                                .text
                                                .isEmpty) {
                                              WebResponseExtractor.showToast(
                                                  "Committee name required");
                                            } else if (_createCommitteeController
                                                .elementAt(1)
                                                .text
                                                .isEmpty) {
                                              WebResponseExtractor.showToast(
                                                  "Valid date required");
                                            } else if (memberList.length == 0) {
                                              WebResponseExtractor.showToast(
                                                  "Select Committee Members");
                                            } else {
                                              createCommittee();
                                            }
                                          }
                                        })
                                    : RaisedButton(
                                        shape: new RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.amber[400],
                                                style: BorderStyle.solid),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text(
                                          'Update Committee',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                        color: Colors.amber[400],
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            _formKey.currentState.save();
                                            if (_createCommitteeController
                                                .elementAt(0)
                                                .text
                                                .isEmpty) {
                                              WebResponseExtractor.showToast(
                                                  "Committee name required");
                                            }
                                            else if (_createCommitteeController
                                                .elementAt(1)
                                                .text
                                                .isEmpty) {
                                              WebResponseExtractor.showToast(
                                                  "Valid date required");
                                            }
                                            else if (memberList.length == 0) {
                                              if(committeeModel == null) {
                                                WebResponseExtractor.showToast(
                                                    "Select Meeting Members");
                                              }else{
                                                updateCommittee(committeeModel);
                                              }
                                            } else {
                                              updateCommittee(committeeModel);
                                            }
                                          }
                                        }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  // Default Members List
  Widget defaultCommitteeMembersList(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.committeeMemberDataLists.length,
      itemBuilder: (context, index) {
        if (isNotAdd.length < snapshot.data.committeeMemberDataLists.length) {
          isNotAdd.add(true);
        }
        return CommitteeInnerMembers(snapshot.data.committeeMemberDataLists[index], committeeModel, index, _membersId);
      },
    );
  }

  // Filter Member List
  Widget filterList(snapshot) {
    _filterList = new List();
    for (int i = 0; i < snapshot.data.committeeMemberDataLists.length; i++) {
      String item = snapshot.data.committeeMemberDataLists[i].memberName;
      if (item.toLowerCase().contains(_queryForSearch.toLowerCase())) {
        _filterList.add(snapshot.data.committeeMemberDataLists[i]);
      }
    }
    return ListView.builder(
      itemCount: _filterList.length,
      itemBuilder: (context, index) {
        if (isNotAdd.length < _filterList.length) {
          isNotAdd.add(true);
        }
        return CommitteeInnerMembers(snapshot.data.committeeMemberDataLists[index], committeeModel, index, _membersId);
      },
    );
  }

  // Getting Member List
  Future<CommitteeMemberList> fetchAssociationMemberData() async {
    Map data = {
      "AssociationID": 6,
    };
    final response = await http.post(
      WebApis.GET_ASSOCIATION_MEMBER,
      body: json.encode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      Map data =
          WebResponseExtractor.filterWebData(response, dataObject: 'USER_LIST');
      setState(() {
        _apiStatus = data['message'];
      });
      if (data["code"] == 1) {
        return CommitteeMemberList.fromJson(data['data']);
      }
    } else {
      throw Exception('failed to load');
    }
  }

  // Creating Committee
  void createCommittee() async {
    if (memberList.isNotEmpty) {
      try {
        Map data = {
          "user_id": userIDMain,
          "AssociationId": associationIdMain,
          "CommitteeName": _createCommitteeController.elementAt(0).text,
          "ValidTill": _createCommitteeController.elementAt(1).text,
          "AssocationAndMeberes": memberList
        };

        final response = await http.post(
          WebApis.CREATE_COMMITTEE,
          body: json.encode(data),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          },
        );
        if (response.statusCode == 200) {
          Map data =
              WebResponseExtractor.filterWebData(response, isSubmit: true);
          if (data["code"] == 1) {
            WebResponseExtractor.showToast("Committee Created Successfully");
            Navigator.pushReplacementNamed(context, '/committee');
          }
        } else {
          //WebResponseExtractor.showToast("Getting Server Issue");
          throw Exception('Failed to load');
        }
      } catch (e) {
        print("Getting some issue try again later");
      }
    } else {
      WebResponseExtractor.showToast("Please Select Members");
    }
  }

  void updateCommittee(CommitteeModel committeeModel) async {
    try {
      Map data = {
        "committeeId": committeeModel.id,
        "UpdatedBy": userIDMain,
        "CommitteeName": _createCommitteeController.elementAt(0).text,
        "ValidTill": _createCommitteeController.elementAt(1).text,
      };

      final response = await http.post(
        WebApis.COMMITTEE_UPDATE,
        body: json.encode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        Map data = WebResponseExtractor.filterWebData(response, isSubmit: true);

        setState(() {
          _apiStatus = data['message'];
        });

        if (data["code"] == 1) {
          WebResponseExtractor.showToast("Update Committee");
          Navigator.pushReplacementNamed(context, '/committee');
          // List<Map<String,dynamic>> membersList= data['data'];

          //print("committee data:"+committeeMembers.toString());

          // return CommitteeMembersList.fromJson(data['data']);
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
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


}

// ignore: must_be_immutable
class CommitteeInnerMembers extends StatefulWidget {
  CommitteeMemberModel memberData;
  CommitteeModel committeeModel;
  int index;
  List<String> _membersId;

  CommitteeInnerMembers(this.memberData, this.committeeModel, this.index, this._membersId);

  @override
  _CommitteeInnerMembersState createState() => _CommitteeInnerMembersState(memberData, committeeModel, index, _membersId);
}

class _CommitteeInnerMembersState extends State<CommitteeInnerMembers> {
  CommitteeMemberModel memberData;
  CommitteeModel committeeModel;
  int index;
  List<String> _membersId;

  _CommitteeInnerMembersState(this.memberData, this.committeeModel, this.index, this._membersId);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if(_membersId.contains(memberData.id) == true){
        isNotAdd[index] = false;
        //print(isNotAdd.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: 50,
          width: mediaQueryWidth,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                memberData.userProfileImage == ""
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
                    imageUrl: memberData.userProfileImage,
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
                      memberData.memberName,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Container(
                  height: mediaQueryHeight * 0.035,
                  width: mediaQueryWidth * 0.2,
                  child: isNotAdd.elementAt(index)
                      ? addButton(memberData, index)
                      : removeButton(memberData, index),
                ),
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

  //add button
  Widget addButton(CommitteeMemberModel memberData, int i) {
    // print("jsjjsjsj:"+memberData.memberName);
    return RaisedButton(
        shape: new RoundedRectangleBorder(
            side:
            BorderSide(color: Colors.amber[400], style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          'Add',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        color: Colors.amber[400],
        onPressed: () {
          if(committeeModel != null){
            // Todo :: Remove From Committee
            _addMemberFromCommittee(memberData, i);
          }else {
            updateMemberInviteStatus(memberData, i);
          }
        });
  }

  //remove button
  Widget removeButton(CommitteeMemberModel memberData, int i) {
    // print("jsjjsjsj:"+memberData.memberName);
    return RaisedButton(
        shape: new RoundedRectangleBorder(
            side: BorderSide(
                color: ThemeColors.appbarColor, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          'Remove',
          style: TextStyle(color: Colors.white, fontSize: 11),
        ),
        color: ThemeColors.appbarColor,
        onPressed: () {
          if(committeeModel != null){
            // Todo :: Remove From Committee
            _removeMemberFromCommittee(memberData, i);
          }else {
            updateMemberInviteStatus(memberData, i);
          }
        });
  }


  // Update Member Invite Status
  dynamic updateMemberInviteStatus(CommitteeMemberModel memberDataList, int i) {
    if (isNotAdd.elementAt(i) == true) {
      Map<String, String> memberData = {
        "MemberId": memberDataList.id,
        "MemberName": memberDataList.memberName
      };
      //  print("user data:"+memberData.toString());
      /* Map<int, Map<String, String>> memberIndex = {
        i: memberData,
      };*/
      memberList.add(memberData);
      setState(() {
        isNotAdd[i] = false;
      });
      print("add" + memberList.toString());
    } else {
      memberList.removeWhere((element) =>
      element.values.elementAt(0) == memberDataList.id); // Test It Now
      setState(() {
        isNotAdd[i] = true;
      });
      print("remove" + memberList.toString());
    }
  }

  void _removeMemberFromCommittee(CommitteeMemberModel memberData, int i) async{
    try{
      Map data = {
        "AssociationId": associationIdMain,
        "Committee_ID":committeeModel.id,
        "MemberID": memberData.id,
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
          WebResponseExtractor.showToast(data["message"]);
          setState(() {
            isNotAdd[i] = true;
          });
        }
      }
    }catch(e){
      print(e + " Getting some issue try again later");
      return null;
    }
  }

  void _addMemberFromCommittee(CommitteeMemberModel memberData, int i) async{
    try{
      Map data = {
        "AssociationID": associationIdMain,
        "Committee_ID":committeeModel.id,
        "MemberID": memberData.id,
        "MemberName": memberData.memberName,
      };
      final response = await http.post(
        WebApis.ADD_COMMITTEE_MEMBER,
        body: json.encode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        Map data = WebResponseExtractor.filterWebData(response, isSubmit: true);
        if (data["code"] == 1) {
          WebResponseExtractor.showToast(data["message"]);
          setState(() {
            isNotAdd[i] = false;
          });
        }
      }
    }catch(e){
      print(e + " Getting some issue try again later");
      return null;
    }
  }

}



/*  void addCommitteeMember(CommitteeMemberModel committeeMemberModel) async{
    try {
      Map data = {
        "AssociationID": associationIdMain,
        "Committee_ID": committeeModel.id,
        "MemberID":committeeMemberModel.id,
        "MemberName":   committeeMemberModel.memberName,
      };
      final response = await http.post(
        WebApis.ADD_COMMITTEE_MEMBER,
        body: json.encode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        Map data = WebResponseExtractor.filterWebData(response,
            isSubmit:true);

        setState(() {
          _apiStatus = data['message'];
        });
        if (data["code"] == 1) {
          //WebResponseExtractor.showToast("Add Members");
          // return CommitteeMembersList.fromJson(data['data']);
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      print(e + " Getting some issue try again later");
      return null;
    }
  }
  void removeCommitteeMember(CommitteeMemberModel committeeMemberModel) async{
    try{
      Map data = {
        "AssociationId": associationIdMain,
        "Committee_ID":committeeModel.id,
        "MemberID": committeeMemberModel.id,
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
          //Navigator.of(context).pushNamed('/committee');
          //Navigator.pushReplacementNamed(context, '/opinionPollSummary');
        }
      }
    }catch(e){
      print(e + " Getting some issue try again later");
      return null;
    }
  }*/

/*if(committeeModel != null){
      List<dynamic> newMemberList = json.decode(committeeModel.associationAndMembers);
     */
/* for(int i = 0; i < newMemberList.length; i++){
        Map<String, dynamic> oldMembersData = newMemberList[i];
        memberList.add(oldMembersData);
      }*//*
      */
/*for(int i = 0; i < isNotAdd.length; i++){
        for(int j = 0; j < memberList.length; j++){
          if(memberList[j]['MemberId'] == memberData.id){
              isNotAdd[i] = false;
          }else{
            isNotAdd[i] = true;
          }
        }
        print(i.toString());
      }*//*
    }*/
//print(isNotAdd.toString());

/*
  Future<CommitteeMembersList> fetchCommitteeMemberDetails(String id) async {
    try {
      Map data = {
        "AssociationID": associationIdMain,
        "CommitteeID": id,
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
            dataObject: 'COMMITTEE_DATA', innerDataObject: "");
        Map committeesData = WebResponseExtractor.filterWebData(response,
            dataObject: 'COMMITTEE_AND_ASSOCIATION_MEMBERS',
            innerDataObject: "");
        setState(() {
          _apiStatus = data['message'];
        });
        if (data["code"] == 1) {
          // List<Map<String,dynamic>> membersList= data['data'];

          _createCommitteeController.elementAt(0).text =
              data['data']['CommitteeName'];
          _createCommitteeController.elementAt(1).text =
              data['data']['ValidTill'].toString().split(" ")[0];
          committeeMembers = committeesData['data'];
          //print("committee data:"+committeeMembers.toString());

          // return CommitteeMembersList.fromJson(data['data']);
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      print(e + " Getting some issue try again later");
      return null;
    }
  }*/


/*memberID*/