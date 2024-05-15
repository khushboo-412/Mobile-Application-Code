// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps
import 'package:kalaam/src/services/Library.dart';
import 'package:intl/intl.dart';

class MyTicket extends StatefulWidget {
  @override
  MyTicketState createState() => MyTicketState();
}

class MyTicketState extends State<MyTicket> {
  bool load = false;
  PageController pageSurveyController = PageController();
  int sliderSurveyIndex = 0;
  String startDate = "";
  String endDate = "";
  bool status = false;
  double subtotal = 0.0;
  int sliderIndex = 0;
  List ticketDataList = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      startDate = "";
      endDate = "";
      filters = LinkedHashSet<String>.from(filters).toList();
    });
    ticketList();
    if (isNewTicket) {
      //  survey();
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
                builder: (BuildContext context) => Help(),
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
                        builder: (BuildContext context) => Help(),
                      ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Constants.headingBlackColor,
                )),
            title: Text(
              "My Ticket",
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
              color: Constants.backgroundWhiteColor,
              child:                         load == true ? LoadingHome() :
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: mediaQueryWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "All Tickets",
                                textScaleFactor: 1.0,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Constants.headingBlackColor,
                                  fontSize: 20,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final picked = await showDateRangePicker(
                                        context: context,
                                        lastDate: new DateTime(2100),
                                        firstDate: new DateTime(2000),
                                      );
                                      if (picked != null && picked != null) {
                                        setState(() {
                                          startDate =
                                              picked.start.toIso8601String();
                                          endDate =
                                              picked.end.toIso8601String();
//below have methods that runs once a date range is picked
                                          ticketList();
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Image.asset("images/cal.png"),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                FilterTicket(),
                                          ));
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      width: 30,
                                      height: 31,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Image.asset(
                                                    "images/filter.png",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          filters.length == 0
                                              ? SizedBox()
                                              : Positioned.fill(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 19,
                                                      height: 19,
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            width: 19,
                                                            height: 19,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xfff4f4f4),
                                                                width: 2,
                                                              ),
                                                              color: Constants
                                                                  .greenColor,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            left: 5,
                                                            top: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2),
                                                              child: Text(
                                                                filters.length
                                                                    .toString(),
                                                                textScaleFactor:
                                                                    1.0,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xfff4f4f4),
                                                                  fontSize: 10,
                                                                  fontFamily:
                                                                      "Bliss Pro",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
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
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        SizedBox(
                          width: mediaQueryWidth,
                          height:
                              filters.length == 1 ? 50 : filters.length * 25.0,
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 100 / 15,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: filters.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return filterList(filters, index);
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth,
                    height: 2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Constants.greyButtonColor,
                        width: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                    child: Stack(
                      children: [
                        Container(
                          //height: cartDataList.length*150.0,

                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              // This next line does the trick.

                              itemCount: ticketDataList.length,
                              itemBuilder: (context, index) {
                                return ticket(ticketDataList[index], index,
                                    ticketDataList);
                              }),
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
    );
  }

  Widget filterList(List filters, int i) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0x9900a817),
          width: 1,
        ),
        color: Color(0xfffafafa),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                filters[i],
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: Color(0xcc1c201d),
                    fontSize: 12,
                    fontFamily: "Bliss Pro"),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    filters.remove(filters[i]);

                    /* for(int k=0;k<ticketStatus.length;k++){
                      if(ticketStatus[k]["name"].toString().trim() == filters[i].toString().trim()){

                        selectTicketStatus.remove(ticketStatus[k]["value"].toString());
                      }
                    }
*/

                    ticketList();
                  });
                },
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: Color(0xcc1c201d),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> ticketList() async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({
      "user_id": userId,
      "from_date": startDate == ""
          ? ""
          : DateFormat("dd-MMM-yyyy").format(DateTime.parse(startDate)),
      "to_date": endDate == ""
          ? ""
          : DateFormat("dd-MMM-yyyy").format(DateTime.parse(endDate)),
      "status":
          selectTicketStatus.isNotEmpty ? selectTicketStatus.join(",") : "",
      "sort_by": filters.contains("Latest to Oldest") ? "asc" : "desc"
    });

    var dataSignUp = await ticketListAPI(enc);

    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        if (dataSignUp["RETURN_MSG"] == "No Ticket found.") {
          setState(() {
            ticketDataList = [];
          });
        } else {
          ticketDataList = dataSignUp["RETURN_DATA"];
        }

