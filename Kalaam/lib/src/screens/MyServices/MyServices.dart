// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use

import 'package:kalaam/src/services/Library.dart';

class MyServices extends StatefulWidget {
  @override
  MyServicesState createState() => MyServicesState();
}

class MyServicesState extends State<MyServices> {
  String name;
  String number = "";
  PageController pageBannerController = PageController();
  int sliderBannerIndex = 0;
  List show = [false, false, false];
  PageController pageNewsController = PageController();
  int sliderNewsIndex = 0;

  PageController pageOfferController = PageController();
  int sliderOfferIndex = 0;

  PageController pageSurveyController = PageController();
  int sliderSurveyIndex = 0;
  bool status = false;
  int sliderIndex = 0;

  bool load = false;
  String cpr = "";
  String cprName = "";
  String payerName = "";
  String payerId = "";
  List linesList = [];
  var picker = ImagePicker();
  List<bool> _visible = [];
  @override
  void initState() {
    super.initState();
    // for (int i = 0; i < 1000; i++) {
    //   show.add(false);
    // }

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
          bottomNavigationBar: AppBarWidget.bottomBarProduct(context, "1"),
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
            title: Text(
              "My Services",
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
          body: Container(
            color: Constants.backgroundWhiteColor,
            width: mediaQueryWidth,
            height: mediaQueryHeight,
            child: Stack(
              children: [
                load == false
                    ? Padding(
                        padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                        child: ListView(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*     newUser
                                ? SizedBox()
                                : Container(
                                    width: 337,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Color(0xff00a817),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      payersList.length > 1
                                          ? "Payers"
                                          : "Payer",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Constants.whiteText,
                                        fontSize: 18,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),*/
/*
                            newUser ? SizedBox() : SizedBox(height: 30),
*/
                            newUser
                                ? customWidget(
                                    mediaQueryWidth, mediaQueryHeight)
                                : payersList.isNotEmpty
                                    ? Container(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            // This next line does the trick.

                                            itemCount: payersList.length,
                                            itemBuilder: (context, index) {
                                              return payers(payersList[index],
                                                  index, payersList);
                                            }),
                                      )
                                    : customWidget(
                                        mediaQueryWidth, mediaQueryHeight)
                          ],
                        ),
                      )
                    : SizedBox(),
                load == true ? LoadingHome() : SizedBox(),
              ],
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

              //  show[index] = !show[index];
              // for (int i = 0; i < show.length; i++) {
              //   if (i == index) {
              //   } else {
              //     show[i] = false;
              //   }
              // }
              _toogle(_visible[index], index);
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              decoration: _visible[index]
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color(0xff00a817),
                        width: 1,
                      ),
                      color: Color(0xffd6f3da),
                    )
                  : BoxDecoration(
                      color: Colors.transparent,
                    ),
              width: mediaQueryWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0x1600a816),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ID: " + data['code'],
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Color(0xff00a817),
                            fontSize: 11,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.97,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: mediaQueryWidth * 0.8,
                            child: Text(
                              data['name'].toString(),
                              style: _visible[index]
                                  ? TextStyle(
                                      color: Color(0xff00a817),
                                      fontSize: 16,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w700,
                                    )
                                  : TextStyle(
                                      color: Color(0x99161616),
                                      fontSize: 16,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                            ),
                          ),

                          _visible[index]
                              ? Container(
                                  child: SvgPicture.asset(
                                    "images/carbon_chevron-down.svg",
                                    width: 15,
                                    height: 20,
                                  ),
                                )
                              : Icon(
                                  _visible[index]
                                      ? Icons.arrow_downward_sharp
                                      : Icons.arrow_forward_ios_outlined,
                                  size: 15,
                                  color: Color(0x99161616),
                                ),

                          //carbon_chevron-down
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: mediaQueryWidth * 0.9,
          height: 1,
          color: Color(0xffe1e1e1),
        ),
        SizedBox(height: 20),
        _visible[index]
            ? Container(
                width: mediaQueryWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Lines",
                        style: TextStyle(
                          color: Color(0xff00a817),
                          fontSize: 16,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    _visible[index] == false
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  // This next line does the trick.

                                  itemCount: linesList.length,
                                  itemBuilder: (context, index) {
                                    return lines(
                                        linesList[index], index, linesList);
                                  }),
                            ),
                          ),
                  ],
                ),
              )
            : SizedBox(),
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
            /*    _visible[index] == false
                ? SizedBox():  */
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                data['name'],
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Bliss Pro",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              "NAME",
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Color(0xff929292),
                fontSize: 15,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
                letterSpacing: 0.18,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              data['textName'],
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Colors.black,
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
                color: Color(0xff929292),
                fontSize: 15,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
                letterSpacing: 0.18,
              ),
            ),
            Text(
              data['mainItem'],
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Colors.black,
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
                color: Color(0xff929292),
                fontSize: 15,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
                letterSpacing: 0.18,
              ),
            ),
            Text(
              data['mrc'],
              style: TextStyle(
                color: Colors.black,
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
                      color: Color(0xff929292),
                      fontSize: 15,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.18,
                    ),
                  ),
                  Text(
                    WebResponseExtractor.dateFormat(data['contractStartDate']),
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
        // WebResponseExtractor.dateFormat(data['contractStartDate']) == ""
        //     ? SizedBox()
        //     : SizedBox(height: 20),
        // WebResponseExtractor.dateFormat(data['contractEndDate']) == ""
        //     ? SizedBox()
        //     : Column(
        //         mainAxisSize: MainAxisSize.min,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             "CONTRACT END DATE",
        //             textScaleFactor: 1.0,
        //             style: TextStyle(
        //               color: Color(0xff929292),
        //               fontSize: 15,
        //               fontFamily: "Bliss Pro",
        //               fontWeight: FontWeight.w500,
        //               letterSpacing: 0.18,
        //             ),
        //           ),
        //           Text(
        //             WebResponseExtractor.dateFormat(data['contractEndDate']),
        //             textScaleFactor: 1.0,
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 16,
        //               fontFamily: "Bliss Pro",
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //         ],
        //       ),
        // WebResponseExtractor.dateFormat(data['contractEndDate']) == ""
        //     ? SizedBox()
        //     : SizedBox(height: 20),
        SizedBox(
          height: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CONTRACT PERIOD",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
              ),
            ),
            int.parse(data['contractPeriod'].toString()) > 1
                ? Text(
                    data['contractPeriod'] + " Months",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : Text(
                    data['contractPeriod'] + " Month",
                    style: TextStyle(
                      color: Colors.black,
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
          height: 1,
          color: Color(0x5600a817),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  void _toogle(bool visible, int index) {
    setState(() {
      for (int i = 0; i < _visible.length; i++) {
        if (i == index) {
          _visible[i] = !visible;
        } else {
          _visible[i] = false;
        }
      }
    });
  }

  Widget customWidget(final mediaQueryWidth, final mediaQueryHeight) {
    return SizedBox(
      width: mediaQueryWidth,
      height: mediaQueryHeight - 200,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/service.png'),
            Text(
              "No Service Found.",
              style: TextStyle(fontSize: 20, color: Colors.black),
            )
          ],
        ),
      ),
    );
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
        payerData();
      });
    } else {
      setState(() {
        load = false;
      });
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
    }
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
          // show.add(false);
          _visible.add(false);
        }
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

  void linesData(String id) async {
    setState(() {
      load = true;
      linesList = [];
    });

    var enc = await encryptData({"resource": "Lines", "keyword": id});
    var dataAPI = await customerBillsAPI(enc);
    print("fr:" + dataAPI.toString());
    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        List l = dataAPI['RETURN_DATA'];
        for (int i = 0; i < l.length; i++) {
          if (dataAPI['RETURN_DATA'][i]['status'].toString() == "2" ||
              dataAPI['RETURN_DATA'][i]['status'].toString() == "7") {
            linesList = dataAPI['RETURN_DATA'];
            //number = linesList[0]['name'];
            print("linesList");
            print(linesList);
          }
        }
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

  Widget dateCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => OrderStatus(),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0x0c898a8d),
            width: 1,
          ),
          color: Color(0x0c00a817),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "22 Mar 2022",
              style: TextStyle(
                color: Color(0xcc1c201d),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cartCard(String im, String name) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      width: mediaQueryWidth,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: mediaQueryWidth * 0.8,
            child: Row(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0x19898a8d),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      im,
                      width: 70.96,
                      height: 72,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Order ID: ORD1234",
                      style: TextStyle(
                        color: Constants.greyButtonTextColor,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Microsoft 365",
                      style: TextStyle(
                        color: Constants.headingBlackColor,
                        fontSize: 16,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expired on 22/05/22,",
                          style: TextStyle(
                            color: Color(0x991c201d),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 3),
                        Text(
                          "Renew!",
                          style: TextStyle(
                            color: Constants.greenColor,
                            fontSize: 12,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "\$500.00",
                      style: TextStyle(
                        color: Constants.headingBlackColor,
                        fontSize: 20,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
