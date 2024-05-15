import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ListItem.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Utils/Constaints.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime pickDate;
  TimeOfDay time;
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  File imageFile;
  String message = "";
  String image = "";
  String errMessage = 'Error  Uploading Image';
  String fileName;
  var dateField = TextEditingController();

  bool isEventFree = false;

  List<ListItem> _dropdownItems = [
    ListItem(1, "Amount"),
    ListItem(2, "Percentage %"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  List<TextEditingController> _editEventController = [
    for (int i = 0; i < 15; i++) TextEditingController()
  ];

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    pickDate = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ThemeColors.appbarColor,
      appBar: AppBarWidget.centerTitleAppbar(context, 'Create Events'),
      body: MainContainerWidget(
        child: Container(
          // height: mediaQueryHeight,
          child: Column(
            children: [
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Create",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),*/
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.only(top: 15),
                    width: mediaQueryWidth,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      shape: eventsCardDecoration,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: ListView(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            children: [
                              Container(
                                width: mediaQueryWidth,
                                height: 30,
                                //color: Colors.grey,
                                child: Row(
                                  children: [
                                    Container(width: 100, child: Text("Name")),
                                    Expanded(
                                      child: Container(
                                        height: 30,
                                        child: TextFormField(
                                          controller:
                                              _editEventController.elementAt(0),
                                          decoration: textFieldDecoration,
                                          textInputAction: TextInputAction.next,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              message =
                                                  "Please Enter Event Name";
                                              WebResponseExtractor.showToast(
                                                  message);
                                              //return 'Please Enter Event Name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomWidgets.sizedBox(height: 8.0),
                              Container(
                                width: mediaQueryWidth,
                                height: 30.0,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text("Date"),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 30,
                                        child: TextFormField(
                                          controller:
                                              _editEventController.elementAt(1),
                                          onTap: () {
                                            FocusScope.of(context)
                                                .requestFocus(new FocusNode());
                                          },
                                          decoration: InputDecoration(
                                              hintText: "YYYY-MM-DD",
                                              contentPadding: EdgeInsets.only(
                                                  left: 5.0, top: 2.0),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.0))),
                                          textInputAction: TextInputAction.next,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              message =
                                                  "Please Enter Event Date";
                                              WebResponseExtractor.showToast(
                                                  message);
                                              //return 'Please Enter Event Date';
                                            }
                                            return null;
                                          },
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
                                          _editEventController
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
                              CustomWidgets.sizedBox(height: 8.0),
                              Container(
                                width: mediaQueryWidth,
                                height: 30.0,
                                //color: Colors.grey,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text("Time"),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 50,
                                      child: TextFormField(
                                        controller:
                                            _editEventController.elementAt(2),
                                        decoration: textFieldDecoration
                                            .copyWith(hintText: "00"),
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());
                                          CustomWidgets.pickTime(context)
                                              .then((value) {
                                            _editEventController
                                                .elementAt(2)
                                                .text = value;
                                          });
                                        },
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            message = "Please Enter Event Time";
                                            WebResponseExtractor.showToast(
                                                message);
                                            //return 'Please Enter Event Time';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    CustomWidgets.sizedBox(width: 5.0),
                                    Container(
                                      child: Text("to"),
                                    ),
                                    CustomWidgets.sizedBox(width: 5.0),
                                    Container(
                                      height: 30,
                                      width: 50,
                                      child: TextFormField(
                                        controller:
                                            _editEventController.elementAt(3),
                                        decoration: textFieldDecoration
                                            .copyWith(hintText: "00"),
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());
                                          CustomWidgets.pickTime(context)
                                              .then((value) {
                                            _editEventController
                                                .elementAt(3)
                                                .text = value;
                                          });
                                        },
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            message = "Please Enter Event Time";
                                            WebResponseExtractor.showToast(
                                                message);
                                            // return 'Please Enter Event Time';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomWidgets.sizedBox(height: 8.0),
                              Container(
                                width: mediaQueryWidth,
                                height: 30.0,
                                //color: Colors.grey,
                                child: Row(
                                  children: [
                                    Container(width: 100, child: Text("Venue")),
                                    Expanded(
                                      child: Container(
                                        height: 30,
                                        child: TextFormField(
                                          controller:
                                              _editEventController.elementAt(4),
                                          decoration: textFieldDecoration
                                              .copyWith(hintText: "Venue"),
                                          textInputAction: TextInputAction.next,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              message =
                                                  "Please Enter Event Venue";
                                              WebResponseExtractor.showToast(
                                                  message);
                                              // return 'Please Enter Event Venue';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomWidgets.sizedBox(height: 8.0),
                              Container(
                                width: mediaQueryWidth,
                                height: 60,
                                //color: Colors.grey,
                                child: Row(
                                  children: [
                                    Container(
                                        alignment: Alignment.topLeft,
                                        width: 100,
                                        child: Text("Description")),
                                    Expanded(
                                      child: Container(
                                        height: 60,
                                        child: TextFormField(
                                          controller:
                                              _editEventController.elementAt(5),
                                          maxLines: 5,
                                          decoration:
                                              textFieldDecoration.copyWith(
                                            hintText: "Description",
                                            contentPadding: EdgeInsets.only(
                                                left: 5.0, top: 10.0),
                                          ),
                                          textInputAction: TextInputAction.next,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              message =
                                                  "Please Enter Event Description";
                                              WebResponseExtractor.showToast(
                                                  message);
                                              //return 'Please Enter Event Description';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomWidgets.sizedBox(height: 8.0),
                              Container(
                                width: mediaQueryWidth,
                                height: 30.0,
                                //color: Colors.grey,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 100,
                                        child: Text("Upload Image")),
                                    GestureDetector(
                                      onTap: () {
                                        _showChooseDialogBox(context);
                                        setState(() {
                                          image == '1';
                                        });
                                        // chooseImage();
                                      },
                                      child: Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        alignment: Alignment.centerLeft,
                                        height: 30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Select"),
                                            Icon(Icons.arrow_drop_down),
                                          ],
                                        ),
                                      ),
                                    ),
                                    imageFile == null
                                        ? Text("No Image Selected")
                                        : Image.file(imageFile),
                                    //showImage(),
                                    file != null
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              image: DecorationImage(
                                                image: ExactAssetImage(
                                                    imageFile.path),
                                                fit: BoxFit.cover,
                                              ),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 2.0),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                          )
                                        : SizedBox(
                                            width: 5,
                                          ),
                                  ],
                                ),
                              ),
                              CustomWidgets.sizedBox(height: 20.0),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Will This event free of cost ?',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Switch(
                                    value: isEventFree,
                                    onChanged: (value) {
                                      setState(() {
                                        isEventFree = value;
                                      });
                                    },
                                    activeTrackColor: Colors.lightGreenAccent,
                                    activeColor: Colors.green,
                                  ),
                                ],
                              ),
                              CustomWidgets.sizedBox(height: 10.0),
                              !isEventFree
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 100,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0),
                                            child: Text(
                                              "Entry Fees",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            )),
                                        CustomWidgets.sizedBox(height: 8.0),
                                        Container(
                                          // height: 100,
                                          width: mediaQueryWidth,
                                          child: Card(
                                            shape: eventsCardDecoration,
                                            elevation: 5.0,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Title",
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: 1.0,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: mediaQueryWidth,
                                                    height: 30,
                                                    //color: Colors.grey,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: 25,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  _editEventController
                                                                      .elementAt(
                                                                          6),
                                                              decoration:
                                                                  textFieldDecoration
                                                                      .copyWith(
                                                                          hintText:
                                                                              "Title 1"),
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              validator:
                                                                  (value) {
                                                                if (value
                                                                    .isEmpty) {
                                                                  message =
                                                                      "Please Enter Event Title";
                                                                  WebResponseExtractor
                                                                      .showToast(
                                                                          message);
                                                                  // return 'Please Enter Event Title';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        CustomWidgets.sizedBox(
                                                            width: 20.0),
                                                        Container(
                                                          height: 25,
                                                          width: 80,
                                                          child: TextFormField(
                                                            controller:
                                                                _editEventController
                                                                    .elementAt(
                                                                        7),
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "Ex. Rs 2000",
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      left: 5.0,
                                                                      top: 2.0),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            1.0),
                                                              ),
                                                            ),
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  5),
                                                            ],
                                                            validator: (value) {
                                                              if (value
                                                                  .isEmpty) {
                                                                message =
                                                                    "Please Enter Event Entry Fee Amount";
                                                                WebResponseExtractor
                                                                    .showToast(
                                                                        message);
                                                                //return 'Please Enter Event Entry Fee Amount';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: mediaQueryWidth,
                                                    height: 30,
                                                    //color: Colors.grey,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: 25,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  _editEventController
                                                                      .elementAt(
                                                                          8),
                                                              decoration:
                                                                  textFieldDecoration
                                                                      .copyWith(
                                                                          hintText:
                                                                              "Title 2"),
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              validator:
                                                                  (value) {
                                                                if (value
                                                                    .isEmpty) {
                                                                  message =
                                                                      "Please Enter Event Title2";
                                                                  WebResponseExtractor
                                                                      .showToast(
                                                                          message);
                                                                  // return 'Please Enter Event Title';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        CustomWidgets.sizedBox(
                                                            width: 20.0),
                                                        Container(
                                                          height: 25,
                                                          width: 80,
                                                          child: TextFormField(
                                                            controller:
                                                                _editEventController
                                                                    .elementAt(
                                                                        9),
                                                            decoration:
                                                                textFieldDecoration
                                                                    .copyWith(
                                                                        hintText:
                                                                            "Ex. Rs 3000"),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  5),
                                                            ],
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            validator: (value) {
                                                              if (value
                                                                  .isEmpty) {
                                                                message =
                                                                    "Please Enter Event Entry Fee Amount2";
                                                                WebResponseExtractor
                                                                    .showToast(
                                                                        message);
                                                                //return 'Please Enter Event Entry Fee Amount';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: mediaQueryWidth,
                                                    height: 30,
                                                    //color: Colors.grey,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: 30,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  _editEventController
                                                                      .elementAt(
                                                                          10),
                                                              decoration:
                                                                  textFieldDecoration
                                                                      .copyWith(
                                                                          hintText:
                                                                              "Title 3"),
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              validator:
                                                                  (value) {
                                                                if (value
                                                                    .isEmpty) {
                                                                  message =
                                                                      "Please Enter Event Title3";
                                                                  WebResponseExtractor
                                                                      .showToast(
                                                                          message);
                                                                  // return 'Please Enter Event Title';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        CustomWidgets.sizedBox(
                                                            width: 20.0),
                                                        Container(
                                                          height: 30,
                                                          width: 80,
                                                          child: TextFormField(
                                                            controller:
                                                                _editEventController
                                                                    .elementAt(
                                                                        11),
                                                            decoration:
                                                                textFieldDecoration
                                                                    .copyWith(
                                                                        hintText:
                                                                            "Ex. Rs 4000"),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  5),
                                                            ],
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            validator: (value) {
                                                              if (value
                                                                  .isEmpty) {
                                                                message =
                                                                    "Please Enter Event Entry Fee Amount3";
                                                                WebResponseExtractor
                                                                    .showToast(
                                                                        message);
                                                                //return 'Please Enter Event Entry Fee Amount';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  /*Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5.0),
                                              child: Container(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Text(
                                                    "Create More",
                                                    style:
                                                        TextStyle(fontSize: 12.0),
                                                  )),
                                            ),*/
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        CustomWidgets.sizedBox(height: 8.0),
                                        Container(
                                            // width:100,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 10.0),
                                            child: Text(
                                              "Create Discount Voucher",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            )),
                                        CustomWidgets.sizedBox(height: 8.0),
                                        Container(
                                          width: mediaQueryWidth,
                                          child: Card(
                                            shape: eventsCardDecoration,
                                            elevation: 5.0,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8.0, 1.0, 8.0, 1.0),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    width: mediaQueryWidth,
                                                    //  height: 60,
                                                    //color: Colors.grey,
                                                    child: Wrap(
                                                      children: [
                                                        Container(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                child: Text(
                                                                  "Voucher Code",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    letterSpacing:
                                                                        1.0,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                  ),
                                                                ),
                                                              ),
                                                              CustomWidgets
                                                                  .sizedBox(
                                                                      height:
                                                                          5),
                                                              Container(
                                                                height: 30,
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      _editEventController
                                                                          .elementAt(
                                                                              12),
                                                                  decoration:
                                                                      textFieldDecoration
                                                                          .copyWith(
                                                                    hintText:
                                                                        "Code",
                                                                  ),
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  validator:
                                                                      (value) {
                                                                    if (value
                                                                        .isEmpty) {
                                                                      message =
                                                                          "Please Enter Event Voucher Code";
                                                                      WebResponseExtractor
                                                                          .showToast(
                                                                              message);
                                                                      //return 'Please Enter Event Voucher Code';
                                                                    }
                                                                    return null;
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 5),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 5),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                child: Text(
                                                                  "Valid Till",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    letterSpacing:
                                                                        1.0,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                  ),
                                                                ),
                                                              ),
                                                              CustomWidgets
                                                                  .sizedBox(
                                                                      height:
                                                                          5),
                                                              Container(
                                                                height: 30,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _editEventController.elementAt(13),
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).requestFocus(new FocusNode());
                                                                          },
                                                                          decoration: InputDecoration(
                                                                              hintText: "YYYY-MM-DD",
                                                                              contentPadding: EdgeInsets.only(left: 5.0, top: 2.0),
                                                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.0))),
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          validator:
                                                                              (value) {
                                                                            if (value.isEmpty) {
                                                                              message = "Please Enter Event Voucher Valid Till Date";
                                                                              WebResponseExtractor.showToast(message);
                                                                              // return 'Please Enter Event Voucher Valid Till Date';
                                                                            }
                                                                            return null;
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    CustomWidgets
                                                                        .sizedBox(
                                                                            width:
                                                                                2.0),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () async {
                                                                        FocusScope.of(context)
                                                                            .requestFocus(new FocusNode());
                                                                        CustomWidgets.pickDate(context)
                                                                            .then((value) {
                                                                          _editEventController
                                                                              .elementAt(13)
                                                                              .text = value;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            50,
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .calendar_today_outlined,
                                                                          size:
                                                                              18,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 5),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                child: Text(
                                                                  "Discount",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    letterSpacing:
                                                                        1.0,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                  ),
                                                                ),
                                                              ),
                                                              CustomWidgets
                                                                  .sizedBox(
                                                                      height:
                                                                          5),
                                                              Container(
                                                                height: 30,
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      _editEventController
                                                                          .elementAt(
                                                                              14),
                                                                  decoration:
                                                                      textFieldDecoration
                                                                          .copyWith(
                                                                    hintText:
                                                                        "Discount",
                                                                  ),
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 5),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              FittedBox(
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                child:
                                                                    Container(
                                                                  child: Text(
                                                                    "Discount Type",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      letterSpacing:
                                                                          1.0,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              CustomWidgets
                                                                  .sizedBox(
                                                                      height:
                                                                          5),
                                                              Container(
                                                                //height: 30,
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              5),
                                                                      height:
                                                                          30,
                                                                      width:
                                                                          mediaQueryWidth,
                                                                      margin: EdgeInsets.only(
                                                                          bottom:
                                                                              5),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              1.0),
                                                                          border: Border.all(
                                                                              width: 1,
                                                                              color: Colors.grey)),
                                                                      child:
                                                                          DropdownButtonHideUnderline(
                                                                        child: DropdownButton(
                                                                            value: _selectedItem,
                                                                            items: _dropdownMenuItems,
                                                                            style: TextStyle(fontSize: 14, color: Colors.black),
                                                                            onChanged: (value) {
                                                                              setState(() {
                                                                                _selectedItem = value;
                                                                              });
                                                                            }),
                                                                      ),
                                                                    ),
                                                                    /*Container(
                                                                height: 20,
                                                                child:
                                                                TextField(
                                                                  decoration: textFieldDecoration
                                                                      .copyWith(
                                                                      hintText:
                                                                      "Amount",
                                                                      hintStyle:
                                                                      TextStyle(
                                                                          fontSize: 10)),
                                                                ),
                                                              ),*/
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
                                                CustomWidgets.sizedBox(
                                                    height: 5.0),
                                                /*Container(
                                            padding: EdgeInsets.all(5.0),
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                              "Create More",
                                              style: TextStyle(fontSize: 12.0),
                                            ),
                                          ),*/
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_editEventController.elementAt(0).text.isEmpty) {
                      WebResponseExtractor.showToast("Please Enter Event Name");
                    } else if (_editEventController.elementAt(1).text.isEmpty) {
                      WebResponseExtractor.showToast("Please Enter Event Date");
                    } else if (_editEventController.elementAt(2).text.isEmpty) {
                      WebResponseExtractor.showToast("Please Enter Event Time");
                    } else if (_editEventController.elementAt(3).text.isEmpty) {
                      WebResponseExtractor.showToast("Please Enter Event Time");
                    } else if (_editEventController.elementAt(4).text.isEmpty) {
                      WebResponseExtractor.showToast(
                          "Please Enter Event Venue");
                    } else if (_editEventController.elementAt(5).text.isEmpty) {
                      WebResponseExtractor.showToast(
                          "Please Enter Event Description");
                    } else if (!isEventFree) {
                      if (_editEventController.elementAt(6).text.isNotEmpty ||_editEventController.elementAt(7).text.isNotEmpty)  {
                        if (_editEventController.elementAt(6).text.isEmpty || _editEventController.elementAt(7).text.isEmpty) {
                          WebResponseExtractor.showToast(
                              "Please Enter Event Title and Entry Fees Amount");
                        }
                        else if (_editEventController.elementAt(8).text.isNotEmpty ||_editEventController.elementAt(9).text.isNotEmpty) {
                          if (_editEventController.elementAt(8).text.isEmpty || _editEventController.elementAt(9).text.isEmpty) {
                            WebResponseExtractor.showToast(
                                "Please Enter Event Title and Entry Fees Amount");
                          }
                          else
                            {
                              if(_editEventController.elementAt(10).text.isNotEmpty ||_editEventController.elementAt(11).text.isNotEmpty) {
                                if (_editEventController.elementAt(10).text.isEmpty || _editEventController.elementAt(11).text.isEmpty) {
                                  WebResponseExtractor.showToast(
                                      "Please Enter Event Title and Entry Fees Amount");
                                }
                                else
                                {
                                  _createEvent();
                                }
                              }
                              else
                              {
                                _createEvent();
                              }

                            }

                        }
                        else
                        {
                          _createEvent();
                        }

                      }
                      else
                      {
                        _createEvent();
                      }



                      /*else if (_editEventController
                          .elementAt(8)
                          .text
                          .isNotEmpty) {
                        if (_editEventController.elementAt(9).text.isEmpty) {
                          WebResponseExtractor.showToast(
                              "Please Enter Event Entry Fee Amount");
                        }
                        *//*  WebResponseExtractor.showToast(
                            "Please Enter Event Entry Fee Amount");*//*
                      } else if (_editEventController
                          .elementAt(9)
                          .text
                          .isNotEmpty) {
                        if (_editEventController.elementAt(8).text.isEmpty) {
                          WebResponseExtractor.showToast(
                              "Please Enter Event Title");
                        }
                        *//* WebResponseExtractor.showToast(
                            "Please Enter Event Title");*//*
                      } else if (_editEventController
                          .elementAt(10)
                          .text
                          .isNotEmpty) {
                        if (_editEventController.elementAt(11).text.isEmpty) {
                          WebResponseExtractor.showToast(
                              "Please Enter Event Entry Fee Amount");
                        }
                      } else if (_editEventController
                          .elementAt(11)
                          .text
                          .isNotEmpty) {
                        if (_editEventController.elementAt(10).text.isEmpty) {
                          WebResponseExtractor.showToast(
                              "Please Enter Event Title");
                        }
                      }*/
                      /*else if (_editEventController
                          .elementAt(11)
                          .text
                          .isEmpty) {
                        WebResponseExtractor.showToast(
                            "Please Enter Event Entry Fee Amount");
                      } else if (_editEventController
                          .elementAt(12)
                          .text
                          .isEmpty) {
                        WebResponseExtractor.showToast(
                            "Please Enter Event Voucher Code");
                      } else if (_editEventController
                          .elementAt(13)
                          .text
                          .isEmpty) {
                        WebResponseExtractor.showToast(
                            "Please Enter Event Voucher Valid Till Date");
                      }*/

                    } else {
                      _createEvent();
                    }

                    //_createEvent();
                  },
                  child: Text("Create Event"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: Colors.yellow[700],
                  elevation: 10.0,
                ),
              ),
              /*Container(
                height: 50,
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
            ],
          ),
        ),
      ),
    );
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

  _openGallery(BuildContext context) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      imageFile = image;
      // file = image as Future<File>;
    });
  }

  Future<void> _createEvent() async {
    if(imageFile == null) {
      WebResponseExtractor.showToast("Event Image Needed");
    }else{
      final mimeTypeData =
      lookupMimeType(imageFile.path, headerBytes: [0xFF, 0xD8]).split('/');

      // Intilize the multipart request
      Uri picApi = Uri.parse(WebApis.CREATE_EVENTS);
      final imageUploadRequest = http.MultipartRequest('POST', picApi);

      // Attach the file in the request
      final file = await http.MultipartFile.fromPath(
          'EventCardImage', imageFile.path,
          contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

      // Explicitly pass the extension of the image with request body
      // Since image_picker has some bugs due which it mixes up
      // image extension with file name like this filenamejpge
      // Which creates some problem at the server side to manage
      // or verify the file extension

      imageUploadRequest.fields['AssociationID'] = associationIdMain;
      imageUploadRequest.fields['EventName'] =
          _editEventController.elementAt(0).text;
      imageUploadRequest.fields['DateFrom'] =
          _editEventController.elementAt(1).text;
      imageUploadRequest.fields['TimeFrom'] =
          _editEventController.elementAt(2).text;
      imageUploadRequest.fields['TimeTo'] =
          _editEventController.elementAt(3).text;
      imageUploadRequest.fields['Venue'] = _editEventController.elementAt(4).text;
      imageUploadRequest.fields['Description'] =
          _editEventController.elementAt(5).text;
      imageUploadRequest.fields['VoucherCode'] =
          _editEventController.elementAt(12).text;
      imageUploadRequest.fields['ValidTill'] =
          _editEventController.elementAt(13).text;
      imageUploadRequest.fields['DiscountTypeID'] = "2";
      imageUploadRequest.fields['Title'] =
          _editEventController.elementAt(6).text +
              "," +
              _editEventController.elementAt(8).text +
              "," +
              _editEventController.elementAt(10).text;
      if (_editEventController.elementAt(7).text != null &&
          _editEventController.elementAt(9) != null) {
        if (_editEventController.elementAt(11) != null) {
          imageUploadRequest.fields['EntryFeeAmount'] =
              _editEventController.elementAt(7).text +
                  "," +
                  _editEventController.elementAt(9).text +
                  "," +
                  _editEventController.elementAt(11).text;
        }
      }

      imageUploadRequest.files.add(file);
      // print("Image Upload :" + imageUploadRequest.fields.toString());
      try {
        final streamedResponse = await imageUploadRequest.send();
        final response = await http.Response.fromStream(streamedResponse);
        //  print("Response:"+response.body.toString());
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body) as Map;
          var returnCode = jsonData['RETURN_CODE'];
          var returnMessage = jsonData['RETURN_MESSAGE'];
          if (returnCode.toString() == "1") {
            _showMyDialog(returnMessage);
            WebResponseExtractor.showToast(returnMessage);
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

  }

  Future<void> _showMyDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),

                /*  TextFormField(
                  controller: albumName,
                  decoration: InputDecoration(hintText: "Enter Album Name"),
                ),*/
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/events");
                // Navigator.of(context).pop();
                //_showChooseDialogBox(context);
              },
            ),
          ],
        );
      },
    );
  }
}
