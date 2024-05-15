import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/AppAssets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _lowerValue = 50;
  int _upperValue = 100;

  String aboutUsText =  "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAboutUs();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, "/dashboard");
        return;
      },
      child: Scaffold(
        backgroundColor: ThemeColors.appbarColor,
        appBar: AppBarWidget.centerTitleAppbar(context, 'About Us'),
        // Page Name Here
        drawer: Drawer(
          child: SideDrawer.sideDrawer(context),
        ),
        body: MainContainerWidget(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Container(
                    height: mediaQueryHeight * 0.3,
                    width: mediaQueryWidth * 0.8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.comm),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)),
                    ),
                  ),
                  CustomWidgets.sizedBox(height: 15.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      "Something About Us",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  CustomWidgets.sizedBox(height: 15.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        aboutUsText == "" ? "Loading..." : "$aboutUsText",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
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
    );
  }

  fetchAboutUs() async{
    Map data = {
      "AssociationID":6
    };
    final response = await http.post(
      WebApis.ABOUT_US,
      body: json.encode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      Map data = WebResponseExtractor.filterWebData(response,
          dataObject: 'ASSOCIATION_DATA');
      setState(() {
        aboutUsText = data['data']['About_us'];
      });
    } else {
      throw Exception('failed to load');
    }
  }
}
