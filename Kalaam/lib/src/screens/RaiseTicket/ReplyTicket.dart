// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps, unused_element
import 'package:kalaam/src/services/Library.dart';
import 'package:intl/intl.dart';

class Reply extends StatefulWidget {
  var id;
  var status;
  Reply(this.id, this.status);
  @override
  ReplyState createState() => ReplyState(this.id, this.status);
}

class ReplyState extends State<Reply> {
  var id;
  var status;
  ReplyState(this.id, this.status);

  bool load = false;
  Map head = {"name": "", "ticket_no": "", "subject": "", "status": ""};
  TextEditingController message = new TextEditingController();
  String sub = "";
  ScrollController listScrollController;

  List<ChatMessage> messages = [];

  bool colorChange = false;
  @override
  void initState() {
    listScrollController = ScrollController();

    //listScrollController.addListener(_scrollListener);

    super.initState();
    allMsg();
  }

  _scrollListener() {
    if (listScrollController.hasClients) {
      final position = listScrollController.position.maxScrollExtent;
      listScrollController.jumpTo(position);
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
                builder: (BuildContext context) => MyTicket(),
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
                        builder: (BuildContext context) => MyTicket(),
                      ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Constants.headingBlackColor,
                )),
            title: Text(
              "Reply",
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
              child: Stack(
                children: [
                  load == true ? LoadingProgress("message") : SizedBox(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: mediaQueryWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0x19898a8d),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x0c101828),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xfffafafa),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x0c101828),
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                    image: DecorationImage(
                                        image: userImage == ""
                                            ? AssetImage("images/dp.png")
                                            : NetworkImage(userImage),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  width: mediaQueryWidth * 0.5,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      head['name'].toString() == "null" ||
                                              head['name'].toString() == "" ||
                                              head['name'].toString() == null
                                          ? SizedBox()
                                          : Text(
                                              head['name'],
                                              textScaleFactor: 1.0,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: "Bliss Pro",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                      Text(
                                        "Ticket No. #" +
                                            head['ticket_no'].toString(),
                                            textScaleFactor: 1.0,
                                        style: TextStyle(
                                          color: Constants.greenColor,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        "Subject : " +
                                            head['subject'].toString(),
                                            textScaleFactor: 1.0,
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 49,
                                  height: 23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Color(0xffd78b10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      head['status'].toString(),
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Constants.whiteText,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Container(
                          width: mediaQueryWidth,
                          height: mediaQueryHeight * 0.78,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(
                              color: Color(0xfff2f2f2),
                              width: 1,
                            ),
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                            itemCount: messages.length,
                            controller: listScrollController,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                                child: Align(
                                  alignment:
                                      (messages[index].messageType == "receiver"
                                          ? Alignment.topLeft
                                          : Alignment.topRight),
                                  child:
                                      messages[index].messageType == "receiver"
                                          ? receiver(
                                              messages[index].messageContent,
                                              messages[index].time)
                                          : sender(
                                              messages[index].messageContent,
                                              messages[index].time),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // status == "Open"
                      //     ? Padding(
                      //         padding: const EdgeInsets.all(15),
                      //         child: Container(
                      //           width: mediaQueryWidth,
                      //           height: 75,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(4),
                      //             color: Color(0x7cefefef),
                      //           ),
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Container(
                      //                   width: mediaQueryWidth * 0.7,
                      //                   child: TextFormField(
                      //                     controller: message,
                      //                     onChanged: (text) {
                      //                       setState(() {
                      //                         colorChange = true;
                      //                       });
                      //                     },
                      //                     textCapitalization:
                      //                         TextCapitalization.sentences,
                      //                     maxLength: 1000,
                      //                     maxLines: 4,
                      //                     decoration: InputDecoration(
                      //                       counterText: "",
                      //                       isDense: true,
                      //                       enabledBorder: InputBorder.none,
                      //                       errorBorder: InputBorder.none,
                      //                       focusedBorder: InputBorder.none,
                      //                       contentPadding: EdgeInsets.all(8),
                      //                       hintText: "Message...",
                      //                       hintStyle: TextStyle(
                      //                         color: Constants.greyTextColor,
                      //                         fontSize: 14,
                      //                       ),
                      //                       helperStyle:
                      //                           TextStyle(fontSize: 12.0),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 TouchRippleEffect(
                      //                   rippleColor: Colors.green.shade200,
                      //                   rippleDuration:
                      //                       Duration(milliseconds: 300),
                      //                   onTap: () {
                      //                     if (message.text == "") {
                      //                       WebResponseExtractor.showToast(
                      //                           "Enter message");
                      //                     } else {
                      //                       sendMsg();
                      //                     }
                      //                   },
                      //                   child: Container(
                      //                     width: 26,
                      //                     height: 61,
                      //                     decoration: BoxDecoration(
                      //                       borderRadius:
                      //                           BorderRadius.circular(4),
                      //                       color: colorChange == true
                      //                           ? Constants.greenColor
                      //                           : Constants.greyButtonTextColor,
                      //                     ),
                      //                     child: Padding(
                      //                       padding: const EdgeInsets.all(4),
                      //                       child: Center(
                      //                           child: Image.asset(
                      //                               "images/arrowW.png")),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     : SizedBox(),
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

  Future<void> survey() async {
    setState(() {
      load = true;
    });
   

    var enc = await encryptData(
        {"survey_status": "CLOSED_TICKET", "user_id": userId});
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
                          style: TextStyle(fontSize: 15),
                          collapseOnTextTap: true,
                          mentionStyle: TextStyle(
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
                            ),
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

  Future<void> allMsg() async {
    setState(() {
      load = true;
    });
  

    var enc = await encryptData({"user_id": userId, "ticket_id": id});
    var dataSignUp = await ticketAllMsgAPI(enc);

   
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      head = dataSignUp["RETURN_DATA"]['head'];
      List data = dataSignUp["RETURN_DATA"]['body'];
      setState(() {
        sub = data[0]['product_name'];
        for (int u = (data.length - 1); u >= 0; u--) {
         
          if (data[u]['msgBy'] == "Admin") {
            messages.add(ChatMessage(
                messageContent: data[u]['message'],
                messageType: "receiver",
                time: data[u]['time']));
          } else {
            messages.add(ChatMessage(
                messageContent: data[u]['message'],
                messageType: "sender",
                time: data[u]['time']));
          }
        }
      });

      if (head['status'] == "Closed") {
        survey();
      }
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }

  Future<void> sendMsg() async {
    setState(() {
      load = true;
    });
   
    var enc = await encryptData(
        {"user_id": userId, "ticket_id": id, "message": message.text});
    var dataSignUp = await ticketReplyAPI(enc);

   
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Reply(id, status),
          ));
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }

  Widget sender(String msg, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x2b12699a),
              ),
              child: Center(
                child: Text(
                  userName.substring(0, 1),
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff12699a),
                    fontSize: 12,
                    fontFamily: "Bliss Pro",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "You",
              textScaleFactor: 1.0,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xcc898a8d),
                fontSize: 12,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color(0xfff2f2f2),
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    msg,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color(0xff898a8d),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat("hh:mm").format(DateTime.parse(time)),
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffb2b8bc),
                        fontSize: 6,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget receiver(String msg, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x1900a817),
              ),
              child: Center(
                child: Text(
                  "A",
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Constants.greenColor,
                    fontSize: 12,
                    fontFamily: "Bliss Pro",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Admin",
              textScaleFactor: 1.0,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xcc898a8d),
                fontSize: 12,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color(0x1900a817),
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    msg,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Color(0xff898a8d),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat("hh:mm").format(DateTime.parse(time)),
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffb2b8bc),
                        fontSize: 6,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  String time;
  ChatMessage(
      {@required this.messageContent,
      @required this.messageType,
      @required this.time});
}
