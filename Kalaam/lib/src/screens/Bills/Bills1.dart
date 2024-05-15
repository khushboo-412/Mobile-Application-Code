// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables
import 'package:kalaam/src/services/Library.dart';


class Bills1 extends StatefulWidget {
  @override
  Bills1State createState() => Bills1State();
}

class Bills1State extends State<Bills1> {
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

  int radioOption = 0;
  bool showPaymentBox = false;
  String payerId = "";
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    payerData();

    /* if (payID == "" || payID == null || payID.toString() == "null"){
      setState(() {
        load = true;
        bills.clear();
        history.clear();
        invoice.clear();
        payerData();

      });


    }
    else{*/
    paymentBox();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
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
        },
        child:  Scaffold(
          appBar:
              /* PreferredSize(
            preferredSize: Size.fromHeight(100.0), // here the desired height
            child: Container(
              width: width,

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Constants.backgroundWhiteColor,
                    blurRadius: 4,
                    offset: Offset(0, 0),
                  ),],),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(height: 20,),

                  Text(
                    "Bills & Payments",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Constants.headingBlackColor,
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),                  SizedBox(height: 10,),

                  //SizedBox(height: 10,),
                  Container(
                    // width: width*0.85,
                    height: 35,

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Dropdown>(
                        //  icon: Icon(Icons.arrow_drop_down),
                        hint: Text(payersList[0]['name'],

                            style:
                            TextStyle(color: Colors.black,fontFamily: "Bliss Pro")),
                        value: servicesCategoryDropDown,
                        isDense: true,
                        style: TextStyle(
                            color: Colors.black, fontSize: 12),
                        onChanged: (Dropdown _value) {
                          setState(() {
                            servicesCategoryDropDown = _value;
                            servicesCategory =
                                servicesCategoryDropDown.name;
                            servicesCategoryID =
                                servicesCategoryDropDown.internalid;
                            payID = servicesCategoryID;
                            billsData(servicesCategoryID);
                          });
                        },
                        items: servicesCategoryList
                            .map((Dropdown category) {
                          return DropdownMenuItem<Dropdown>(
                            value: category,
                            child: SizedBox(
                              //   width: width*0.88,
                                child: Text(category.name.toString(), maxLines: 2,)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 2,
                    width: width,
                    color: Constants.greySliderColor,

                  ),
                ],),
            ),
          ),*/
              AppBar(
            backgroundColor: Constants.backgroundWhiteColor,
            iconTheme: IconThemeData(color: Colors.black),
            leading: Container(),
            title:
//Align(      alignment: Alignment(-12, 0),

                Text(
              "Bills & Payments",
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
          body: SingleChildScrollView(
            child: Container(
              color: Constants.backgroundWhiteColor,
              child: Padding(
                padding: EdgeInsets.all(width * 0.04),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        payID == ""
                            ? Center(
                                child: Container(
                                  child: Text(
                                    "No Payer Found!",
                                    style: TextStyle(
                                      color: Constants.headingBlackColor,
                                      fontSize: 14,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 10,
                              ),
                        payID == ""
                            ? SizedBox()
                            : Text(
                                "Select Payer",
                                style: TextStyle(
                                  color: Constants.greyTextColor,
                                  fontSize: 14,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        payID == ""
                            ? SizedBox()
                            : SizedBox(
                                height: 10,
                              ),
                        payID == ""
                            ? SizedBox()
                            : Container(
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0x33898a8d),
                                    width: 1,
                                  ),
                                  color: Color(0xfffafafa),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
/*
                                  Container(
                                      width: MediaQuery.of(
                                          context)
                                          .size
                                          .width *
                                          0.9,
                                      child:
                                      PopupMenuButton(
                                        offset:
                                        Offset(0, 30),
                                        child: Padding(
                                          padding: EdgeInsets
                                              .symmetric(
                                              horizontal:
                                              10.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  payerName,
                                                  textScaleFactor:
                                                  1.0,
                                                  overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                  //"Select your category",


                                                    style:
                                                    TextStyle(color: Colors.black,fontFamily: "Bliss Pro")
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Icon(
                                                Icons
                                                    .arrow_drop_down,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        itemBuilder:
                                            (context) {
                                          return List
                                              .generate(
                                              payersList
                                                  .length,
                                                  (index) {
                                                return PopupMenuItem(
                                                    child:
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(
                                                                () {
                                                                  //servicesCategoryDropDown = servicesCategoryList;
                                                                 */
/* servicesCategory =
                                                                      servicesCategoryList[index]['name'];
                                                                  servicesCategoryID =
                                                                  servicesCategoryList[index]['id']; */
                                      /*
                                                                   payID = servicesCategoryID;

                                                                  billsData(payersList[index]['id']);
                                                              FocusScope.of(
                                                                  context)
                                                                  .unfocus();
                                                              Navigator.of(
                                                                  context,
                                                                  rootNavigator: true)
                                                                  .pop();
                                                              // // unfocus();
                                                            });
                                                      },
                                                      child: Container(
                                                          width: width,
                                                          height: 40,
                                                         // color: Colors.white,
                                                        //  alignment: Alignment.centerLeft,
                                                          child: Container(
                                                              width: width,
                                                              child: Text(
                                                                "${payersList[index]['name']}",
                                                                  style:
                                                                  TextStyle(color: Colors.black,fontFamily: "Bliss Pro")
                                                              ))),
                                                    ));
                                              });
                                        },
                                      )),
*/
                                      Container(
                                        width: width * 0.85,
                                        height: 35,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<Dropdown>(
                                            isExpanded: true,
                                            //  icon: Icon(Icons.arrow_drop_down),
                                            hint: Text(payerName,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Bliss Pro")),
                                            value: servicesCategoryDropDown,
                                            isDense: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                            onChanged: (Dropdown _value) {
                                              //FocusScope.of(context).unfocus();

                                              setState(() {
                                                servicesCategoryDropDown =
                                                    _value;
                                                servicesCategory =
                                                    servicesCategoryDropDown
                                                        .Name;
                                                servicesCategoryID =
                                                    servicesCategoryDropDown.Id;
                                                payID =
                                                    servicesCategoryDropDown.Id;

                                                billsData(payID);
                                              });
                                            },
                                            items: servicesCategoryList
                                                .map((Dropdown category) {
                                              return DropdownMenuItem<Dropdown>(
                                                value: category,
                                                child: SizedBox(
                                                    width: width * 0.75,
                                                    child: Text(
                                                      category.name.toString(),
                                                      maxLines: 2,
                                                    )),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),

                                      //Icon(Icons.keyboard_arrow_down_outlined, color: Constants.greyTextColor, ),
                                    ],
                                  ),
                                ),
                              ),
                        payID == ""
                            ? SizedBox()
                            : SizedBox(
                                height: 20,
                              ),
                        payID == ""
                            ? SizedBox()
                            : Container(
                                // height: height * 0.04,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          _pageController.previousPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease);
                                        },
                                        child: Container(
                                          color: Constants.backgroundWhiteColor,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Due Invoices",
                                                  style: TextStyle(
                                                    color: pageIndex == 1
                                                        ? Constants
                                                            .greyTextColor
                                                        : Constants.greenColor,
                                                    fontSize: 18,
                                                    fontFamily: "Bliss Pro",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: width * 0.5,
                                                height: 3,
                                                color: pageIndex == 1
                                                    ? Colors.transparent
                                                    : Constants.greenColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          _pageController.nextPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease);
                                        },
                                        child: Container(
                                          color: Constants.backgroundWhiteColor,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Invoice History",
                                                  style: TextStyle(
                                                    color: pageIndex == 0
                                                        ? Constants
                                                            .greyTextColor
                                                        : Constants.greenColor,
                                                    fontSize: 18,
                                                    fontFamily: "Bliss Pro",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: width * 0.5,
                                                height: 3,
                                                color: pageIndex == 0
                                                    ? Colors.transparent
                                                    : Constants.greenColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        payID == ""
                            ? SizedBox()
                            : SizedBox(
                                height: pageLen * 140.0,
                                child: PageView(
                                  controller: _pageController,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: invoice.length,
                                              itemBuilder:
                                                  (context, int index) {
                                                return invoiceDetail(
                                                    invoice[index]);
                                              }),
                                          // GroupedListView<dynamic, String>(
                                          //   physics:
                                          //       NeverScrollableScrollPhysics(),
                                          //   shrinkWrap: true,
                                          //   sort: false,
                                          //   elements: invoice,

                                          //   groupBy: (element) => element['date'],

                                          //   groupSeparatorBuilder:
                                          //       (String groupByValue) =>
                                          //           dateCon(groupByValue),
                                          //   itemBuilder:
                                          //       (context, dynamic element) =>
                                          //           invoiceDetail(element),

                                          //   useStickyGroupSeparators: true,
                                          //   // optional
                                          //   floatingHeader: true, // optional
                                          //   // order: GroupedListOrder.DESC, //
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: history.length,
                                            itemBuilder: (context, int index) {
                                              return invoiceHistory(
                                                  history[index],
                                                  history.length);
                                            })
                                        // GroupedListView<dynamic, String>(
                                        //   physics:
                                        //       NeverScrollableScrollPhysics(),
                                        //   shrinkWrap: true,
                                        //   sort: false,
                                        //   elements: history,

                                        //   groupBy: (element) => element['date'],

                                        //   groupSeparatorBuilder:
                                        //       (String groupByValue) =>
                                        //           dateCon(groupByValue),

                                        //   itemBuilder:
                                        //       (context, dynamic element) =>
                                        //           invoiceHistory(
                                        //               element, history.length),

                                        //   useStickyGroupSeparators: true,
                                        //   // optional
                                        //   floatingHeader: true, // optional
                                        //   // order: GroupedListOrder.DESC, //
                                        // ),
                                      ],
                                    ),
                                  ],
                                  onPageChanged: (index) {
                                    if (index == 0) {
                                    } else {}
                                    setState(() {
                                      pageIndex = index;
                                      // loadData();
                                    });
                                  },
                                ),
                              ),
                      ],
                    ),
                    load == true ? LoadingProgress("") : SizedBox()
                  ],
                ),
              ),
            ),
          ),
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

  Widget invoiceDetail(dynamic data) {
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ID: " + data["document"],
                          style: TextStyle(
                            color: Color(0xcc1c201d),
                            fontSize: 14,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        /* Text(
                          userName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0x99181b19),
                            fontSize: 12,
                          ),
                        ),*/
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "AMOUNT DUE: " + data["amount"] + " BHD",
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MyDialog(data),
                        ));
                    setState(() {
                      /* showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {

                            return AlertDialog(
                                content: StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState)
                            {
                              return Container(
                                height: paymentBoxList.length * 140.0,
                                width: width,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(


                                    children: [
                                      Container(
                                        //height: paymentBoxList.length*80.0,
                                        width: width,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),

                                            // This next line does the trick.

                                            itemCount: paymentBoxList.length,
                                            itemBuilder: (context, index) {
                                              return paymentBoxCard(
                                                  paymentBoxList[index],
                                                  index, paymentBoxList);
                                            }),
                                      ),


                                      SizedBox(height: 30,),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "\$" + data["amount"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xff1c201d),
                                              fontSize: 14,
                                              fontFamily: "Bliss Pro",
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.72,
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (
                                                          BuildContext context) =>
                                                          PaymentGateway(""),
                                                    ));
                                              },
                                              child: Container(
                                                width: 96,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(8),
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
                                                    "PAY",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xfffafafa),
                                                      fontSize: 14,
                                                      fontFamily: "Bliss Pro",
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],),
                                    ],),
                                ),


                              );

                          }
                      ));}
                      );*/
                      urlGet =
                          "http://164.52.192.76:8080/kalaam/api/payment?internalid=" +
                              data["internalid"].toString() +
                              "&document=" +
                              data["document"].toString() +
                              "&type=" +
                              data["type"].toString() +
                              "&date=" +
                              data["date"].toString() +
                              "&amount=" +
                              data["amount"].toString() +
                              "&currency=" +
                              data["currency"].toString() +
                              "&dueDate=" +
                              data["dueDate"].toString() +
                              "&status=" +
                              data["status"].toString() +
                              "&userid=" +
                              userId +
                              "";
                     
                    });
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (BuildContext context) =>
                    //           PaymentGateway(urlGet),
                    //     ));
                  },
                  child: Container(
                    width: 96,
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xff00a817),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    
                      children: [
                        Text(
                          "Pay",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff00a817),
                            fontSize: 12,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                                    style: TextStyle(
                                      color: Color(0xcc1c201d),
                                      fontSize: 14,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  /* Text(
                                    userName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0x99181b19),
                                      fontSize: 12,
                                    ),
                                  ),*/
                                ],
                              ),
                            ),

                            /*  show[index]== false?
                        Icon(Icons.keyboard_arrow_right, color: Constants.greyTextColor,)
                            :
                        Icon(Icons.keyboard_arrow_down_rounded, color: Constants.greyTextColor,)*/
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Paid Amount: " + data['amount'] + " BHD",
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
          //   SizedBox(height: 10,),