/*
        for (int i =0; i<ticketDataList.length;i++){
          if(filters.contains(ticketDataList[i]["isActive"].toString().trim())){

          }
          else{
            ticketDataList.remove(ticketDataList[i]);
          }*/
      });
    } else {
      if (dataSignUp["RETURN_MSG"] == "No Ticket found.") {
        setState(() {
          ticketDataList = [];
        });
      }
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }

  Future<void> survey() async {
    setState(() {
      load = true;
    });

    var enc = await encryptData(
        {"survey_status": "RAISED_TICKET", "user_id": userId});
    var dataSignUp = await getSurveyStatusAPI(enc);

    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      var data = dataSignUp["RETURN_DATA"];
      setState(() {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0)),
                      child: Image.network(
                        WebApis.SERVER_URL + data["SurveyImage"],
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    border: Border.all(
                      color: Color(0x19898a8d),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExpandableText(
                          "${data["SurveyName"]}",
                          textScaleFactor: 1.0,
                          expandText: 'read more',
                          collapseText: 'read less',
                          maxLines: 2,
                          linkColor: Constants.greenColor,
                          animation: true,
                          //textScaleFactor: 1.0,
                          style:
                              TextStyle(fontSize: 15, fontFamily: "Bliss Pro"),
                          collapseOnTextTap: true,
                          mentionStyle: TextStyle(
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w600,
                          ),
                          onUrlTap: (url) => launch(url),
                          urlStyle: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
/*
                        Text(
                          data["SurveyName"],
                          maxLines: 5,
                          style: TextStyle(
                            color: Constants.headingBlackColor,
                            fontSize: 14,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
*/
                        SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            data["SurveyDesc"],
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 12,
                                fontFamily: "Bliss Pro"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isNewTicket = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.transparent,
                        /* decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                   */ /* boxShadow: [
                      BoxShadow(
                        color: Color(0x2600a817),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],*/ /*
                   // color: Constants.greenColor,
                  ),*/

                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Center(
                            child: Text(
                              "Skip",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isNewTicket = false;
                        });
                        launch(data["SurveyLink"].toString());
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.transparent,
                        /* decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                     */ /* boxShadow: [
                      BoxShadow(
                        color: Color(0x2600a817),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],*/ /*
                     // color: Constants.greenColor,
                    ),*/

                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Center(
                            child: Text(
                              "Start Survey",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.greenColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }

  Widget ticket(Map data, int index, List ticketlist) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return filters.contains("Open") ||
            filters.contains("Closed") ||
            filters.contains("Hold")
        ? filters.contains(data["isActive"].toString().trim())
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Reply(data["ticket_id"], data["isActive"]),
                      ));
                },
                child: Container(
                  width: mediaQueryWidth,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Constants.backgroundWhiteColor,
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data["product_name"],
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                          color: Color(0xcc1c201d),
                                          fontSize: 18,
                                          fontFamily: "Bliss Pro",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        data["issue"],
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                            color: Color(0xcc1c201d),
                                            fontSize: 13,
                                            fontFamily: "Bliss Pro"),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x0c000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                    color: data["isActive"] == "Open"
                                        ? Constants.greenColor
                                        : data["isActive"] == "Hold"
                                            ? Constants.amberColor
                                            : Constants.greyButtonTextColor,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          data[
                                              "isActive"] /*== "InProgress" ?"In Progress": "Closed"*/,
                                          textScaleFactor: 1.0,
                                          style: TextStyle(
                                            color: Color(0xfff4f4f4),
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
                          SizedBox(height: 8),
                          Container(
                            width: mediaQueryWidth,
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
                      SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat("dd MMM yyyy")
                                  .format(DateTime.parse(data["time"])),
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Color(0x7f1c201d),
                                fontSize: 12,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.72,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "TICKET #" + data["ticket_no"],
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Color(0x991c201d),
                                fontSize: 12,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.72,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: mediaQueryWidth,
                        height: 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Constants.greyButtonColor,
                            width: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox()
        : GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Reply(data["ticket_id"], data["isActive"]),
                  ));
            },
            child: Container(
              width: mediaQueryWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Constants.backgroundWhiteColor,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data["product_name"],
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      color: Color(0xcc1c201d),
                                      fontSize: 18,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    data["issue"],
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        color: Color(0xcc1c201d),
                                        fontSize: 13,
                                        fontFamily: "Bliss Pro"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x0c000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: data["isActive"] == "Open"
                                    ? Constants.greenColor
                                    : data["isActive"] == "Hold"
                                        ? Constants.amberColor
                                        : Constants.greyButtonTextColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      data[
                                          "isActive"] /*== "InProgress" ?"In Progress": "Closed"*/,
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Color(0xfff4f4f4),
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
                      SizedBox(height: 8),
                      Container(
                        width: mediaQueryWidth,
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
                  SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data["time"] == "" || data["time"] == null
                            ? SizedBox()
                            : Text(
                                DateFormat("dd MMM yyyy")
                                    .format(DateTime.parse(data["time"])),
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: Color(0x7f1c201d),
                                  fontSize: 12,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.72,
                                ),
                              ),
                        SizedBox(width: 20),
                        Text(
                          "TICKET #" + data["ticket_no"],
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Color(0x991c201d),
                            fontSize: 12,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.72,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: mediaQueryWidth,
                    height: 2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Constants.greyButtonColor,
                        width: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
  }
}
