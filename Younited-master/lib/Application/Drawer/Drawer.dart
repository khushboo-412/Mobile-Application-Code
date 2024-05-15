import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:younited_application/Services/UserDataPreferences.dart';
import 'package:younited_application/Utils/AppAssets.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';

import '../../main.dart';

//Navigator.of(context).pushNamed('/dashboard');

class SideDrawer {

  static Widget sideDrawer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: new Material(
        color: ThemeColors.appbarColor,
        child: new Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ThemeColors.appbarColor,
                ThemeColors.appbarColorLight,
              ],
            ),
          ),
          child: new Center(
            child: new Stack(
              children: <Widget>[
                Positioned(
                  child: _circularContainer(
                      500, Colors.transparent, Colors.white38, 1),
                  top: -170.0,
                  left: -170.0,
                ),
                Positioned(
                  child: _circularContainer(
                      200, Colors.transparent, Colors.white38, 1),
                  top: -30.0,
                  left: -30.0,
                ),
                Positioned(
                  child: _circularContainer(
                      400, Colors.transparent, Colors.white38, 40),
                  top: -120.0,
                  left: -120.0,
                ),
                ListView(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 15, 0),
                          child: Container(
                            width: 70,
                            height: 70,
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(50.0),
                              child: Image.network(userImageLinkMain) ?? Image.asset('${AppAssets.profileImage}'),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text('$userNameMain',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    CustomWidgets.sizedBox(height: 30),
                    ListTile(
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      leading: Icon(Icons.home, color: Colors.white),
                      title:
                          Text('Home', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed("/newsFeeds");
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading: Icon(Icons.person, color: Colors.white),
                      title: Text('My Profile',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Map data = {
                          "userId" : userIDMain,
                          "associationId" : associationIdMain,
                          "associationName" : associationNameMain,
                        };
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/dashboard', arguments: data);
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading: Icon(Icons.library_books, color: Colors.white),
                      title: Text('Members Directory',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/memberDirectory');
                      },
                    ),
                    ListTile(
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      leading: Icon(Icons.group, color: Colors.white),
                      title: Text('Committee/Groups',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/committee');
                      },
                    ),
                    ListTile(
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      leading: Icon(Icons.event, color: Colors.white),
                      title: Text('Events/Programs',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/events');
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading:
                          Icon(Icons.branding_watermark, color: Colors.white),
                      title: Text('Meetings',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/meetings');
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading: Icon(Icons.grid_on, color: Colors.white),
                      dense: true,
                      title: Text('Gallery',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/gallery');
                      },
                    ),
                    /*ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading: Icon(Icons.payment, color: Colors.white),
                      title: Text('Payments/Subscriptions',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),*/
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                      VisualDensity(horizontal: 0, vertical: -2.5),
                      leading: Icon(Icons.receipt, color: Colors.white),
                      title: Text('Blogs/News',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed("/blogsNews");
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading:
                          Icon(Icons.notifications_active, color: Colors.white),
                      title: Text('Alerts/Notifications',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed("/alerts");
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading:
                          Icon(Icons.format_align_left, color: Colors.white),
                      title: Text('Opinion Polls',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/opinionPollSummary');
                      },
                    ),
                   /* ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading:
                          Icon(Icons.format_list_bulleted, color: Colors.white),
                      title: Text('Catalogues',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed("/catalog");
                      },
                    ),*/
                   /* ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading: Icon(Icons.business_center, color: Colors.white),
                      title: Text('Trade Offers',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/tradeOffers');
                      },
                    ),*/
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading: Icon(Icons.message, color: Colors.white),
                      title:
                          Text('Chat', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/chat');
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading: Icon(Icons.phone, color: Colors.white),
                      title: Text('Contact Us',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed("/contactUs");
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading: Icon(Icons.error, color: Colors.white),
                      title: Text('About Us',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed("/aboutUs");
                      },
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                      child: Divider(
                        height: 1,
                        endIndent: 50.0,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: 0, vertical: -2.5),
                      leading:
                          Icon(Icons.power_settings_new, color: Colors.white),
                      title: Text('Log Out',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        new UserDataPreferences().clearAllData();
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _circularContainer(
      double height, Color color, Color borderColor, double borderWidth) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }
}
