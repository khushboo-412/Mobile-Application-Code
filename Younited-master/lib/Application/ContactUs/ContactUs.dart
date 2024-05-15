import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Completer<GoogleMapController> _controller = Completer();

  String address = "";
  String mobile1 = "";
  String mobile2 = "";
  String email = "";

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.0760, 72.8777),
    zoom: 14.4746,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchContactUs();
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
        appBar: AppBarWidget.centerTitleAppbar(context, 'Contact Us'),
        // Page Name Here
        drawer: Drawer(
          child: SideDrawer.sideDrawer(context),
        ),
        body: MainContainerWidget(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 55, 30, 50),
            child: Container(
              height: mediaQueryHeight * 0.1,
              width: mediaQueryWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
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
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomWidgets.sizedBox(height: 25.0),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RaisedButton(
                            onPressed: () {},
                            elevation: 2.0,
                            color: Colors.white,
                            child: Icon(
                              Icons.add_location,
                              size: 15.0,
                            ),
                            shape: CircleBorder(
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                  style: BorderStyle.solid),
                            ),
                          ),
                          Container(
                            child: SizedBox(
                              width: 180,
                              child: Text(
                                address == "" ? "Loading..." : "$address",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomWidgets.sizedBox(height: 15.0),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RaisedButton(
                            onPressed: () {},
                            elevation: 2.0,
                            color: Colors.white,
                            child: Icon(
                              Icons.call,
                              size: 15.0,
                            ),
                            shape: CircleBorder(
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                  style: BorderStyle.solid),
                            ),
                          ),
                          Container(
                            child: SizedBox(
                              width: 200,
                              child: Text(
                                mobile1 == ""
                                    ? "Loading..."
                                    : "$mobile1 / $mobile2",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomWidgets.sizedBox(height: 15.0),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RaisedButton(
                            onPressed: () {},
                            elevation: 2.0,
                            color: Colors.white,
                            child: Icon(
                              Icons.mail,
                              size: 15.0,
                            ),
                            shape: CircleBorder(
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                  style: BorderStyle.solid),
                            ),
                          ),
                          Container(
                            child: SizedBox(
                              width: 200,
                              child: Text(
                                email == "" ? "Loading..." : "$email",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomWidgets.sizedBox(height: 24.0),
                      Container(
                        padding: EdgeInsets.all(4.0),
                        height: mediaQueryHeight * 0.3,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                      ),
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

  fetchContactUs() async {
    Map data = {"AssociationID": 6};
    final response = await http.post(
      WebApis.CONTACT_US,
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
        address = data['data']['AssociationName'];
        mobile1 = data['data']['PrimaryNumber'];
        mobile2 = data['data']['SecondaryNumber'];
        email = data['data']['Email'];
      });
    } else {
      throw Exception('failed to load');
    }
  }
}
