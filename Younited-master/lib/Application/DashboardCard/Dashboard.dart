import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Models/UserModel.dart';
import 'package:younited_application/Services/UserDataPreferences.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/AppAssets.dart';
import 'package:younited_application/Utils/Common.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  var args;
  Dashboard(this.args);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<User> userList;
  final _auth = FirebaseAuth.instance;

  String _apiStatus = "Loading...";
  int userId;
  String associationId = "...";
  String associationName = "...";
  String designationId = "...";
  String designationName="";
  String name = "...";
  String email = "...";
  String mobileNumber = "...";
  String address1 = "...";
  String address2 = "...";
  String area = "...";
  String profileImage ='';
  String coverImage ='';
  String companyImage='';
  String userPin = '';


  double profileCompleteBar = 0.0;
  var data;

  FirebaseUser loggedUser;

  @override
  void initState() {
    super.initState();
    if(widget.args == null) {
      data = {
        "userId" : userIDMain,
        "associationId" : associationIdMain,
        "associationName" : associationNameMain,
      };
    }else{
      data = widget.args;
    }
    fetchUserList(data['userId'], data['associationId']);
      associationName = data['associationName'];
  }

  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: Common.canGoBack,
      child: Scaffold(
        backgroundColor: ThemeColors.appbarColor,
        appBar: AppBarWidget.logoAppbar(context, 'Card'), // Page Name Here
        drawer: Drawer(
          child: SideDrawer.sideDrawer(context),
        ),
        body: MainContainerWidget(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed('/dashboardEditCard', arguments: data);
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Text(
                                'Update',
                                style: TextStyle(color: ThemeColors.blackText),
                              ),
                            ),
                          ),
                        ),
                        CustomWidgets.sizedBox(height: 5.0),
                        Text('${profileCompleteBar.toStringAsFixed(2)}%', style: TextStyle(color: ThemeColors.appbarColor),),
                        CustomWidgets.sizedBox(height: 5.0),
                        LinearPercentIndicator(
                          width: mediaQueryWidth * 0.88,
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 8.0,
                          percent: (profileCompleteBar / 100).roundToDouble(),
                          linearStrokeCap: LinearStrokeCap.butt,
                          progressColor: ThemeColors.appbarColor,
                        ),
                        CustomWidgets.sizedBox(height: 5.0),
                        Text('Profile Completion Bar', style: TextStyle(color: ThemeColors.blackText),),
                        CustomWidgets.sizedBox(height: 5.0),
                        Container(
                          width: double.infinity,
                          height: mediaQueryHeight * 0.60,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            shadowColor: ThemeColors.shadowColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.topCenter,
                                  overflow: Overflow.visible,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 4 / 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                              image: coverImage==""?AssetImage(
                                                '${AppAssets.comm}',
                                              ):NetworkImage(coverImage),
                                              fit: BoxFit.cover),
                                        ),
                                        width: mediaQueryWidth,
                                      ),
                                    ),
                                    Positioned(
                                      top: mediaQueryHeight * 0.18,
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(50.0),
                                          ),
                                          elevation: 15,
                                          shadowColor: ThemeColors.shadowColor,
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(50.0),
                                            child: profileImage==""|| profileImage=="0"?Image.asset(
                                                '${AppAssets.profileImage}'):Image.network(profileImage),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //Image.asset('${AppAssets.profileImage}'),
                                CustomWidgets.sizedBox(height: 50.0),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: companyImage=="" || companyImage=="0"?Image.asset(
                                          AppAssets.youLogoO,
                                          width: 50,
                                          height: 50,
                                        ):Container(
                                          height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50.0),
                                              image: DecorationImage(image: NetworkImage(companyImage),fit: BoxFit.cover)
                                            ),
                                            ),
                                      ),
                                      CustomWidgets.sizedBox(height: 5),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            associationName.toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: ThemeColors.blackText),
                                          )),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(designationName.toString())),
                                      CustomWidgets.sizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    size: 20,
                                                  ),
                                                  CustomWidgets.sizedBox(
                                                      width: 5.0),
                                                  Align(
                                                      alignment:
                                                      Alignment.topLeft,
                                                      child: Text(
                                                          address1.toString())),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  CustomWidgets.sizedBox(
                                                      width: 25),
                                                  Align(
                                                      alignment:
                                                      Alignment.topLeft,
                                                      child: Text(
                                                          address2.toString())),
                                                ],
                                              ),
                                              CustomWidgets.sizedBox(height: 2),
                                              Row(
                                                children: [
                                                  CustomWidgets.sizedBox(
                                                      width: 25),
                                                  Align(
                                                      alignment:
                                                      Alignment.topLeft,
                                                      child:
                                                      Text(area.toString())),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    size: 20,
                                                  ),
                                                  CustomWidgets.sizedBox(
                                                      width: 5.0),
                                                  Align(
                                                      alignment:
                                                      Alignment.topLeft,
                                                      child: Text(mobileNumber
                                                          .toString())),
                                                ],
                                              ),
                                              CustomWidgets.sizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.mail_outline,
                                                    size: 20,
                                                  ),
                                                  CustomWidgets.sizedBox(
                                                      width: 5.0),
                                                  Align(
                                                      alignment:
                                                      Alignment.topLeft,
                                                      child:
                                                      Text(email.toString())),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: ThemeColors.greyText,
                    width: double.infinity,
                  ),
                  CustomWidgets.sizedBox(height: 15),
                  GestureDetector(
                    onTap: (){
                      new UserDataPreferences().clearAllData();
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Container(
                      child: Text('Log Out', style: TextStyle(fontSize: 18, color: ThemeColors.greyText),) ,
                    ),
                  ),
                  //Center(child: Text('Log Out', style: TextStyle(fontSize: 18, color: ThemeColors.greyText),)),
                  CustomWidgets.sizedBox(height: 15),
                ],
              ),

            ), /* Your Widget Here */
          ),
        ),
      ),
    );
  }

  fetchUserList(String userId, String associationId) async {
    try{
      Map data = {
        "AssociationID": "$associationId",
        "user_id": "$userId"
      };

      final response = await http.post(
        WebApis.GET_USER_BY_ASS_ID,
        body: json.encode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        Map data = WebResponseExtractor.filterWebData(response,
            dataObject: 'USER_DATA');
        setState(() {
          _apiStatus = data['message'];
          associationId = data['data']['AssociationID'];
          designationId = data['data']['DesignationID'];
          designationName = data['data']['DesignationName'] ?? "";
          associationName = data['data']['AssociationName'] ?? "";
          address1 = data['data']['Address1'] ?? "";
          address2 = data['data']['Address2'];
          userNameMain = data['data']['FirstName'] ?? "";
          area = data['data']['Area'] ?? "";
          mobileNumber = data['data']['PrimaryNumber'] ?? "";
          email = data['data']['Email'] ?? "";
          profileImage = data['data']['UserProfileImage'] ?? "";
          userImageLinkMain = data['data']['UserProfileImage'] ?? "";
          coverImage = data['data']['UserCoverImage'] ?? "";
          companyImage=data['data']['CompanyImage'] ?? "";
          userPin = data['data']['pin'] ?? "";
          String joinOn = data['data']['JoinedOn'] ?? "";
          String dateOfBirth = data['data']['DateOfBirth'] ?? "";
          String membershipType = data['data']['MembershipType'] ?? "";
          String membershipTenure = data['data']['MembershipTenure'] ?? "";
          String aboutUser = data['data']['AboutUser'] ?? "";

          if(designationName.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(associationName.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(address1.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(userNameMain.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(mobileNumber.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(email.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(profileImage.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(userImageLinkMain.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(coverImage.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(companyImage.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(joinOn.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(dateOfBirth.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(membershipType.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(membershipTenure.isNotEmpty){
            profileCompleteBar += 6.66;
          }
          if(aboutUser.isNotEmpty){
            profileCompleteBar += 7.0;
            if(profileCompleteBar > 99.0 && profileCompleteBar > 100.0){
              profileCompleteBar = 100.0;
            }
          }

        });
        registerUserToFirebase();
        // return User.fromJson(data['data']);
      } else {
        throw Exception('failed to load');
      }
    }catch(e){
      print(e.toString());
    }

  }

  void registerUserToFirebase() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("userEmail") == null) {
      sharedPreferences.setString("userEmail", email);
      try {
        // Register to firebase
        final newUser = await _auth
            .createUserWithEmailAndPassword(
            email: email, password: userPin);
        loggedUser = await _auth.currentUser();
        if (newUser != null) {
          Firestore.instance
              .collection('user')
              .document(loggedUser.uid)
              .setData({
            'id': loggedUser.uid,
            'email': email,
            'name':userNameMain,
            'userProfileImage':profileImage,
          });
         /* final tokenResult = await FirebaseAuth.instance.currentUser();
          final idToken = await tokenResult.getIdToken();
          final token = idToken.token;
          print("Token ID:"+token.toString());*/
        }
      } catch (e) {
        print(e);
      }
      // print(data.toString());
    } else {
      //login from firebase
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: userPin);
      if (user != null){
       /* final tokenResult = await FirebaseAuth.instance.currentUser();
        final idToken = await tokenResult.getIdToken();
        final token = idToken.token;
        print("Token ID:"+token.toString());*/

        //Navigator.of(context).pushNamed('/dashboard');
      }
    }
  }

}
