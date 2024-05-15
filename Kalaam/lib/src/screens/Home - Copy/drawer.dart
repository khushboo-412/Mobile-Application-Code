/*





import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalaam/src/services/Library.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:kalaam/main.dart';
import 'package:kalaam/src/screens/Bills/Bills.dart';
import 'package:kalaam/src/screens/CaseStudy/CaseStudy.dart';
import 'package:kalaam/src/screens/HelpSupport/Help.dart';

import 'package:kalaam/src/screens/News/News.dart';
import 'package:kalaam/src/screens/Orders/Orders.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:kalaam/src/screens/Partner/JoinPartner.dart';
import 'package:kalaam/src/widgets/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../services/shared.dart';
import '../../widgets/webBrowser.dart';
import '../MyAccount/AccountDetails.dart';
import '../Settings/Settings.dart';
import '../Splash/SplashScreen.dart';
import '../survey/survey.dart';
import 'home.dart';

*/
/*

class DrawerOldClass extends StatefulWidget {
  @override
  DrawerOldClassState createState() => DrawerOldClassState();
}

class DrawerOldClassState extends State<DrawerOldClass> {
  bool showList = true;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Constants.backgroundWhiteColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: new Container(
        color: Constants.backgroundWhiteColor,

        child: SingleChildScrollView(
          child: new Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.close, color: Constants.headingBlackColor,size: 30,),
                  ],
                ),

                SizedBox(height: 20,),

                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MyAccount(),
                        ));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(

                      children: [                    SizedBox(width: 15,),

                        Container(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children:[Positioned.fill(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Color(0xfffafafa), width: 1, ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x0c101828),
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Image.asset("images/dp.png"),
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
                                      children:[Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Color(0xfffafafa), width: 1, ),
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
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Center(child: Icon(Icons.camera_alt, size: 10, color: Constants.whiteText,

                                              )),
                                            ),
                                          ),
                                        ),],
                                    ),
                                  ),
                                ),
                              ),],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                            "Mahmood Hamid Salmaan",
                            style: TextStyle(
                              color: Constants.headingBlackColor,
                              fontSize: 16,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "aishmlan@gmail.com",
                            style: TextStyle(
                              color: Constants.greyTextColor,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "User #123123",
                            style: TextStyle(
                              color: Constants.greyButtonTextColor,
                              fontSize: 12,
                            ),
                          ),

                        ],),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
Container(height: 1,color: Constants.greySliderColor,),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,15,15,10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    GestureDetector(
                      onTap:(){

setState(() {
  showList= !showList;

});

                      },
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "About Kalam",
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 18,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            showList == false? Icon(Icons.keyboard_arrow_right): Icon(Icons.keyboard_arrow_down),

                          ],
                        ),
                      ),
                    ),

                     showList==true?
                     Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "News",
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
SizedBox(height: 10,),

                            Text(
                              "Case Studies",
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10,),

                            Text(
                              "Corporate History",
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ):SizedBox(),
                      showList == false?SizedBox():   SizedBox(height: 20,),
                      showList == false?SizedBox():  Container(height: 1, color: Constants.greySliderColor,),
                      SizedBox(height: 20,),
                    Text(
                      "Survey",
                      style: TextStyle(
                        color: Constants.headingBlackColor,
                        fontSize: 18,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),

                    ),


                      SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  JoinPartner(),
                            ));
                      },
                      child: Container(
                        color: Colors.transparent,

                        child: Text(
                          "Join As A Partner",
                          style: TextStyle(
                            color: Constants.headingBlackColor,
                            fontSize: 18,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),

                        ),
                      ),
                    ),SizedBox(height: 20,),
                    Text(
                      "Help & Support",
                      style: TextStyle(
                        color: Constants.headingBlackColor,
                        fontSize: 18,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),

                    ),SizedBox(height: 20,),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Constants.headingBlackColor,
                        fontSize: 18,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),

                    ),
                    SizedBox(height: 20,),
                    Text(
                      "EULA",
                      style: TextStyle(
                        color: Constants.headingBlackColor,
                        fontSize: 18,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),

                    ),
                      SizedBox(height:
                      showList == false?MediaQuery.of(context).size.height*0.325:
                      MediaQuery.of(context).size.height*0.15,),
                      Row(children: [
                        Transform.rotate(

                            angle: 3.14,
                            child: Icon(Icons.logout)),
SizedBox(width: 10,),
                        Text(
                          "Log out",
                          style: TextStyle(
                            color: Constants.headingBlackColor,
                            fontSize: 18,
                            fontFamily:"Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],),
                  ],),
                ),                    SizedBox(height: 15,),

                Container(height: 1,color: Constants.greySliderColor),
                SizedBox(height: 5,),
                Center(
                  child: Text(
                    "App Version 1.0.0",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Constants.greyTextColor,
                      fontSize: 14,
                    ),
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }



}
*//*


class DrawerClass extends StatefulWidget {
  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  bool showList = true;
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Constants.backgroundWhiteColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: new Container(
        color: Constants.backgroundWhiteColor,

        child: SingleChildScrollView(
          child: new Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              children: <Widget>[
                GestureDetector(
                  onTap:(){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Home(),
                      ));},
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.close, color: Constants.headingBlackColor,size: 30,),
                    ],
                  ),
                ),

                SizedBox(height: 20,),

                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              AccountDetails(),
                        ));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        
                        Container(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children:[Positioned.fill(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Color(0xfffafafa), width: 1, ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x0c101828),
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                    image: DecorationImage(
                                        image:


                                        userImage == ""?
                                        AssetImage("images/dp.png"):
                                        NetworkImage(userImage),
                                        fit: BoxFit.cover), ),

                                ),
                              ),
                            ),
                              */