/*
        show[index] ==true? Container(
          width: width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xff00a817), width: 1, ),
          ),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Text(
                "Download Invoice",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff00a817),
                  fontSize: 14,
                  fontFamily: "Bliss Pro",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ): SizedBox(),
*/
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
        if (payersList.length == 0) {
        } else {
          payID = payersList[0]['internalid'];
          payerName = payersList[0]['name'];
          billsData(payersList[0]['internalid']);
        }
        for (int i = 0; i < payersList.length; i++) {
          show.add(false);
        }
       
        getservicesCategoryFromWeb();
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

  void billsData(String idBill) async {
    setState(() {
      load = true;
      bills.clear();
      history.clear();
      invoice.clear();
    });
   
    var enc = await encryptData(
        {"resource": "Transactions", "keyword": (idBill).toString().trim()});
    var dataAPI = await customerBillsAPI(enc);
   

    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);

      bills = dataAPI["RETURN_DATA"];
      

      for (int i = 0; i < bills.length; i++) {
        show.add(false);
        if (bills[i]["status"] == "Open") {
          invoice.add(bills[i]);
        } else {
          history.add(bills[i]);
        }
      }
      

      

      setState(() {
        pageLen =
            history.length > invoice.length ? history.length : invoice.length;
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

  void paymentBox() async {
    var dataSignUp = await paymentBoxGet();

   
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        paymentBoxList = dataSignUp['RETURN_DATA'];
        shortName = dataSignUp['RETURN_DATA'][0]['short_name'];
      });
/*
{id: 1, name: CREDIMAX PAYMENT GATEWAY, short_name: CREPG, image_path:
 assets/images/creditmax.png, description: credit/debit card, isActive: Y,
 created_by: 1, created_date: 2022-07-06 14:26:39, updated_date: 2022-07-07 10:59:30, updated_by: 1}*/
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }
  }
}

class MyDialog extends StatefulWidget {
  var data;
  MyDialog(this.data);
  @override
  State createState() => new MyDialogState(this.data);
}

class MyDialogState extends State<MyDialog> {
  var data;
  MyDialogState(this.data);
  int radioOption = 0;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final widthCon = MediaQuery.of(context).size.width;
    final heightCon = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                height: 220,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        //height: paymentBoxList.length*80.0,
                        width: width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),

                            // This next line does the trick.

                            itemCount: paymentBoxList.length,
                            itemBuilder: (context, index) {
                              return paymentBoxCard(
                                  paymentBoxList[index], index, paymentBoxList);
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
                                "PAY BHD " + data["amount"],
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
    );
  }

  void paymentURL() async {
    setState(() {
      //load = true;
    });

    var enc = await encryptData({
      "user_id": userId,
      "invoice_id": data['document'],
      "short_name": shortName,
      "payers_id": payID,
      "invoice_amount": data["amount"].toString()
    });
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
