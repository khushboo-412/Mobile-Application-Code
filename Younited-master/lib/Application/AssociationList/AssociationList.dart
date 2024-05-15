import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/Application/AssociationList/AssociationListModel.dart';
import 'package:younited_application/Utils/AppAssets.dart';
import 'package:younited_application/Utils/Common.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/main.dart';
FirebaseUser loggedUser;
class AssociationList extends StatefulWidget {
  final args;

  AssociationList(this.args);

  @override
  _AssociationListState createState() => _AssociationListState();
}

class _AssociationListState extends State<AssociationList> {
  final _auth = FirebaseAuth.instance;
  Future<AssociationListModel> associationListData;
  String _apiStatus = "Loading...";
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = widget.args as List;
    associationListData = associationList();
  }

  Future<AssociationListModel> associationList() async {
    return AssociationListModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: Common.canGoBack,
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: new AssetImage('${AppAssets.loginBackground}'),
                  fit: BoxFit.cover)),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                alignment: Alignment.center,
                color: Colors.grey.withOpacity(0.34),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset('${AppAssets.youLogo}'),
                              Align(
                                child: Text('Select Association',
                                    style: TextStyle(
                                      color: ThemeColors.whiteText,
                                      fontSize: 25.0,
                                    ),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomWidgets.sizedBox(height: 100.0),
                      Expanded(
                        child: FutureBuilder<AssociationListModel>(
                          future: associationListData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot != null) {
                              return ListView.builder(
                                itemCount: snapshot.data.association.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async{
                                      loggedUser = await _auth.currentUser();
                                     // print(snapshot.data.association[index].toString());
                                      Map data = {
                                        "userId": snapshot
                                            .data.association[index].userId,
                                        "associationId": snapshot.data
                                            .association[index].associationId,
                                        "associationName": snapshot.data
                                            .association[index].associationName,
                                      };
                                      setState(() {
                                        userIDMain = snapshot
                                            .data.association[index].userId;
                                        associationIdMain = snapshot.data
                                            .association[index].associationId;
                                        associationNameMain = snapshot.data
                                            .association[index].associationName;
                                      });
                                      Navigator.of(context).pushNamed(
                                          '/dashboard',
                                          arguments: data);
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Container(
                                        width: mediaQueryWidth,
                                        height: mediaQueryHeight * 0.07,
                                        decoration: BoxDecoration(
                                          color: ThemeColors.whiteText,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                AppAssets.youLogoO,
                                                width: 35,
                                                height: 35,
                                              ),
                                              CustomWidgets.sizedBox(width: 10),
                                              Align(
                                                alignment: AlignmentDirectional.centerStart,
                                                child: Text(
                                                  '${snapshot.data.association[index].associationName}',
                                                  style: TextStyle(
                                                      color: ThemeColors.blackText,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Text("$_apiStatus",
                                  style:
                                      TextStyle(color: ThemeColors.whiteText));
                            }
                          },
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
    );
  }


}

/* CustomWidgets.sizedBox(height: 100.0),
                        Container(
                          width: mediaQueryWidth,
                          height: mediaQueryHeight * 0.07,
                          decoration: BoxDecoration(
                            color: ThemeColors.whiteText,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                            child: Text('Association Name', style: TextStyle(color: ThemeColors.blackText, fontSize: 15),),
                          ),
                        ),*/