/*Positioned.fill(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: Stack(
                                      children:[Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Color(0xfffafafa), width: 1, ),
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
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Center(child: Icon(Icons.camera_alt, size: 10, color: Constants.whiteText,

                                              )),
                                            ),
                                          ),
                                        ),],
                                    ),
                                  ),
                                ),
                              ),*//*
],
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              userEmail,
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              userMobile,
                              style: TextStyle(
                                color: Constants.greyButtonTextColor,
                                fontSize: 12,
                              ),
                            ),

                          ],),
                        Icon(Icons.keyboard_arrow_right, color: Constants.greyTextColor,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(height: 1,color: Constants.greySliderColor,),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AccountDetails(),
                              ));
                        },                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset("images/user.png")
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Account Details",
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 18,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),

                            ),
                          ],
                        ),
                      ),
                      ),
                      SizedBox(height: 10,),

                      Container(height: 0.5,color: Constants.greySliderColor,),

                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Bills(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset("images/bill & Payments.svg")
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Bills & Payments",
                                style: TextStyle(
                                  color: Constants.headingBlackColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(height: 0.5,color: Constants.greySliderColor,),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Help(),
                              ));
                        },child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset("images/d4.png")
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Help & Support",
                            style: TextStyle(
                              color: Constants.headingBlackColor,
                              fontSize: 18,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),),
                        ],
                      ),
                      ),
                      SizedBox(height: 10,),

                      Container(height: 0.5,color: Constants.greySliderColor,),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Orders(),
                              ));
                        },                    child: Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:  SvgPicture.asset("images/order.svg")
                            ),
                            SizedBox(width: 8),
                            Text(
                              "My Orders",
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 18,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),

                            ),
                          ],
                        ),
                      ),
                      ),
                      SizedBox(height: 10,),

                      Container(height: 0.5,color: Constants.greySliderColor,),

                      SizedBox(height: 10,),
                      */
/*GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Survey(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,

                          child:  Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset("images/d1.png")
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Survey",
                                style: TextStyle(
                                  color: Constants.headingBlackColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      Container(height: 0.5,color: Constants.greySliderColor,),

                      SizedBox(height: 10,),*//*


                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    JoinPartner(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset("images/d2.png")
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Join as a partner",
                                style: TextStyle(
                                  color: Constants.headingBlackColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(height: 0.5,color: Constants.greySliderColor,),
                      SizedBox(height: 10,),



                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    News(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset("images/news.svg")
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Our News",
                                style: TextStyle(
                                  color: Constants.headingBlackColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(height: 0.5,color: Constants.greySliderColor,),
                      SizedBox(height: 10,),
                    */
