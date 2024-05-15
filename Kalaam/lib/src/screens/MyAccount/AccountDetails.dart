// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use

import 'package:kalaam/src/services/Library.dart';

class AccountDetails extends StatefulWidget {
  @override
  AccountDetailsState createState() => AccountDetailsState();
}

class AccountDetailsState extends State<AccountDetails> {
  bool load = false;
  String cpr = "";
  String cprName = "";
  String payerName = "";
  String payerId = "";
  List linesList = [];
  List show = [];
  var picker = ImagePicker();
  TextEditingController name = TextEditingController();
  bool isEdit = false;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 1000; i++) {
      show.add(false);
    }

    if (newUser) {
    } else {
      customerData();
      // payerData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
       top: false,
        bottom: false,

      child: WillPopScope(
        onWillPop: () {
          return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Home(),
              ));
        },
        child: new Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.backgroundWhiteColor,
            iconTheme: IconThemeData(color: Colors.black),
            leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Home(),
                      ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Constants.headingBlackColor,
                )),
            title:
//Align(      alignment: Alignment(-12, 0),

                Text(
              "Account Details",
              textScaleFactor: 1.0,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.headingBlackColor,
                fontSize: 16,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            elevation: 3,
          ),
          body: SingleChildScrollView(
            child: Container(
              // height: mediaQueryHeight + payersList.length*150.0,
              color: Constants.backgroundWhiteColor,
              child: Stack(
                children: [
                  load == true ? LoadingHome() : SizedBox(),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _showChooseDialogBox(
                                context, "Upload Profile Photo");
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x0c101828),
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                        image: DecorationImage(
                                            image: imageFile != null
                                                ? FileImage(
                                                    imageFile,
                                                  )
                                                : userImage == ""
                                                    ? AssetImage(
                                                        "images/dp.png")
                                                    : NetworkImage(userImage),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xfffafafa),
                                                width: 1,
                                              ),
                                              color: Constants.greenColor,
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Center(
                                                    child: Icon(
                                                  Icons.camera_alt,
                                                  size: 10,
                                                  color: Constants.whiteText,
                                                )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          !isEdit
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      name.text = userName;
                                      isEdit = true;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        userName,
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                          color: Constants.headingBlackColor,
                                          fontSize: 20,
                                          fontFamily: "Bliss Pro",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Icon(
                                        Icons.edit,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: 10),
                          isEdit
                              ? Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: TextField(
                                    controller: name,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: Constants.greenColor,
                                                width: 1.0)),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              if (name.text.trim().isNotEmpty) {
                                                setState(() {
                                                  // userName = name.text;
                                                  isEdit = false;
                                                });
                                                updateAccount();
                                              } else {
                                                WebResponseExtractor.showToast(
                                                    "Plesse enter name.");
                                              }
                                            },
                                            icon: Icon(
                                              Icons.check,
                                              color: Constants.greenColor,
                                            ))),
                                  ),
                                )
                              : SizedBox(),
                          // Text(
                          //   userName+".Co",
                          //   style: TextStyle(
                          //     color: Color(0x991c201d),
                          //     fontSize: 16,
                          //     fontFamily: "Bliss Pro",
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                          // SizedBox(height: 4),
                          // Text(
                          //   "Primary Currency: BHD",
                          //   style: TextStyle(
                          //     color: Constants.greyTextColor,
                          //     fontSize: 14,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: mediaQueryWidth,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // newUser
                                  //     ? GestureDetector(
                                  //         onTap: () {
                                  //           Navigator.push(
                                  //               context,
                                  //               MaterialPageRoute(
                                  //                 builder:
                                  //                     (BuildContext context) =>
                                  //                         EditProfile(),
                                  //               ));
                                  //         },
                                  //         child: Container(
                                  //           color: Colors.transparent,
                                  //           child: Text(
                                  //             "Edit Details",
                                  //             style: TextStyle(
                                  //               color: Constants.greenColor,
                                  //               fontSize: 12,
                                  //               fontFamily: "Bliss Pro",
                                  //               fontWeight: FontWeight.w500,
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       )
                                  //     : SizedBox(),
                                  SizedBox(width: 24),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ChangePassword(),
                                          ));
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Text(
                                        "Change Password",
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                          color: Constants.greenColor,
                                          fontSize: 12,
                                          fontFamily: "Bliss Pro",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            width: mediaQueryWidth,
                            height: 3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Constants.greyButtonColor,
                                width: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                        child: Column(
                          children: [
                            newUser
                                ? SizedBox()
                                : SizedBox(
                                    height: 20,
                                  ),
                            newUser
                                ? SizedBox()
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Identity ${cpr.toString()} ",
                                              textScaleFactor: 1.0,
                                              style: TextStyle(
                                                color:
                                                    Constants.headingBlackColor,
                                                fontSize: 18,
                                                fontFamily: "Bliss Pro",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            // Container(
                                            //   decoration: BoxDecoration(
                                            //     borderRadius: BorderRadius.circular(8),
                                            //     border: Border.all(color: Color(0x0c898a8d), width: 1, ),
                                            //     color: Color(0x11898a8d),
                                            //   ),
                                            //   padding: const EdgeInsets.symmetric(horizontal: 8, ),
                                            //   child: Row(
                                            //     mainAxisSize: MainAxisSize.min,
                                            //     mainAxisAlignment: MainAxisAlignment.start,
                                            //     crossAxisAlignment: CrossAxisAlignment.start,
                                            //     children:[
                                            //       Text(
                                            //         "CPR",
                                            //         style: TextStyle(
                                            //           color: Constants.greyTextColor,
                                            //           fontSize: 12,
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      //  SizedBox(height: 20),
                                      // Row(
                                      //
                                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //
                                      //   children:[
                                      //     Column(
                                      //       mainAxisSize: MainAxisSize.min,
                                      //       mainAxisAlignment: MainAxisAlignment.start,
                                      //       crossAxisAlignment: CrossAxisAlignment.start,
                                      //       children:[
                                      //         Text(
                                      //           "CPR NO.",
                                      //           style: TextStyle(
                                      //             color: Constants.greyTextColor,
                                      //             fontSize: 12,
                                      //             fontFamily: "Bliss Pro",
                                      //             fontWeight: FontWeight.w500,
                                      //             letterSpacing: 0.72,
                                      //           ),
                                      //         ),
                                      //         Text(
                                      //           cpr,
                                      //           style: TextStyle(
                                      //             color: Color(0xcc1c201d),
                                      //             fontSize: 16,
                                      //             fontFamily: "Bliss Pro",
                                      //             fontWeight: FontWeight.w500,
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     /* SizedBox(width: 20),
                                      // Column(
                                      //   mainAxisSize: MainAxisSize.min,
                                      //   mainAxisAlignment: MainAxisAlignment.start,
                                      //   crossAxisAlignment: CrossAxisAlignment.end,
                                      //   children:[
                                      //     Text(
                                      //       "CPR EXPIRY",
                                      //       style: TextStyle(
                                      //         color: Constants.greyTextColor,
                                      //         fontSize: 12,
                                      //         fontFamily: "Bliss Pro",
                                      //         fontWeight: FontWeight.w500,
                                      //         letterSpacing: 0.72,
                                      //       ),
                                      //     ),
                                      //     Text(
                                      //       "07/06/22",
                                      //       style: TextStyle(
                                      //         color: Color(0xcc1c201d),
                                      //         fontSize: 16,
                                      //         fontFamily: "Bliss Pro",
                                      //         fontWeight: FontWeight.w500,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),*/
                                      //   ],
                                      // ),
                                    ],
                                  ),
                            newUser ? SizedBox() : SizedBox(height: 20),
                            newUser
                                ? SizedBox()
                                : Container(
                                    width: mediaQueryWidth,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Constants.greyButtonColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                            newUser ? SizedBox() : SizedBox(height: 20),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Contact",
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                          color: Constants.headingBlackColor,
                                          fontSize: 18,
                                          fontFamily: "Bliss Pro",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Container(
                                        width: double.infinity,
                                        height: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "EMAIL",
                                            textScaleFactor: 1.0,
                                            style: TextStyle(
                                              color: Constants.greyTextColor,
                                              fontSize: 12,
                                              fontFamily: "Bliss Pro",
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.72,
                                            ),
                                          ),
                                          Text(
                                            userEmail,
                                            textScaleFactor: 1.0,
                                            style: TextStyle(
                                              color: Color(0xcc1c201d),
                                              fontSize: 16,
                                              fontFamily: "Bliss Pro",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "PHONE",
                                            textScaleFactor: 1.0,
                                            style: TextStyle(
                                              color: Constants.greyTextColor,
                                              fontSize: 12,
                                              fontFamily: "Bliss Pro",
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.72,
                                            ),
                                          ),
                                          Text(
                                            userMobile,
                                            textScaleFactor: 1.0,
                                            style: TextStyle(
                                              color: Color(0xcc1c201d),
                                              fontSize: 16,
                                              fontFamily: "Bliss Pro",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      //   SizedBox(height: 20),
/*
                                  Container(
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Text(
                                          "ADDRESS",
                                          style: TextStyle(
                                            color: Constants.greyTextColor,
                                            fontSize: 12,
                                            fontFamily: "Bliss Pro",
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.72,
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            "Building:0094, Block: 0411, Road:1402, Flat: 000, Bharan",
                                            style: TextStyle(
                                              color: Color(0xcc1c201d),
                                              fontSize: 16,
                                              fontFamily: "Bliss Pro",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
*/
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: mediaQueryWidth,
                              height: 3,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Constants.greyButtonColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget payers(Map data, int index, List payList) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              linesData(data['internalid']);

              show[index] = !show[index];
              for (int i = 0; i < show.length; i++) {
                if (i == index) {
                } else {
                  show[i] = false;
                }
              }
            });
          },
          child: Container(
            color: Colors.transparent,
            width: mediaQueryWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: mediaQueryWidth * 0.85,
                          child: Text(
                            data['name'],
                            textScaleFactor: 1.0,
                            maxLines: 2,
                            style: TextStyle(
                              color: Constants.headingBlackColor,
                              fontSize: 16,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          "ID: " + data['internalid'],
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Color(0x991c201d),
                            fontSize: 12,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    show[index] == false
                        ? Icon(
                            Icons.keyboard_arrow_right,
                            color: Constants.greenColor,
                            size: 18,
                          )
                        : Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Constants.greenColor,
                            size: 18,
                          )
                  ],
                ),
                SizedBox(height: 20),
                show[index] == true
                    ? SizedBox()
                    : Container(
                        width: mediaQueryWidth * 0.9,
                        height: 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Constants.greyButtonColor,
                            width: 1,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        show[index] == false
            ? SizedBox()
            : Row(
                children: [
                  Text(
                    "Lines",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Constants.headingBlackColor,
                      fontSize: 18,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
        show[index] == false ? SizedBox() : SizedBox(height: 30),
        show[index] == false
            ? SizedBox()
            : Container(
                //height: newsList.length*mediaQueryHeight*0.4,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // This next line does the trick.

                    itemCount: linesList.length,
                    itemBuilder: (context, index) {
                      return lines(linesList[index], index, linesList);
                    }),
              ),
      ],
    );
  }

  Widget lines(Map data, int index, List lineList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "NAME",
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Constants.greyTextColor,
                fontSize: 12,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
                letterSpacing: 0.72,
              ),
            ),
            Text(
              data['textName'],
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Color(0xcc1c201d),
                fontSize: 16,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "MAIN ITEM",
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Constants.greyTextColor,
                fontSize: 12,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
                letterSpacing: 0.72,
              ),
            ),
            Text(
              data['mainItem'],
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Color(0xcc1c201d),
                fontSize: 16,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "MRC",
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Constants.greyTextColor,
                fontSize: 12,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
                letterSpacing: 0.72,
              ),
            ),
            Text(
              data['mrc'],
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Color(0xcc1c201d),
                fontSize: 16,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        WebResponseExtractor.dateFormat(data['contractStartDate']) == ""
            ? SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CONTRACT START DATE",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Constants.greyTextColor,
                      fontSize: 12,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.72,
                    ),
                  ),
                  Text(
                    WebResponseExtractor.dateFormat(data['contractStartDate']),
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color(0xcc1c201d),
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
        WebResponseExtractor.dateFormat(data['contractStartDate']) == ""
            ? SizedBox()
            : SizedBox(height: 20),
        WebResponseExtractor.dateFormat(data['contractEndDate']) == ""
            ? SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CONTRACT END DATE",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Constants.greyTextColor,
                      fontSize: 12,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.72,
                    ),
                  ),
                  Text(
                    WebResponseExtractor.dateFormat(data['contractEndDate']),
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color(0xcc1c201d),
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
        WebResponseExtractor.dateFormat(data['contractEndDate']) == ""
            ? SizedBox()
            : SizedBox(height: 20),
        WebResponseExtractor.dateFormat(data['activationDate']) == ""
            ? SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ACTIVATION DATE",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Constants.greyTextColor,
                      fontSize: 12,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.72,
                    ),
                  ),
                  Text(
                    WebResponseExtractor.dateFormat(data['activationDate']),
                   textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color(0xcc1c201d),
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
        WebResponseExtractor.dateFormat(data['activationDate']) == ""
            ? SizedBox()
            : SizedBox(height: 20),
        WebResponseExtractor.dateFormat(data['billingStartDate']) == ""
            ? SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BILLING START DATE",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Constants.greyTextColor,
                      fontSize: 12,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.72,
                    ),
                  ),
                  Text(
                    WebResponseExtractor.dateFormat(data['billingStartDate']),
                    style: TextStyle(
                      color: Color(0xcc1c201d),
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
        WebResponseExtractor.dateFormat(data['billingStartDate']) == ""
            ? SizedBox()
            : SizedBox(height: 20),
        WebResponseExtractor.dateFormat(data['terminationDate']) == ""
            ? SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TERMINATION DATE",
                   textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Constants.greyTextColor,
                      fontSize: 12,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.72,
                    ),
                  ),
                  Text(
                    WebResponseExtractor.dateFormat(data['terminationDate']),
                   textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color(0xcc1c201d),
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
        WebResponseExtractor.dateFormat(data['terminationDate']) == ""
            ? SizedBox()
            : SizedBox(height: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CONTRACT PERIOD",
             textScaleFactor: 1.0,
              style: TextStyle(
                color: Constants.greyTextColor,
                fontSize: 12,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
                letterSpacing: 0.72,
              ),
            ),
            int.parse(data['contractPeriod'].toString()) > 1
                ? Text(
                    data['contractPeriod'] + " Months",
                   textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color(0xcc1c201d),
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : Text(
                    data['contractPeriod'] + " Month",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color(0xcc1c201d),
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Constants.greyButtonColor,
              width: 1,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Future<void> _showChooseDialogBox(
      BuildContext context, String message) async {
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

  /*  _openCamera(BuildContext context) async {
    File image = (await picker.getImage(
        source: ImageSource.camera, imageQuality: 50)) as File;

    setState(() {
      imageFile = image as File;
      List<int> imageBytes = imageFile.readAsBytesSync();
      base64Image = base64.encode(imageBytes);
      print("base 64 Image :" + base64Image.toString());
      updateProImage(base64Image.toString());
    });
  }

// Open Gallery
  _openGallery(BuildContext context) async {
    File  image = (await picker.getImage(
        source: ImageSource.gallery, imageQuality: 50)) as File;

    setState(() {
      imageFile = image as File;
      List<int> imageBytes = imageFile.readAsBytesSync();
      base64Image = base64.encode(imageBytes);
      print("base 64 Image :" + base64Image.toString());
      updateProImage(base64Image.toString());
    });

    // _showMyDialog(message);
  }*/
  _openCamera(BuildContext context) async {
     XFile image = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 50);
    // File image = (await ImagePicker().pickImage(
    //     source: ImageSource.camera, imageQuality: 50)) File;

    setState(() {
      //imageFile = image as File;
      List<int> imageBytes = File(image.path).readAsBytesSync();
      base64Image = base64.encode(imageBytes);
      print("base 64 Image :" + base64Image.toString());
      updateProImage(base64Image.toString());
    });
  }

// Open Gallery
  _openGallery(BuildContext context) async {
     XFile image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 50);
    // File image = await ImagePicker.pickImage(
    //     source: ImageSource.gallery, imageQuality: 50);

    setState(() {
     // imageFile = image as File;
      List<int> imageBytes = File(image.path).readAsBytesSync();
      base64Image = base64.encode(imageBytes);
      print("base 64 Image :" + base64Image.toString());
      updateProImage(base64Image.toString());
    });

    // _showMyDialog(message);
  }

  void updateProImage(String image) async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({"user_id": userId, "image": image});
    var dataAPI = await updateProfileImage(enc);

    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        load = false;
        userImage = WebApis.SERVER_URL + dataAPI["RETURN_DATA"]['image_url'];
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => AccountDetails(),
          ));
    } else {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        load = false;
      });
    }
  }

  void customerData() async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({"resource": "Customer", "keyword": userEmail});
    var dataAPI = await customerBillsAPI(enc);

    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        cpr = dataAPI['RETURN_DATA']['identity'];
        cprName = dataAPI['RETURN_DATA']['name'];
        load = false;
        //payerData();
      });
    } else {
      setState(() {
        load = false;
      });
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
    }

    // setState(() {
    //   load = false;
    // });
  }

  void payerData() async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({"resource": "Payers", "keyword": userEmail});
    var dataAPI = await customerBillsAPI(enc);

    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        payersList = dataAPI['RETURN_DATA'];

        for (int i = 0; i < payersList.length; i++) {
          show.add(false);
        }

        //payerId = dataAPI['RETURN_DATA'][0]['internalid'];
        //payerName = dataAPI['RETURN_DATA'][0]['name'];
        //linesData();
      });
    } else {
      setState(() {
        load = false;
      });
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
    }
    setState(() {
      load = false;
    });
  }

  void updateAccount() async {
    var enc = await encryptData({
      "name": name.text,
      "user_id": userId,
    });
    var dataSignUp = await updateUserNameApi(enc);

    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }
  }

  void linesData(String id) async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({"resource": "Lines", "keyword": id});
    var dataAPI = await customerBillsAPI(enc);

    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        linesList = dataAPI['RETURN_DATA'];
      });
    } else {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        load = false;
      });
    }
    setState(() {
      load = false;
    });
  }
}
