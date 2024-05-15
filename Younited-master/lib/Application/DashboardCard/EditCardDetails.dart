import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/AppAssets.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ListItem.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:http/http.dart' as http;

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:younited_application/main.dart';
FirebaseUser loggedUser;
// ignore: must_be_immutable
class EditCardDetails extends StatefulWidget {
  var args;

  EditCardDetails(this.args);

  @override
  _EditCardDetailsState createState() => _EditCardDetailsState();
}

class _EditCardDetailsState extends State<EditCardDetails> {
  final _auth = FirebaseAuth.instance;
  String _apiStatus = "Loading...";
  int userId;
  String associationId;
  String associationName;
  String designationId;
  String companyName;
  String name;
  String email;
  String mobileNumber;
  String address1;
  String address2;
  String area;
  String membershipTennure;
  String about;
  String membershipId;
  String membershipType;
  String coverImage = "";
  String companyImage="";
  DateTime pickDate;
  TimeOfDay time;
  File imageFile;
  String fileName;
  String profileImage = "";

  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  List<TextEditingController> _updateProfileController = [
    for (int i = 0; i < 12; i++) TextEditingController()
  ];

  var data;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    pickDate = DateTime.now();
    time = TimeOfDay.now();
    data = widget.args;
    fetchUserList(data['userId'], data['associationId']);
    setState(() {
      associationName = data['associationName'];
    });
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final EdgeInsets viewPadding = EdgeInsets.fromLTRB(20.0, 2.0, 8.0, 2.0);

    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pushNamed('/dashboard', arguments: data);


      },
      child: Scaffold(
        backgroundColor: ThemeColors.appbarColor,
        appBar: AppBarWidget.centerTitleAppbar(context, 'Edit Card Update'),
        drawer: Drawer(
          child: SideDrawer.sideDrawer(context),
        ),
        body: MainContainerWidget(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(
              children: [
                Column(
                  children: [

                    Text(
                      '50%',
                      style: TextStyle(color: ThemeColors.appbarColor),
                    ),
                    CustomWidgets.sizedBox(height: 2.0),
                    LinearPercentIndicator(
                      width: mediaQueryWidth * 0.88,
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 8.0,
                      percent: 0.5,
                      linearStrokeCap: LinearStrokeCap.butt,
                      progressColor: ThemeColors.appbarColor,
                    ),
                    CustomWidgets.sizedBox(height: 5.0),
                    Text(
                      'You are almost done',
                      style: TextStyle(color: ThemeColors.blackText),
                    ),
                    CustomWidgets.sizedBox(height: 2.0),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 5,
                      shadowColor: ThemeColors.shadowColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Container(
                            child: Padding(
                              padding: viewPadding,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Edit Details',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    child: Text(
                                      "Personal Details",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.0,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  CustomWidgets.sizedBox(height: 20),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 25,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: Text(
                                                "Name",
                                                style: TextStyle(fontSize: 12.0),
                                              )),
                                        ),
                                        CustomWidgets.sizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 25,
                                            child: TextFormField(
                                              controller: _updateProfileController
                                                  .elementAt(0),
                                              decoration: InputDecoration(
                                                hintText: "Full Name",
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
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 25,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: Text(
                                                "Company Name",
                                                style: TextStyle(fontSize: 12.0),
                                              )),
                                        ),
                                        CustomWidgets.sizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 25,
                                            child: TextFormField(
                                              controller: _updateProfileController
                                                  .elementAt(1),
                                              decoration: InputDecoration(
                                                hintText: "Company Name",
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
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 25,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: Text(
                                                "Designation",
                                                style: TextStyle(fontSize: 12.0),
                                              )),
                                        ),
                                        CustomWidgets.sizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 25,
                                            child: TextFormField(
                                              controller: _updateProfileController
                                                  .elementAt(2),
                                              decoration: InputDecoration(
                                                hintText: "Designation",
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
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 25,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: Text(
                                                "Mobile No",
                                                style: TextStyle(fontSize: 12.0),
                                              )),
                                        ),
                                        CustomWidgets.sizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 25,
                                            child: TextFormField(
                                              controller: _updateProfileController
                                                  .elementAt(3),
                                              decoration: InputDecoration(
                                                hintText: "Mobile",
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
                                              keyboardType: TextInputType.number,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    10),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.center,
                                    width: mediaQueryWidth,
                                    height: 25,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: Text(
                                                "Email",
                                                style: TextStyle(fontSize: 12.0),
                                              )),
                                        ),
                                        CustomWidgets.sizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 25,
                                            child: TextFormField(
                                              controller: _updateProfileController
                                                  .elementAt(4),
                                              decoration: InputDecoration(
                                                hintText: "Email",
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
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 50,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Address",
                                                style: TextStyle(fontSize: 12.0),
                                              )),
                                        ),
                                        CustomWidgets.sizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 60,
                                            child: TextFormField(
                                              controller: _updateProfileController
                                                  .elementAt(5),
                                              maxLines: 5,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5.0, top: 10.0),
                                                hintText: "Address",
                                                filled: true,
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
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 25,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: Text(
                                                "Date of Birth",
                                                style: TextStyle(fontSize: 12.0),
                                              )),
                                        ),
                                        CustomWidgets.sizedBox(width: 15.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 25,
                                            child: TextFormField(
                                              onTap:()async{
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                    new FocusNode());
                                              },
                                              controller: _updateProfileController
                                                  .elementAt(6),

                                              decoration: InputDecoration(
                                                hintText: "dd/mm/yyyy",
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
                                        CustomWidgets.sizedBox(width: 2.0),
                                         GestureDetector(
                                          onTap:() async
                                          {
                                            FocusScope.of(context)
                                                .requestFocus(
                                                new FocusNode());
                                            CustomWidgets.pickDate(context)
                                                .then((value) {
                                              _updateProfileController
                                                  .elementAt(6)
                                                  .text = value;
                                            });
                                          },
                                          child: Icon(
                                            Icons.calendar_today_outlined,
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 25,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: Text(
                                                "Anniversary",
                                                style: TextStyle(fontSize: 12.0),
                                              )),
                                        ),
                                        CustomWidgets.sizedBox(width: 15.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 25,
                                            child: TextFormField(
                                              onTap:()async{
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                    new FocusNode());
                                              },
                                              controller: _updateProfileController
                                                  .elementAt(7),

                                              decoration: InputDecoration(
                                                hintText: "dd/mm/yyyy",
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
                                         CustomWidgets.sizedBox(width: 2.0),
                                         GestureDetector(
                                          onTap:() async{

                                            CustomWidgets.pickDate(context)
                                                .then((value) {
                                              _updateProfileController
                                                  .elementAt(7)
                                                  .text = value;
                                            });
                                          },
                                          child: Icon(
                                            Icons.calendar_today_outlined,
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomWidgets.sizedBox(height: 10),
                                  Text(
                                    'NBA Profile',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        decoration: TextDecoration.underline),
                                  ),
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 25,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: Text(
                                                "Designation",
                                                style: TextStyle(fontSize: 12.0),
                                              )),
                                        ),
                                        CustomWidgets.sizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 25,
                                            child: TextFormField(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                    new FocusNode());
                                              },
                                              controller: _updateProfileController
                                                  .elementAt(8),
                                              decoration: InputDecoration(
                                                hintText: "Chairman",
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
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 25,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text(
                                                    "Membership Type",
                                                    style:
                                                    TextStyle(fontSize: 12.0),
                                                  ))),
                                        ),
                                        CustomWidgets.sizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 25,
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(1.0),
                                                border: Border.all(
                                                  width: 1,
                                                )),
                                            child: Text(membershipType.toString(),
                                                style: TextStyle(fontSize: 18)),
                                            /* DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                  value: _selectedItem,
                                                  items: _dropdownMenuItems,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _selectedItem = value;
                                                    });
                                                  }),
                                            ),*/
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 25,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text(
                                                    "Membership Tennure",
                                                    style:
                                                    TextStyle(fontSize: 12.0),
                                                  ))),
                                        ),
                                        CustomWidgets.sizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 25,
                                            child: TextFormField(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                    new FocusNode());
                                              },
                                              controller: _updateProfileController
                                                  .elementAt(9),
                                              decoration: InputDecoration(
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
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 25,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: Text(
                                                "Joined On",
                                                style: TextStyle(fontSize: 12.0),
                                              )),
                                        ),
                                        CustomWidgets.sizedBox(width: 15.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 25,
                                            child: TextFormField(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                    new FocusNode());
                                              },

                                              controller: _updateProfileController
                                                  .elementAt(10),
                                              decoration: InputDecoration(
                                                hintText: "dd/mm/yyyy",
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
                                        /* CustomWidgets.sizedBox(width: 2.0),
                                        GestureDetector(
                                          child: Icon(
                                            Icons.calendar_today_outlined,
                                            size: 18,
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 50,
                                    //color: Colors.grey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "About",
                                                style: TextStyle(fontSize: 12.0),
                                              )),
                                        ),
                                        CustomWidgets.sizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 60,
                                            child: TextFormField(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                    new FocusNode());
                                              },
                                              controller: _updateProfileController
                                                  .elementAt(11),
                                              maxLines: 5,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5.0, top: 10.0),
                                                hintText: "About Yourself....",
                                                filled: true,
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
                                  CustomWidgets.sizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                fileName = "uploadProfileImage";
                                                _showChooseDialogBox(context);
                                              });
                                            },
                                            child: profileImage == "" || profileImage=="0"
                                                ? Container(
                                              child: Column(
                                                children: [
                                                  imageFile==null
                                                      ? Icon(Icons
                                                      .upload_outlined)
                                                      : Container(
                                                      height: 25,
                                                      width: 50,
                                                      child: Image.file(
                                                        imageFile,
                                                        scale: 1,
                                                      )),
                                                  Text("Profile")
                                                ],
                                              ),
                                            )
                                                : Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height: 25,
                                                      width: 50,
                                                      child: Image.network(
                                                          profileImage)),
                                                  Text("Profile")
                                                ],
                                              ),
                                            )),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              fileName = "uploadCompanyImage";
                                              _showChooseDialogBox(context);
                                            });
                                          },
                                          child: companyImage == "" || companyImage=='0'
                                              ? Container(
                                            child: Column(
                                              children: [
                                                imageFile == null
                                                    ? Icon(Icons
                                                    .upload_outlined)
                                                    : Container(
                                                  height: 25,
                                                  width: 50,
                                                  child: Image.file(
                                                      imageFile),
                                                ),
                                                Text("Company")
                                              ],
                                            ),
                                          )
                                              : Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 25,
                                                  width: 50,
                                                  child: Image.network(
                                                      companyImage),
                                                ),
                                                Text("Company")
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              fileName = "uploadCoverImage";
                                              _showChooseDialogBox(context);
                                            });
                                          },
                                          child: coverImage == "" || coverImage=="0"
                                              ? Container(
                                            child: Column(
                                              children: [
                                                imageFile == null
                                                    ? Icon(Icons
                                                    .upload_outlined)
                                                    : Container(
                                                  height: 25,
                                                  width: 50,
                                                  child: Image.file(
                                                      imageFile),
                                                ),
                                                Text("Cover")
                                              ],
                                            ),
                                          )
                                              : Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 25,
                                                  width: 50,
                                                  child: Image.network(
                                                      coverImage),
                                                ),
                                                Text("Cover")
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
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
                ),
                CustomWidgets.sizedBox(height: 15.0),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 2,
                        width: mediaQueryWidth,
                        color: Colors.grey,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton.icon(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/dashboard', arguments: data);
                               // Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_outlined,
                                size: 18,
                              ),
                              label: Text("Back"),
                            ),
                            FlatButton.icon(
                                onPressed: () {
                                  setState(() {
                                    updateProfile(data['userId'], data['associationId']);
                                    updateDataToFirebase();
                                  });
                                },
                                icon: Icon(
                                  Icons.check_circle_outline,
                                  color: ThemeColors.appbarColor,
                                  size: 18,
                                ),
                                label: Text(
                                  "Save",
                                  style:
                                  TextStyle(color: ThemeColors.appbarColor),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  fetchUserList(String userId, String associationId) async {
    Map data = {"AssociationID": "$associationId", "user_id": "$userId"};
    final response = await http.post(
      WebApis.GET_USER_BY_ASS_ID,
      body: json.encode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      Map data =
      WebResponseExtractor.filterWebData(response, dataObject: 'USER_DATA');
      setState(() {
        _apiStatus = data['message'];
        _updateProfileController.elementAt(0).text = data['data']['FirstName'];
        _updateProfileController.elementAt(1).text =
        data['data']['AssociationName'];
        _updateProfileController.elementAt(2).text =
        data['data']['DesignationName'];
        _updateProfileController.elementAt(3).text =
        data['data']['PrimaryNumber'];
        _updateProfileController.elementAt(4).text = data['data']['Email'];
        _updateProfileController.elementAt(5).text = data['data']['Address1'];
        List<String> dateOfBirth = data['data']['DateOfBirth'].split(' ');
        _updateProfileController.elementAt(6).text = dateOfBirth[0].toString();
        List<String> anniversary = data['data']['Anniversary'].split(' ');
        _updateProfileController.elementAt(7).text = anniversary[0].toString();
        _updateProfileController.elementAt(8).text = data['data']['DesignationName'];
        _updateProfileController.elementAt(9).text = data['data']['MembershipTenure'];
        List<String> joinedOn = data['data']['JoinedOn'].split(' ');
        _updateProfileController.elementAt(10).text = joinedOn[0].toString();
        _updateProfileController.elementAt(11).text = data['data']['AboutUser'];
        membershipId = data['data']['MembershipID'].toString();
        profileImage = data['data']['UserProfileImage'];
        coverImage = data['data']['UserCoverImage'];
        companyImage=data['data']['CompanyImage'];
        membershipType = data['data']['MembershipType'];
        // associationId= data['data']['AssociationID'];
        // designationId= data['data']['DesignationID'];
        // address1= data['data']['Address1'];
        // address2= data['data']['Address2'];
        // area= data['data']['Area'];
        // mobileNumber= data['data']['PrimaryNumber'];
        // email= data['data']['Email'];
      });
      // return User.fromJson(data['data']);
    } else {
      throw Exception('failed to load');
    }
  }

  void updateProfile(String userId, String associationId) async {
    Map data = {
      "AssociationID": associationId,
      "FirstName": _updateProfileController.elementAt(0).text,
      "MiddleName": "",
      "LastName": "",
      "DesignationName": _updateProfileController.elementAt(2).text,
      "PrimaryNumber": _updateProfileController.elementAt(3).text,
      "Email": _updateProfileController.elementAt(4).text,
      "Address1": _updateProfileController.elementAt(5).text,
      "Address2": _updateProfileController.elementAt(5).text,
      "DateOfBirth": _updateProfileController.elementAt(6).text,
      "Anniversary": _updateProfileController.elementAt(7).text,
      "JoinedOn": _updateProfileController.elementAt(10).text,
      "AboutUser": _updateProfileController.elementAt(11).text,
      "id": userId,
      // "MembershipType": "Half",
      // "MembershipTenure": "2 "
    };

    final response = await http.post(
      WebApis.EDIT_PROFILE,
      body: json.encode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      Map data = WebResponseExtractor.filterWebData(response, isSubmit: true);
      if (data["code"] == 1) {
       // print("Response:" + response.body.toString());
        setState(() {
          userNameMain= _updateProfileController.elementAt(0).text;

        });
        Navigator.pushReplacementNamed(context, "/dashboard");
      }
    }
  }

  // show dialog box for pick image
  Future<void> _showChooseDialogBox(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose From:",
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _openCamera(context);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Camera',
                      textScaleFactor: 1.0,
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      _openGallery(context);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Gallery',
                      textScaleFactor: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

// Open Camera
  _openCamera(BuildContext context) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      imageFile = image;
    });
  }

  // Open Gallery
  _openGallery(BuildContext context) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      imageFile = image;
      //file = image as Future<File>;

      fileName == "uploadProfileImage"
          ? _uploadProfileImage()
          : fileName=="uploadCompanyImage"?_uploadCompanyImage():_uploadCoverImage();
    });
  }

  // Upload Profile Image
  Future<void> _uploadProfileImage() async {
    final mimeTypeData =
    lookupMimeType(imageFile.path, headerBytes: [0xFF, 0xD8]).split('/');

    // Intilize the multipart request
    Uri picApi = Uri.parse(WebApis.UPLOAD_USER_PROFILEIMAGE);
    final imageUploadRequest = http.MultipartRequest('POST', picApi);

    // Attach the file in the request
    final file = await http.MultipartFile.fromPath(
        'fileToUpload', imageFile.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

    // Explicitly pass the extension of the image with request body
    // Since image_picker has some bugs due which it mixes up
    // image extension with file name like this filenamejpge
    // Which creates some problem at the server side to manage
    // or verify the file extension

    imageUploadRequest.fields['id'] = userIDMain;
    imageUploadRequest.files.add(file);
    // print("Image Upload :" + imageUploadRequest.fields.toString());
    try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      //print("Response:"+response.body.toString());
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map;
        var returnCode = jsonData['RETURN_CODE'];
        var returnMessage = jsonData['RETURN_MESSAGE'];
        if (returnCode.toString() == "1") {
          WebResponseExtractor.showToast(returnMessage);
          updateDataToFirebase();
          //Navigator.of(context).pushReplacementNamed("/dashboard");
        } else {
          WebResponseExtractor.showToast(returnMessage);
        }
      } else {
        // Utils.showToast("Getting Error Try Later...");
      }
    } catch (e) {
      print(e);
    }
  }

  // Upload Cover Image
  Future<void> _uploadCoverImage() async {
    final mimeTypeData =
    lookupMimeType(imageFile.path, headerBytes: [0xFF, 0xD8]).split('/');

    // Intilize the multipart request
    Uri picApi = Uri.parse(WebApis.UPLOAD_COVERIMAGE);
    final imageUploadRequest = http.MultipartRequest('POST', picApi);

    // Attach the file in the request
    final file = await http.MultipartFile.fromPath(
        'fileToUpload', imageFile.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

    // Explicitly pass the extension of the image with request body
    // Since image_picker has some bugs due which it mixes up
    // image extension with file name like this filenamejpge
    // Which creates some problem at the server side to manage
    // or verify the file extension

    imageUploadRequest.fields['id'] = userIDMain;
    imageUploadRequest.files.add(file);
    // print("Image Upload :" + imageUploadRequest.fields.toString());
    try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      //print("Response:"+response.body.toString());
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map;
        var returnCode = jsonData['RETURN_CODE'];
        var returnMessage = jsonData['RETURN_MESSAGE'];
        if (returnCode.toString() == "1") {
          WebResponseExtractor.showToast(returnMessage);
          Navigator.of(context).pushNamed('/dashboardEditCard');
        } else {
          WebResponseExtractor.showToast(returnMessage);
        }
      } else {
        // Utils.showToast("Getting Error Try Later...");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _uploadCompanyImage() async {
    final mimeTypeData =
    lookupMimeType(imageFile.path, headerBytes: [0xFF, 0xD8]).split('/');

    // Intilize the multipart request
    Uri picApi = Uri.parse(WebApis.UPLOAD_COMPANYIMAGE);
    final imageUploadRequest = http.MultipartRequest('POST', picApi);

    // Attach the file in the request
    final file = await http.MultipartFile.fromPath(
        'fileToUpload', imageFile.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

    // Explicitly pass the extension of the image with request body
    // Since image_picker has some bugs due which it mixes up
    // image extension with file name like this filenamejpge
    // Which creates some problem at the server side to manage
    // or verify the file extension

    imageUploadRequest.fields['id'] = userIDMain;
    imageUploadRequest.files.add(file);
    // print("Image Upload :" + imageUploadRequest.fields.toString());
    try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      //print("Response:"+response.body.toString());
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map;
        var returnCode = jsonData['RETURN_CODE'];
        var returnMessage = jsonData['RETURN_MESSAGE'];
        if (returnCode.toString() == "1") {
          WebResponseExtractor.showToast(returnMessage);
          Navigator.of(context).pushNamed('/dashboardEditCard', arguments: data);
         // Navigator.of(context).pushReplacementNamed("/dashboard");
        } else {
          WebResponseExtractor.showToast(returnMessage);
        }
      } else {
        // Utils.showToast("Getting Error Try Later...");
      }
    } catch (e) {
      print(e);
    }
  }
  void updateDataToFirebase() async{
    loggedUser = await _auth.currentUser();
    Firestore.instance
        .collection('user')
        .document(loggedUser.uid)
        .updateData({
      'id': loggedUser.uid,
      'email':  _updateProfileController.elementAt(4).text,
      'name':  _updateProfileController.elementAt(0).text,
      'userProfileImage':profileImage,
    });
  }

}
