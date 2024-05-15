// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides

import 'package:intl/intl.dart';
import 'package:kalaam/src/services/DataInfo.dart';
import 'package:kalaam/src/services/Library.dart';

class Bills extends StatefulWidget {
  @override
  BillsState createState() => BillsState();
}

class BillsState extends State<Bills> {
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
  String balance = "";
  bool showPaymentStatus = false;
  TextEditingController amount = TextEditingController();
  bool isSelectPaymentPayer = false;
  String bill = "";
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
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
      bottom: false,
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
        child: Scaffold(
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
          floatingActionButton:
              balance != "0" && balance.isNotEmpty && load == false
                  ? GestureDetector(
                      onTap: () {
                        DataInfo.totalAmount.value = 0.0;

                        setState(() {
                          // showPaymentStatus = true;
                          amount.text = balance;
                          bill = balance;
                          showPayment(width);
                        });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (BuildContext context) => MyDialog(payList),
                        //     ));
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
                                  "Make a Payment",
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
                              // ignore: prefer_const_literals_to_create_immutables
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
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                    child: payersList.length == 1
                                        ? Text(
                                            servicesCategory,
                                            textScaleFactor: 1.0,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: "Bliss Pro",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                servicesCategory,
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: "Bliss Pro",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.white,
                                              )
                                            ],
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
                    balance != "0" && balance.isNotEmpty
                        ? Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Amount Due : ",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "BD : $balance",
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
                              ),
                              Container(
                                width: width,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                            ],
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Container(
                          child: billsList.isNotEmpty
                              ? Scrollbar(
                                  controller: _controller,
                                  thickness: 5.0,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 90.0),
                                    child: ListView.separated(
                                        controller: _controller,
                                        itemBuilder: (context, int index) {
                                          return invoiceDetail(
                                              billsList[index], index);
                                        },
                                        separatorBuilder: (context, index) {
                                          return Divider();
                                        },
                                        itemCount: billsList.length),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    "Transtaction not found.",
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )),
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
            .add(Dropdown(category["internalid"], category["name"]));
      }
    });
  }

  Widget invoiceDetail(dynamic data, int index) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
/*
          if (data['status'] != "Deposited") {
            payList.add({
              "short_name": shortName,
              "payers_id": servicesCategoryID,
              "user_id": userId,
              "invoice_id": data['internalid'].toString(),
              "invoice_amount": data['amount'].toString(),
              "invoice_type": "INVOICE"
            });
            totalAMount = totalAMount + double.parse(data['amount'].toString());
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyDialog(payList),
                ));
          }
*/
        });
      },
      child: Container(
        width: width,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    data["status"] != "Deposited"
                        ? "images/payment-pending-1.svg"
                        : "images/payment-done.svg",
                    width: 45,
                    height: 45,
                    color: Constants.greenColor,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        showDate(data['date']),
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: Color(0xcc1c201d),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        data["status"] == "Deposited"
                            ? "Paid : " + data["amount"] + " BHD"
                            : "Billed : " + data["amount"] + " BHD",
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
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String showDate(String date) {
    return CustomWidgets.checkValidString(date)
        ? DateFormat('dd MMM yyyy').format(DateFormat('d/M/yyyy').parse(date))
        : "";
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
          balance = payersList[0]['balance'].toString();
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
    print("fr:" + dataAPI.toString());
    if (dataAPI["RETURN_FLAG"] == true) {
      listData = dataAPI["RETURN_DATA"];
      billsList = dataAPI["RETURN_DATA"];

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
    print("fe:"+dataSignUp.toString());
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
                                  amount.text =
                                      payersList[i]['balance'].toString();
                                  balance = payersList[i]['balance'].toString();
                                  bill = payersList[i]['balance'].toString();

                                  billsList = [];
                                  showPayerDialog = false;
                                  if (isSelectPaymentPayer) {
                                    showPayment(width);
                                  }
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
                              )),
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

  showPayment(final width) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setSate) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              content: Container(
                width: width,
                height: 400,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Constants.greenColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Custom Payment",
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
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectPaymentPayer = false;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                margin: EdgeInsets.symmetric(horizontal: 15.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1.0, color: Colors.white),
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      payID == ""
                          ? SizedBox()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
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
                                  isSelectPaymentPayer = true;
                                  Navigator.pop(context);
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
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
                                      child: payersList.length == 1
                                          ? Text(
                                              servicesCategory,
                                              textScaleFactor: 1.0,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: "Bliss Pro",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: width * 0.6,
                                                  child: Text(
                                                    servicesCategory,
                                                    textScaleFactor: 1.0,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontFamily: "Bliss Pro",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.white,
                                                )
                                              ],
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
                          width: width,
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value) {
                                setSate(() {
                                  bill = value;
                                });
                              },
                              controller: amount,
                              decoration: InputDecoration(
                                  hintText: "Amount",
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]')),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectPaymentPayer = false;
                            balance = "";
                          });
                          if (amount.text.trim().isNotEmpty &&
                              double.parse(bill.toString()) != 0) {
                            payList.add({
                              "short_name": shortName,
                              "payers_id": servicesCategoryID,
                              "user_id": userId,
                              "invoice_id": servicesCategoryID,
                              "invoice_amount": amount.text,
                              "invoice_type": "PAYER"
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyDialog(payList),
                                ));
                          } else {
                            WebResponseExtractor.showToast(
                                "Please enter amount");
                          }
                        },
                        child: Container(
                          width: width,
                          height: 40,
                          decoration: BoxDecoration(
                              color: amount.text.trim().isNotEmpty
                                  ? double.parse(bill.toString()) != 0
                                      ? Constants.greenColor
                                      : Constants.greyButtonColor
                                          .withOpacity(0.8)
                                  : Constants.greyButtonColor.withOpacity(0.8),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0))),
                          child: Center(
                            child: Text(
                              "Make a Payment",
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
          });
        }).then((value) {
      setState(() {
        amount.clear();
        //   isSelectPaymentPayer = false;
      });
    });
  }

  void getSortData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (CustomWidgets.checkValidString(
        sharedPreferences.getString('selectId'))) {
      selectOption = int.parse(sharedPreferences.getString('selectId'));
    }
    setState(() {});
  }
}

class MyDialog extends StatefulWidget {
  List<dynamic> payList;
  MyDialog(this.payList);
  @override
  State createState() => MyDialogState(this.payList);
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
              builder: (BuildContext context) => Bills(),
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
                                          Bills(),
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
                                // ignore: prefer_const_literals_to_create_immutables
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

    payList[0]['short_name'] = shortName;
    var sendData = payList.first;

    var enc = await encryptData(sendData);
    var dataAPI = await paymentURLgetAPI(enc);

    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      print("fetch api:" + dataAPI["RETURN_DATA"].toString());
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
