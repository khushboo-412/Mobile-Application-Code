// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, deprecated_member_use, unnecessary_brace_in_string_interps

import 'package:kalaam/src/services/Library.dart';
import 'package:kalaam/src/screens/RaiseTicket/RaiseTicket.dart';

class Help extends StatefulWidget {
  @override
  HelpState createState() => HelpState();
}

class HelpState extends State<Help> {
  bool load = false;
  bool showContactDetails = false;
  @override
  void initState() {
    super.initState();

    setState(() {
      filters.clear();
      isNewTicket = false;
      selectTicketStatus.clear();
    });
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
        child: Scaffold(
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
              "Help & Support",
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
          bottomNavigationBar: AppBarWidget.bottomBarHelp(context, ""),
          body: SingleChildScrollView(
            child: Container(
              color: Constants.backgroundWhiteColor,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
/*
                      Padding(
                          padding: EdgeInsets.all(0),
                          child:
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RaiseTicket(),
                                  ));
                            },
                            child: Opacity(
                              opacity: 0.90,
                              child: Container(
                                width: mediaQueryWidth,
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Color(0x19898a8d), width: 1, ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x0c000000),
                                      blurRadius: 8,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                  color: Color(0xfffafafa),
                                ),

                                child:

                                Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10,45,10,10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Raise ticket to receive",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "Bliss Pro",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            "support from us",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "Bliss Pro",
                                              color: Constants.greenColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],),
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Transform.translate(
                                          offset: Offset(0, -5.5),
                                          child:Container(
                                              width: 70,
                                              height: 70,
                                              child: Image.asset("images/raise.png")),
                                        ),
                                        Transform.translate(
                                          offset: Offset(0, -10),
                                          child: Icon(Icons.arrow_forward_ios, color: Constants.greyTextColor,),
                                        ),
                                      ],
                                    ),
                                  ],),


                              ),
                            ),
                          )
                      ),
*/
                        // SizedBox(height: 20,),
                        /* Text(
                        "Support",
                        style: TextStyle(
                          color: Constants.headingBlackColor,
                          fontSize: 18,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20,),*/
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RaiseTicket(),
                                ));
                          },
                          child: Container(
                            width: mediaQueryWidth,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: SvgPicture.asset(
                                          "images/raiseticket.svg",
                                          color: Constants.greyTextColor,
                                        )),
                                    SizedBox(width: 14),
                                    Text(
                                      "Raise Your Ticket",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Constants.greyHelpColor,
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          width: mediaQueryWidth,
                          height: 1,
                          color: Constants.greySliderColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => MyTicket(),
                                ));
                          },
                          child: Container(
                            width: mediaQueryWidth,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Image.asset("images/tick.png"),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "Track Your Ticket",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Constants.greyHelpColor,
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          width: mediaQueryWidth,
                          height: 1,
                          color: Constants.greySliderColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => FAQ(),
                                ));
                          },
                          child: Container(
                            width: mediaQueryWidth,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Image.asset("images/faq.png"),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "FAQ",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Constants.greyHelpColor,
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          width: mediaQueryWidth,
                          height: 1,
                          color: Constants.greySliderColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showContactDetails = !showContactDetails;
                            });
                          },
                          child: Container(
                            width: mediaQueryWidth,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: SvgPicture.asset(
                                          "images/contactus.svg",
                                          color: Constants.greyTextColor,
                                        )),
                                    SizedBox(width: 14),
                                    Text(
                                      "Contact Us",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Constants.greyHelpColor,
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                showContactDetails
                                    ? Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 20,
                                      ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          width: mediaQueryWidth,
                          height: 1,
                          color: Constants.greySliderColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        showContactDetails
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      launch("tel://+" + contactNo);
                                    },
                                    child: Container(
                                      width: mediaQueryWidth,
                                      color: Colors.transparent,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: SvgPicture.asset(
                                                    "images/call.svg",
                                                    color:
                                                        Constants.greyTextColor,
                                                  )),
                                              SizedBox(width: 14),
                                              Text(
                                                "Call (+${contactNo})",
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                  color:
                                                      Constants.greyHelpColor,
                                                  fontSize: 15,
                                                  fontFamily: "Bliss Pro",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_right,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 1,
                                    color: Constants.greySliderColor,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Uri emailLaunchUri = Uri(
                                        scheme: 'mailto',
                                        path: emailContact,
                                      );

                                      launchUrl(emailLaunchUri);
                                    },
                                    child: Container(
                                      width: mediaQueryWidth,
                                      color: Colors.transparent,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Image.asset(
                                                    "images/email.png",
                                                    color:
                                                        Constants.greyTextColor,
                                                  )),
                                              SizedBox(width: 14),
                                              Text(
                                                "Email (${emailContact})",
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                  color:
                                                      Constants.greyHelpColor,
                                                  fontSize: 15,
                                                  fontFamily: "Bliss Pro",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_right,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 1,
                                    color: Constants.greySliderColor,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      whatsapp();
                                      launch(
                                          "https://wa.me/+" + contactNo + "/");
                                    },
                                    child: Container(
                                      width: mediaQueryWidth,
                                      color: Colors.transparent,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    child: SvgPicture.asset(
                                                      "images/whatsapp.svg",
                                                      color: Constants
                                                          .greyTextColor,
                                                    ),
                                                  )),
                                              SizedBox(width: 14),
                                              Text(
                                                "WhatsApp (+${contactNo})",
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                  color:
                                                      Constants.greyHelpColor,
                                                  fontSize: 15,
                                                  fontFamily: "Bliss Pro",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_right,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 1,
                                    color: Constants.greySliderColor,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )
                            : SizedBox(),
                        /* GestureDetector(
                          onTap: () {
                            whatsapp();
                            launch("https://wa.me/+97316100100/");
                          },
                          child: Container(
                            width: mediaQueryWidth,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SvgPicture.asset(
                                            "images/email.svg",
                                            color: Constants.greyTextColor,
                                          ),
                                        )),
                                    SizedBox(width: 14),
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                        color: Constants.greyHelpColor,
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),*/
                        /*   Container(
                        width: mediaQueryWidth,
                        height: 1,
                        color: Constants.greySliderColor,
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: mediaQueryWidth,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset("images/chat.png"),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  "Chat with us",
                                  style: TextStyle(
                                    color: Constants.greyHelpColor,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            Icon(Icons.keyboard_arrow_right, size: 20,),
                          ],
                        ),
                      ),*/
                        /* SizedBox(height: 10,),*/
                      ],
                    ),
                  ),

