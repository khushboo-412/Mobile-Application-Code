// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalaam/src/services/DataInfo.dart';
import 'package:kalaam/src/services/Library.dart';

class Bills2 extends StatefulWidget {
  @override
  Bills2State createState() => Bills2State();
}

class Bills2State extends State<Bills2> {
  PageController _pageController = PageController();
  int pageIndex = 0;
  String urlGet = "";
  Dropdown servicesCategoryDropDown;
  List<Dropdown> servicesCategoryList = [];
  String servicesCategory = "";
  String servicesCategoryID = "";
  List<bool> show = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  bool load = true;
  bool showButton = false;

  int radioOption = 0;
  bool showPaymentBox = false;
  String payerId = "";
  final FocusNode _focusNode = FocusNode();

  bool showPayerDialog = false;
  int selectPayerIndex = -1;
  List<dynamic> payList = [];
  List<bool> checkDataList = [];
  List<dynamic> billsList = [];
  ScrollController _controller;
  double totalAMount = 0.0;
  int selectOption = 1;
  List<dynamic> listData = [];

  @override
  void initState() {
    DataInfo.totalAmount.value = 0.0;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    getSortData();
    super.initState();

    payerData();
  }

  _scrollListener() {
    // if (_controller.offset >= _controller.position.maxScrollExtent &&
    //     !_controller.position.outOfRange) {
    //   print("p1:" + _controller.offset.toString());
    //   setState(() {
    //     if (_controller.offset > 0.0) {
    //       showButton = false;
    //     }
    //   });
    // }
    // if (_controller.offset <= _controller.position.minScrollExtent &&
    //     !_controller.position.outOfRange) {
    //   print("p2:" + _controller.offset.toString());
    //   setState(() {
    //     if (_controller.offset == 0.0) {
    //       showButton = true;
    //     }
    //   });
    // }

    if (_controller.position.atEdge) {
      if (_controller.position.pixels > 0) {
        if (DataInfo.showButton.value) {
          DataInfo.showButton.value = false;
        }
      } else {
        if (!DataInfo.showButton.value) {
          DataInfo.showButton.value = true;
        }
      }
    } else {
      if (!DataInfo.showButton.value) {
        DataInfo.showButton.value = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          DataInfo.totalAmount.value = 0.0;
          if (showPayerDialog) {
            setState(() {
              showPayerDialog = false;
            });
            return false;
          } else {
            return accountDetails == true
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AccountDetails(),
                    ))
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Home(),
                    ));
          }
        },
        child: new Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.backgroundWhiteColor,
            iconTheme: IconThemeData(color: Colors.black),
            leading: Container(),
            title: Text(
              "Bills & Payments",
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
          bottomNavigationBar: AppBarWidget.bottomBarBill(context, ""),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: payList.isNotEmpty
              ? Obx(
                  () => DataInfo.showButton.value
                      ? GestureDetector(
                          onTap: () {
                            DataInfo.totalAmount.value = 0.0;
                         
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyDialog(payList),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: width,
                              height: 50,
                              child: Card(
                                color: Constants.greenColor,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Pay  ${totalAMount.toStringAsFixed(2).toString()} BHD",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                )
              : SizedBox(),
          body: Container(
            color: Constants.backgroundWhiteColor,
            width: width,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    payID == ""
                        ? customWidget(width, mediaQueryHeight)
                        : SizedBox(
                            height: 10,
                          ),
                    payID == ""
                        ? SizedBox()
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pay My Service",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // GestureDetector(
                                //   onTap: () {
                                //     showSortDialog();
                                //   },
                                //   child: SvgPicture.asset(
                                //     "images/sort-icon.svg",
                                //     width: 20,
                                //     height: 20,
                                //   ),
                              //  )
                              ],
                            ),
                          ),
                    payID == ""
                        ? SizedBox()
                        : SizedBox(
                            height: 10,
                          ),
                    payID == ""
                        ? SizedBox()
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                showPayerDialog = true;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0x33898a8d),
                                    width: 1,
                                  ),
                                  color: Constants.greenColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      servicesCategory,
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    payID == ""
                        ? SizedBox()
                        : SizedBox(
                            height: 20,
                          ),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                            controller: _controller,
                            itemCount: billsList.length,
                            itemBuilder: (context, int index) {
                              return invoiceDetail(billsList[index], index);
                            }),
                      ),
                    )
                  ],
                ),
                load == true ? LoadingHome() : SizedBox(),
                showPayerDialog
                    ? showPayerWidget(width, mediaQueryHeight)
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
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
            Image.asset(
              'images/payments.png',
              width: 250,
            ),
            Text(
              "No Payer Found.",
              textScaleFactor: 1.0,
              style: TextStyle(fontSize: 20, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> getservicesCategoryFromWeb() async {
    // test nowsole
    setState(() {
      // what is happening >
      for (Map category in payersList) {
        servicesCategoryList
            .add(new Dropdown(category["internalid"], category["name"]));
      }
    });
  }

  Widget dateCon(String date) {
    List<String> dateList = date.split("/");
    String month = "";

    if (dateList[1] == "1") {
      month = "Jan";
    } else if (dateList[1] == "2") {
      month = "Feb";
    } else if (dateList[1] == "3") {
      month = "Mar";
    } else if (dateList[1] == "4") {
      month = "Apr";
    } else if (dateList[1] == "5") {
      month = "May";
    } else if (dateList[1] == "6") {
      month = "Jun";
    } else if (dateList[1] == "7") {
      month = "Jul";
    } else if (dateList[1] == "8") {
      month = "Aug";
    } else if (dateList[1] == "9") {
      month = "Sep";
    } else if (dateList[1] == "10") {
      month = "Oct";
    } else if (dateList[1] == "11") {
      month = "Nov";
    } else if (dateList[1] == "12") {
      month = "Dec";
    }

    if (int.parse(dateList[0].toString()) < 10) {
      dateList[0] = "0" + dateList[0];
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /*    date == firstDate?SizedBox():SizedBox(height: 25,),
      date == firstDate?SizedBox(): Container(height: 1,
        color: Constants.greySliderColor,),
      date == firstDate?SizedBox():*/

        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0x0c898a8d),
                    width: 1,
                  ),
                  color: Color(0x0c00a817),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  child: Text(
                    dateList[0] + " " + month + " " + dateList[2],
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color(0xcc1c201d),
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  showSortDialog() {
    showGeneralDialog(
        context: context,
        pageBuilder: (_, __, ___) {
          return StatefulBuilder(builder: (context, setSate) {
            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 340,
                height: 280,
                margin: EdgeInsets.only(top: 150),
                child: Card(
                    elevation: 0,
                    child: Container(
                      width: 340,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      "SORT BY",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Constants.greenColor),
                                      child: Icon(
                                        Icons.close,
                                        size: 15,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 302,
                            height: 1,
                            color: Constants.greyColor.withOpacity(0.4),
                          ),
                          SizedBox(
                            height: 35,
                            child: RadioListTile(
                              value: 1,
                              groupValue: selectOption,
                              contentPadding: EdgeInsets.zero,
                              activeColor: Constants.greenColor,
                              onChanged: (value) {
                                setSate(() {
                                  Navigator.pop(context);
                                  selectOption = value;
                                  selectSortData(selectOption);
                                  filterData(selectOption);
                                });
                              },
                              title: Text(
                                "Default",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            child: RadioListTile(
                              value: 2,
                              groupValue: selectOption,
                              contentPadding: EdgeInsets.zero,
                              activeColor: Constants.greenColor,
                              onChanged: (value) {
                                setSate(() {
                                  Navigator.pop(context);
                                  selectOption = value;
                                  selectSortData(selectOption);
                                  filterData(selectOption);
                                });
                              },
                              title: Text(
                                "Date Ascending",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            child: RadioListTile(
                              value: 3,
                              groupValue: selectOption,
                              contentPadding: EdgeInsets.zero,
                              activeColor: Constants.greenColor,
                              onChanged: (value) {
                                setSate(() {
                                  Navigator.pop(context);
                                  selectOption = value;
                                  selectSortData(selectOption);
                                  filterData(selectOption);
                                });
                              },
                              title: Text(
                                "Date Descending",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            child: RadioListTile(
                              value: 4,
                              groupValue: selectOption,
                              contentPadding: EdgeInsets.zero,
                              activeColor: Constants.greenColor,
                              onChanged: (value) {
                                setSate(() {
                                  Navigator.pop(context);
                                  selectOption = value;
                                  selectSortData(selectOption);
                                  filterData(selectOption);
                                });
                              },
                              title: Text(
                                "Invoiced - First due",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            child: RadioListTile(
                              value: 5,
                              groupValue: selectOption,
                              contentPadding: EdgeInsets.zero,
                              activeColor: Constants.greenColor,
                              onChanged: (value) {
                                setSate(() {
                                  Navigator.pop(context);
                                  selectOption = value;
                                  selectSortData(selectOption);
                                  filterData(selectOption);
                                });
                              },
                              title: Text(
                                "Invoiced - First not due",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            );
          });
        });
  }

  selectSortData(int selectOption) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("selectId", selectOption.toString());
  }

  Widget invoiceDetail(dynamic data, int index) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (data['status'] != "Deposited") {
            // checkList(data, data['internalid'].toString(), index);
            showButton = true;
            DataInfo.showButton.value = true;
            toogle(data, data['document'].toString(), index);
          }
        });
      },
      child: Container(
        width: width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data["status"] != "Deposited"
                      ? SizedBox(
                          width: 20,
                          child: Checkbox(
                              value: checkDataList[index],
                              activeColor: Constants.greenColor,
                              onChanged: (value) {
                                //  checkList(data, data['internalid'], index);
                                showButton = true;
                                DataInfo.showButton.value = true;
                                toogle(
                                    data, data['internalid'].toString(), index);
                                setState(() {});
                              }))
                      : SizedBox(
                          width: 20,
                        ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dateCon(data['date']),
                      Container(
                        width: width * 0.78,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ID: " + data["document"],
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Color(0xcc1c201d),
                                        fontSize: 14,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  data["status"] == "Deposited"
                                      ? "PAID: " + data["amount"] + " BHD"
                                      : "AMOUNT DUE: " +
                                          data["amount"] +
                                          " BHD",
                                  textScaleFactor: 1.0,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff1c201d),
                                    fontSize: 12,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.72,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 16),
                            data["status"] != "Deposited"
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // urlGet =
                                        //     "http://164.52.192.76:8080/kalaam/api/payment?internalid=" +
                                        //         data["internalid"].toString() +
                                        //         "&document=" +
                                        //         data["document"].toString() +
                                        //         "&type=" +
                                        //         data["type"].toString() +
                                        //         "&date=" +
                                        //         data["date"].toString() +
                                        //         "&amount=" +
                                        //         data["amount"].toString() +
                                        //         "&currency=" +
                                        //         data["currency"].toString() +
                                        //         "&dueDate=" +
                                        //         data["dueDate"].toString() +
                                        //         "&status=" +
                                        //         data["status"].toString() +
                                        //         "&userid=" +
                                        //         userId +
                                        //         "";
                                        // print("url:" + urlGet.toString());
                                        if (payList.length >= 1) {
                                          payList = [];
                                          totalAMount = 0.0;
                                        }
                                    
                                        // checkDataList = [];
                                        payList.add({
                                          "short_name": shortName,
                                          "payers_id": servicesCategoryID,
                                          "user_id": userId,
                                          "invoice_id":
                                              data['internalid'].toString(),
                                          "invoice_amount":
                                              data['amount'].toString()
                                        });
                                        totalAMount = totalAMount +
                                            double.parse(
                                                data['amount'].toString());
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                MyDialog(payList),
                                          ));
                                    },
                                    child: Container(
                                      width: 96,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: Constants.greenColor,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xff00a817),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Pay",
                                            textScaleFactor: 1.0,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Constants.whiteText,
                                              fontSize: 12,
                                              fontFamily: "Bliss Pro",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 96,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Constants.greyButtonTextColor,
                                      // border: Border.all(
                                      //   color: Constants.greyButtonTextColor,
                                      //   width: 1,
                                      // ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Paid",
                                          textScaleFactor: 1.0,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Constants.whiteText,
                                            fontSize: 12,
                                            fontFamily: "Bliss Pro",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Constants.greySliderColor,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  toogle(var data, String invoiceId, int index) {
    setState(() {
      for (int i = 0; i < checkDataList.length; i++) {
        if (i == index) {
          checkDataList[i] = !checkDataList[i];
        }
      }
      checkList(data, invoiceId, index);
    });
  }

  checkList(var data, String invoiceId, int index) {
    setState(() {
      if (payList.isNotEmpty) {
        if (checkDataList[index]) {
          payList.add({
            "short_name": shortName,
            "payers_id": servicesCategoryID,
            "user_id": userId,
            "invoice_id": data['internalid'].toString(),
            "invoice_amount": data['amount'].toString()
          });
          totalAMount = totalAMount + double.parse(data['amount'].toString());
        } else {
          for (int i = 0; i < payList.length; i++) {
            if (payList[i]['invoice_id'].toString() == invoiceId) {
              totalAMount = totalAMount -
                  double.parse(payList[i]['invoice_amount'].toString());
              payList.removeAt(i);
            }
          }
        }
      } else {
        payList.add({
          "short_name": shortName,
          "payers_id": servicesCategoryID,
          "user_id": userId,
          "invoice_id": data['internalid'].toString(),
          "invoice_amount": data['amount'].toString()
        });
        totalAMount = totalAMount + double.parse(data['amount'].toString());
      }
    });
  }

  Widget paymentBoxCard(Map data, int index, List pay) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          radioOption = index;
        });
      },
      child: Container(
        width: mediaQueryWidth,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              child: Theme(
                data:
                    ThemeData(unselectedWidgetColor: Constants.greySliderColor),
                child: Radio(
                  value: index,
                  activeColor: Constants.greenColor,
                  groupValue: radioOption,
                  onChanged: (int value) {
                    setState(() {
                      radioOption = index;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(
                    WebApis.SERVER_URL + data["image_path"],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "By " + data['description'],
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Constants.headingBlackColor,
                    fontSize: 18,
                    fontFamily: "Bliss Pro",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget invoiceHistory(dynamic data, int index) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dateCon(data['date']),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          show[index] = !show[index];
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * 0.8,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ID: " + data["document"],
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      color: Color(0xcc1c201d),
                                      fontSize: 14,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Paid Amount: " + data['amount'] + " BHD",
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff1c201d),
                        fontSize: 18,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            color: Constants.greySliderColor,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
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
        servicesCategoryID = payersList.first['internalid'].toString();
        servicesCategory = payersList.first['name'];

        if (payersList.length == 0) {
        } else {
          payID = payersList[0]['internalid'];
          payerName = payersList[0]['name'];
        }
        for (int i = 0; i < payersList.length; i++) {
          show.add(false);
        }

        // getservicesCategoryFromWeb();
      });
      billsData(payersList[0]['internalid']);
    } else {
      setState(() {
        load = false;
      });
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
    }
  }

  billsData(String idBill) async {
    setState(() {
      load = true;
      bills.clear();
      billsList = [];
      history.clear();
      invoice.clear();
    });

    var enc = await encryptData(
        {"resource": "Transactions", "keyword": (idBill).toString().trim()});
    var dataAPI = await customerBillsAPI(enc);

    if (dataAPI["RETURN_FLAG"] == true) {
      listData = dataAPI["RETURN_DATA"];
      billsList = dataAPI["RETURN_DATA"];
      print("se:" + listData.toString());
      if (checkDataList.isEmpty) {
        for (int i = 0; i < listData.length; i++) {
          checkDataList.add(false);
        }
      }
     // filterData(selectOption);
    } else {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
    }

    paymentBox();
  }

  void paymentBox() async {
    var dataSignUp = await paymentBoxGet();

    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        paymentBoxList = dataSignUp['RETURN_DATA'];
        shortName = dataSignUp['RETURN_DATA'][0]['short_name'];
      });
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }
    setState(() {
      load = false;
    });
  }

  Widget showPayerWidget(final width, final height) {
    return Container(
      width: width,
      color: Colors.transparent.withOpacity(0.2),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 100.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Container(
                width: width,
                height: 40,
                decoration: BoxDecoration(
                    color: Constants.greenColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: Center(
                  child: Text(
                    "Pay My Service",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    children: List.generate(payersList.length, (i) {
                      return Column(
                        children: [
                          RadioListTile(
                            value: i,
                            groupValue: selectPayerIndex,
                            onChanged: (value) {
                              setState(() {
                                totalAMount = 0.0;
                                checkDataList = [];
                                payList = [];
                                selectPayerIndex = i;
                                servicesCategoryID =
                                    payersList[i]['internalid'].toString();
                                servicesCategory = payersList[i]['name'];
                                billsList = [];
                                showPayerDialog = false;

                                billsData(
                                    payersList[i]['internalid'].toString());
                              });
                            },
                            title: Text(
                              "${payersList[i]['name']}",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            width: width,
                            height: 1.0,
                            color: Colors.grey[200],
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showPayerDialog = false;
                  });
                },
                child: Container(
                  width: width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Constants.greenColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: Center(
                    child: Text(
                      "Cancel",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getSortData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (CustomWidgets.checkValidString(
        sharedPreferences.getString('selectId'))) {
      selectOption = int.parse(sharedPreferences.getString('selectId'));
    }
    setState(() {});
  }

  filterData(int selectOption) async {
    setState(() {
      billsList = sortDataList(selectOption);
      print("da:" + billsList.first.toString());
    });
  }

  List<dynamic> sortDataList(int selectOption) {
    setState(() {
      if (selectOption == 1) {
        billsList = listData;
        return billsList;
      } else if (selectOption == 2) {
        billsList.sort(
          (a, b) =>
              DateFormat('dd/MM/yyyy').parse(a['date'].toString()).compareTo(
                    DateFormat('dd/MM/yyyy').parse(b['date'].toString()),
                  ),
        );
        return billsList;
      } else if (selectOption == 3) {
        billsList.sort(
          (a, b) =>
              DateFormat('dd/MM/yyyy').parse(a['date'].toString()).compareTo(
                    DateFormat('dd/MM/yyyy').parse(b['date'].toString()),
                  ),
        );

        billsList = billsList.reversed.toList();

        return billsList;
      } else if (selectOption == 4) {
        billsList = [];
        for (int i = 0; i < listData.length; i++) {
          if (listData[i]['status'] != "Deposited") {
            billsList.add(listData[i]);
          }
        }
        for (int i = 0; i < listData.length; i++) {
          if (listData[i]['status'] == "Deposited") {
            billsList.add(listData[i]);
          }
        }

        return billsList;
      } else {
        billsList = [];
        for (int i = 0; i < listData.length; i++) {
          if (listData[i]['status'] == "Deposited") {
            billsList.add(listData[i]);
          }
        }
        for (int i = 0; i < listData.length; i++) {
          if (listData[i]['status'] != "Deposited") {
            billsList.add(listData[i]);
          }
        }
        return billsList;
      }
    });
    return billsList;
  }
}

class MyDialog extends StatefulWidget {
  List<dynamic> payList;
  MyDialog(this.payList);
  @override
  State createState() => new MyDialogState(this.payList);
}

class MyDialogState extends State<MyDialog> {
  List<dynamic> payList;
  MyDialogState(this.payList);
  int radioOption = 0;
  double totalAmount = 0.0;
  @override
  void initState() {
    super.initState();
    setState(() {
      for (int i = 0; i < payList.length; i++) {
        totalAmount =
            totalAmount + double.parse(payList[i]['invoice_amount'].toString());
      }
    });
  }

  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final widthCon = MediaQuery.of(context).size.width;
    final heightCon = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Bills2(),
            ));
        return true;
      },
      child: Scaffold(
        body: Container(
          width: widthCon,
          height: heightCon,
          color: Colors.black.withOpacity(0.8),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0x19898a8d),
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                child: Container(
                  height: 250,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Bills2(),
                                    ));
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(right: 15.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1.0, color: Colors.black)),
                                  child: Center(
                                    child: Icon(
                                      Icons.close,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          //height: paymentBoxList.length*80.0,
                          width: width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),

                              // This next line does the trick.

                              itemCount: paymentBoxList.length,
                              itemBuilder: (context, index) {
                                return paymentBoxCard(paymentBoxList[index],
                                    index, paymentBoxList);
                              }),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: GestureDetector(
                            onTap: () {
                              paymentURL();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x2600a817),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Constants.greenColor,
                              ),
                              child: Center(
                                child: Text(
                                  "PAY BHD  ${totalAmount.toStringAsFixed(2).toString()}",
                                  textScaleFactor: 1.0,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xfffafafa),
                                    fontSize: 18,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.bold,
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
            ),
          ),
        ),
      ),
    );
  }

  void paymentURL() async {
    setState(() {
      //load = true;
    });

    var data = {"items": payList, "short_name": shortName};

    var enc = await encryptData(data);
    var dataAPI = await paymentURLgetAPI(enc);

    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  PaymentGateway(dataAPI["RETURN_DATA"].toString()),
            ));
      });
    } else {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
    }
  }

  Widget paymentBoxCard(Map data, int index, List pay) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              radioOption = index;
              shortName = data['short_name'];
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: mediaQueryWidth,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    child: Theme(
                      data: ThemeData(
                          unselectedWidgetColor: Constants.greySliderColor),
                      child: Radio(
                        value: index,
                        activeColor: Constants.greenColor,
                        groupValue: radioOption,
                        onChanged: (int value) {
                          setState(() {
                            radioOption = index;
                            shortName = data['short_name'];
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    child: Text(
                      data['description'],
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Constants.headingBlackColor,
                        fontSize: 20,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      data['description'].toString().contains("Debit")
                          ? Container(
                              width: 90,
                              height: 50,
                              child: Image.network(
                                WebApis.SERVER_URL + data["image_path"],
                              ),
                            )
                          : Container(
                              width: 90,
                              // height: 50,

                              child: Image.network(
                                WebApis.SERVER_URL + data["image_path"],
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class Dropdown {
  String internalid;
  String name;
  Dropdown(this.internalid, this.name);
  String get Name => name;
  String get Id => internalid;
}
