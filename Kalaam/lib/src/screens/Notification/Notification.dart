// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use
import 'package:kalaam/src/services/Library.dart';
import 'package:intl/intl.dart';

class Notifications extends StatefulWidget {
  @override
  NotificationsState createState() => NotificationsState();
}

class NotificationsState extends State<Notifications> {
  bool showAlert = false;
  bool load = false;
  List notification = [];
  @override
  void initState() {
    super.initState();
    notifyData();
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
          appBar: showAlert == true
              ? AppBar(
                  backgroundColor: Colors.black.withOpacity(0.8),
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
                  actions: [
                    // GestureDetector(
                    //   onTap: (){
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (BuildContext context) =>
                    //               Manage(),
                    //         ));
                    //   },
                    //
                    //   child: Container(
                    //     color:Colors.transparent,
                    //     child: Padding(
                    //       padding: const EdgeInsets.fromLTRB(10,20,10,10),
                    //       child: Text(
                    //         "Manage",
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //           color: Constants.greenColor,
                    //           fontSize: 16,
                    //           fontFamily: "Bliss Pro",
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                  title:
//Align(      alignment: Alignment(-12, 0),

                      Text(
                    "Notifications",
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
                  elevation: 0,
                )
              : AppBar(
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
                  actions: [
/*
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Manage(),
                      ));
                },

                child: Container(
                  color:Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,20,10,10),
                    child: Text(
                      "Manage",
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
*/
                  ],
                  title:
//Align(      alignment: Alignment(-12, 0),

                      Text(
                    "Notifications",
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
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  color: Constants.backgroundWhiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                        child: Container(
                          //height: notification.length*200.0,
                          child: notification.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  // This next line does the trick.

                                  itemCount: notification.length,
                                  itemBuilder: (context, index) {
                                    return notifyNew(notification[index], index,
                                        notification);
                                  })
                              : Container(
                                  width: mediaQueryWidth,
                                  height: mediaQueryHeight,
                                  padding: EdgeInsets.only(bottom: 100.0),
                                  child: Center(
                                    child: Text(
                                      "No notification found.",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              showAlert == true
                  ? AlertBox("Alert", "Your Payment is due!", "",
                      "Due Date : 30 APR 2022", "Pay Now", "Later")
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget notify() {
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Container(
      width: mediaQueryWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          SizedBox(
            width: mediaQueryWidth,
            child: Text(
              "1 hour ago",
              textScaleFactor: 1.0,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xff9d9d9d),
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ID: 23457y5y8599",
                      style: TextStyle(
                        color: Color(0xcc1c201d),
                        fontSize: 16,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Name : Mr. Tushar Sharma",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0x991c201d),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 42,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$' + "1000",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff1c201d),
                          fontSize: 20,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Due Amount",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0x991c201d),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Constants.greySliderColor,
            height: 1,
          ),
        ],
      ),
    );
  }

  Widget notifyNew(Map data, int index, List notifiList) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Container(
      width: mediaQueryWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 10),
          //
          // SizedBox(
          //   width: mediaQueryWidth,
          //   child: Text(
          //     "1 hour ago",
          //     textAlign: TextAlign.right,
          //     style: TextStyle(
          //       color: Color(0xff9d9d9d),
          //       fontSize: 12,
          //     ),
          //   ),
          // ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["Title"],
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Color(0xcc1c201d),
                        fontSize: 16,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      data["Description"],
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0x991c201d),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
/*
                Container(
                  height: 42,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:[
                      Text(
                        '\$' +"1000",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff1c201d),
                          fontSize: 20,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Due Amount",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0x991c201d),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
*/
              ],
            ),
          ),
          SizedBox(height: 10),

          CustomWidgets.checkValidString(data["Image"]) == false
              ? SizedBox()
              : Container(
                  width: mediaQueryWidth,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x0c000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        WebApis.SERVER_URL + data["Image"],
                        fit: BoxFit.cover,
                      )),
                ),

          SizedBox(height: 8),
          SizedBox(
            width: mediaQueryWidth,
            child: Text(
              DateFormat("dd MMM yyyy")
                  .format(DateTime.parse(data["CreatedDate"])),
                  textScaleFactor: 1.0,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xff9d9d9d),
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 10),

          Container(
            color: Constants.greySliderColor,
            height: 1,
          ),
        ],
      ),
    );
  }

  Future<void> notifyData() async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({
      "user_id": userId,
    });
    notification = await notificationListAPI(enc);
   

    setState(() {
      load = false;
    });
  }
}