/*
                  Container(
                    width: mediaQueryWidth,
                    height: 2,
                    color: Constants.greySliderColor,
                  ),*/

                  /*  Padding(
                    padding: EdgeInsets.all(mediaQueryWidth*0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HelpfulTips(),
                                ));
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Helpful Tips",
                                  style: TextStyle(
                                    color: Constants.headingBlackColor,
                                    fontSize: 18,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Text(
                                  "View All",
                                  style: TextStyle(
                                    color: Constants.greenColor,
                                    fontSize: 12,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 150,
                          color: Colors.transparent,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              listView("images/l1.png","How to Replace MPLS with WAN?"),
                              listView("images/l2.png","Set up a managed shared network "),
                              listView("images/l1.png","How to Replace MPLS with WAN?"),
                              listView("images/l2.png","Set up a managed shared network "),

                            ],
                          ),
                        ),








                      ],
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth,
                    height: 2,
                    color: Constants.greySliderColor,

                  ),

*/

                  /* showContact?
              Container(
                    width: mediaQueryWidth,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x19898a8d), width: 1, ),
                      color: Colors.white,
                    ),

                    child: Padding(
                      padding: EdgeInsets.all(mediaQueryWidth*0.04),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    SizedBox(
                                      width: mediaQueryWidth,
                                      child: Text(
                                        "Need to talk to our customer executive?",
                                        style: TextStyle(
                                          color: Color(0xff1c201d),
                                          fontSize: 16,
                                          fontFamily: "Bliss Pro",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width: mediaQueryWidth,
                                      child: Text(
                                        "Fill the contact form and our customer executive will\nget in touch with you in 24 hours.",
                                        style: TextStyle(
                                          color: Color(0xcc1c201d),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          GestureDetector(
                            onTap: (){
                              launch("tel://${contactNo}");

                            },
                            child: Container(
                              width: double.infinity,
                              height: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x0c00a817),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Constants.greenColor,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 8, ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:[
                                  Text(
                                    "Contact",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xfffafafa),
                                      fontSize: 16,
                                      fontFamily: "Roboto",
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
                  ):SizedBox(),*/
                  //     SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listView(String im, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0x0c101828),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(
          bottom: 12,
        ),
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
                  Container(
                    width: double.infinity,
                    height: 86,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0x19898a8d),
                        width: 1,
                      ),
                    ),
                    child: Image.asset(im),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            text,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: Constants.headingBlackColor,
                              fontSize: 14,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),
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
      ),
    );
  }

  void whatsapp() async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({"user_id": userId, "head": "whatsapp"});
    var dataAPI = await whatsappAPI(enc);

    if (dataAPI["RETURN_FLAG"] == true) {
      //   WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        /*if(dataAPI["RETURN_DATA"]["support_number"] != "" || dataAPI["RETURN_DATA"]["support_number"] != null){
          contactNo = dataAPI["RETURN_DATA"]["support_number"];
          privacy = dataAPI["RETURN_DATA"]["privacy_policy"];
          aboutUs = dataAPI["RETURN_DATA"]["aboout_us"];

          showContact = true;
        }*/
      });
    } else {
      //WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);

    }
  }
}