/*  GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CaseStudy(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset("images/case study.svg")
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Case Studies",
                                style: TextStyle(
                                  color: Constants.headingBlackColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(height: 0.5,color: Constants.greySliderColor,),
                      SizedBox(height: 10,),*//*


            GestureDetector(
              onDoubleTap: (){},

              onTap: () async{
*/
/*
                FlutterWebBrowser.openWebPage(
                  url: aboutUs,
                  customTabsOptions: CustomTabsOptions(
                    colorScheme: CustomTabsColorScheme.dark,
                    toolbarColor: Constants.greenColor,
                    secondaryToolbarColor: Colors.green,
                    navigationBarColor: Constants.greenColor,
                    addDefaultShareMenuItem: true,
                    instantAppsEnabled: false,
                    showTitle: true,
                    urlBarHidingEnabled: true,
                  ),
                  safariVCOptions: SafariViewControllerOptions(
                    barCollapsingEnabled: true,
                    preferredBarTintColor: Constants.greenColor,
                    preferredControlTintColor: Constants.greenColor,
                    dismissButtonStyle:
                    SafariViewControllerDismissButtonStyle.close,
                    modalPresentationCapturesStatusBarAppearance: true,
                  ),

                );
*//*

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          WebBrowser(aboutUs),
                    ));
                */
/* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  WebBrowser(),
                            ));*//*


              },
              child: Container(
                color: Colors.transparent,
width: MediaQuery.of(context).size.width,

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset("images/s1.png")
                              ),
                              SizedBox(width: 8),
                              Text(
                                "About Us",
                                style: TextStyle(
                                  color: Constants.headingBlackColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      Container(height: 0.5,color: Constants.greySliderColor,),
                      SizedBox(height: 10,),

                      GestureDetector(
                        onDoubleTap: (){},                      onTap: () async{
*/
/*
                        FlutterWebBrowser.openWebPage(
                          url: privacy,
                          customTabsOptions: CustomTabsOptions(
                            colorScheme: CustomTabsColorScheme.dark,
                            toolbarColor: Constants.greenColor,
                            secondaryToolbarColor: Colors.green,
                            navigationBarColor: Constants.greenColor,
                            addDefaultShareMenuItem: true,
                            instantAppsEnabled: false,
                            showTitle: false,
                            urlBarHidingEnabled: false,
                          ),
                          safariVCOptions: SafariViewControllerOptions(
                            barCollapsingEnabled: true,
                            preferredBarTintColor: Constants.greenColor,
                            preferredControlTintColor: Constants.greenColor,
                            dismissButtonStyle:
                            SafariViewControllerDismissButtonStyle.cancel,
                            modalPresentationCapturesStatusBarAppearance: true,
                          ),
                        );
*//*


                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  WebBrowser(privacy),
                            ));
                      },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset("images/s2.png")
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  color: Constants.headingBlackColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      Container(height: 0.5,color: Constants.greySliderColor,),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          setStringPreference("userEmail", "");
                          setStringPreference(
                              "userPass", "");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Splash(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Row(children: [
                            Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset("images/log.png")
                            ),
                            SizedBox(width: 10,),
                            Text(
                              "Log out",
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 18,
                                fontFamily:"Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],),
                        ),
                      ),
            SizedBox(height: 20,),

                      */
/*SizedBox(height:

                      MediaQuery.of(context).size.height*0.11,),*//*


                    ],),
                ),

          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap:(){          launch("https://www.instagram.com/kalaamtelecomgroup/");
                    },
                    child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset("images/insta.svg")
                    ),
                  ),
                  GestureDetector(
                    onTap:(){          launch("https://www.facebook.com/kalaamtelecom");
                    },
                    child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset("images/fb.svg")
                    ),
                  ),
                  GestureDetector(
                    onTap:(){          launch("https://www.linkedin.com/company/kalaam-telecom/mycompany/");
                    },
                    child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset("images/linked.svg")
                    ),
                  ),
                ],),
              SizedBox(height: MediaQuery.of(context).size.height*0.005,),

              SizedBox(height: 15,),

              Container(height: 1,color: Constants.greySliderColor),
              SizedBox(height: 5,),
              Center(
                child: Text(
                  "App Version 2.0.1",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Constants.greyTextColor,
                    fontSize: 14,
                  ),
                ),
              )
            ],),
          ),



              ],
            ),
          ),
        ),
      ),
    );
  }



}*/
