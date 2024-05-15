import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Models/BlogModel.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Utils/Constaints.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:flutter_link_preview/flutter_link_preview.dart';
import 'package:younited_application/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Blogs extends StatefulWidget {
  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {

  TextEditingController linkToPost = new TextEditingController();
  Future<BlogModelList> blogListData;

  String _apiStatus = "Loading...";

  @override
  void initState() {
    super.initState();
    blogListData = fetchBlogList();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery
        .of(context)
        .size
        .height;
    final mediaQueryWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: ThemeColors.appbarColor,
      appBar: AppBarWidget.centerTitleAppbar(context, 'Blogs'),
      drawer: Drawer(
        child: SideDrawer.sideDrawer(context),
      ),
      body: MainContainerWidget(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
          child: Column(
            children: [
             /* Container(
                width: mediaQueryWidth,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search"),
                        ),
                      ),
                    ),
                    CustomWidgets.sizedBox(width: 10),
                    Container(
                      width: mediaQueryWidth * 0.3,
                      height: mediaQueryHeight * 0.05,
                      child: Card(
                        child: Center(
                          child: Text("Submit"),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        elevation: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
              CustomWidgets.sizedBox(height: 20),*/
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: mediaQueryHeight * 0.06,
                      width: mediaQueryWidth,
                      padding: EdgeInsets.only(left: 10, bottom: 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                      child: TextField(
                        controller: linkToPost,
                        maxLines: 1,
                        decoration: InputDecoration(
                            hintText: "Post Link",
                            isDense: true,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(linkToPost.text.isNotEmpty){
                        postBlogLink();
                      }
                    },
                    child: Container(
                      height: mediaQueryHeight * 0.06,
                      width: mediaQueryWidth * 0.2,
                      color: ThemeColors.blackText,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1.0),
                          ),
                          Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomWidgets.sizedBox(height: 20),
              Expanded(
                child: FutureBuilder<BlogModelList>(
                  future: blogListData,
                  builder: (context, snapshot){
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.blogModel.length,
                        itemBuilder: (context, index) {
                          return blogList(mediaQueryWidth, mediaQueryHeight, snapshot.data.blogModel[index]);
                        },
                      );
                    } else {
                      return Text("$_apiStatus");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*GestureDetector(
                        onTap: () {
                          if(linkToPost.text.isNotEmpty){
                            postBlogLink();
                          }
                        },
                        child: Container(
                          height: mediaQueryHeight * 0.04,
                          width: mediaQueryWidth * 0.2,
                          color: ThemeColors.blackText,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 1.0),
                              ),
                              Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),*/

  Widget blogList(final mediaQueryWidth, final mediaQueryHeight,
      BlogModel blogModel) {
    return GestureDetector(
        onTap: () {
          _openBlog(blogModel.blogLink);
        },
        child: Column(
          children: <Widget>[
            FlutterLinkPreview(
              url: blogModel.blogLink,
              bodyStyle: TextStyle(
                fontSize: 10.0,
              ),
              titleStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              showMultimedia: true,
              builder: (info) {
                if (info is WebInfo) {
                  return AspectRatio(
                    aspectRatio: 2 / 1.8,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (info.image != null)
                            Container(
                                width: mediaQueryWidth,
                                height: mediaQueryHeight * 0.2,
                                child: Image.network(
                                  info.image,
                                  width: double.maxFinite,
                                  fit: BoxFit.cover,
                                )),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                            child: Text(
                              info.title,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (info.description != null)
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 5, 16.0, 0),
                              child: Text(info.description,
                                  style: TextStyle(fontSize: 12.0)),
                            ),
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ));
  }

  void postBlogLink() async {
    Map data = {
      "AssociationID": associationIdMain,
      "PostLink": linkToPost.text,
      "user_id": userIDMain
    };
    final response = await http.post(
      WebApis.CREATE_BLOG,
      body: json.encode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      Map data = WebResponseExtractor.filterWebData(response, isSubmit: true);
      if (data["code"] == 1) {
        WebResponseExtractor.showToast(data["message"]);
        blogListData = null;
        blogListData = fetchBlogList();
        setState(() {
          linkToPost.text = "";
        });
      }
    }
  }

  Future<BlogModelList> fetchBlogList() async{
    try{
      Map data = {
        "AssociationID": associationIdMain,
      };
      final response = await http.post(
        WebApis.GET_BLOG_LIST,
        body: json.encode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        Map data = WebResponseExtractor.filterWebData(response,
            dataObject: 'BLOG_DATA');
        setState(() {
          _apiStatus = data['message'];
        });
        if (data["code"] == 1) {
          return BlogModelList.fromJson(data['data']);
        }else {
          print(data['message']);
          return null;
        }
      } else {
        throw Exception('failed to load');
      }
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  _openBlog(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


/*
  Widget blogList(final mediaQueryWidth, final mediaQueryHeight) {
    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 5 / 3.2,
        child: Container(
          width: mediaQueryWidth,
          margin: EdgeInsets.only(bottom: 10),
          child: Card(
            shape: eventsCardDecoration,
            elevation: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 4 / 1.4,
                  child: Container(
                    width: mediaQueryWidth,
                    height: mediaQueryHeight * 0.14,
                    decoration: eventsConatinerDecoration.copyWith(
                        image: DecorationImage(
                            image: AssetImage('images/comm.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomWidgets.sizedBox(height: 5.0),
                        Container(
                          child: Text(
                            'Pinterest price IPO above range',
                            style: TextStyle(
                                color: ThemeColors.blackText,
                                fontSize: 18,
                                letterSpacing: 1.0),
                          ),
                        ),
                        CustomWidgets.sizedBox(height: 5.0),
                        Container(
                          child: Text("SOCIALTECHCRUNCH.COM",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.underline)),
                        ),
                        CustomWidgets.sizedBox(height: 10.0),
                        Container(
                          child: Text(
                              "Pinterest will begun trading on the NYSE  tomorrow",
                              style: TextStyle(
                                  color: ThemeColors.blackText,
                                  fontSize: 12.0,
                                  decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  */

/*
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search"),
                    ),
                  ),
                  Container(
                    child: Card(
                      child: Center(
                        child: Text("Submit"),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      elevation: 10.0,
                    ),
                  ),
                ],
              ),*/

/*Container(
                  height: 60,
                  width: mediaQueryWidth,
                  child: Column(
                    children: [
                      Container(
                        height: 2,
                        width: mediaQueryWidth,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),*/

/*@override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeColors.appbarColor,
      appBar: AppBarWidget.centerTitleAppbar(context, 'Blogs'),
      drawer: Drawer(
        child: SideDrawer.sideDrawer(context),
      ),
      body: MainContainerWidget(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
          child: Column(
            children: [
              Container(
                width: mediaQueryWidth,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search"),
                        ),
                      ),
                    ),
                    CustomWidgets.sizedBox(width: 10),
                    Container(
                      width: mediaQueryWidth * 0.3,
                      height: mediaQueryHeight * 0.05,
                      child: Card(
                        child: Center(
                          child: Text("Submit"),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        elevation: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
              CustomWidgets.sizedBox(height: 20),
              Container(
                height: mediaQueryHeight * 0.04,
                width: mediaQueryWidth,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Post Link",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      height: mediaQueryHeight * 0.04,
                      width: mediaQueryWidth * 0.2,
                      color: ThemeColors.blackText,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1.0),
                          ),
                          Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomWidgets.sizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    blogList(mediaQueryWidth, mediaQueryHeight),
                    blogList(mediaQueryWidth, mediaQueryHeight),
                    blogList(mediaQueryWidth, mediaQueryHeight),
                    blogList(mediaQueryWidth, mediaQueryHeight),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget blogList(final mediaQueryWidth, final mediaQueryHeight){
    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 5 / 3.2,
        child: Container(
          width: mediaQueryWidth,
          margin: EdgeInsets.only(bottom: 10),
          child: Card(
            shape: eventsCardDecoration,
            elevation: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 4 / 1.4,
                  child: Container(
                    width: mediaQueryWidth,
                    height: mediaQueryHeight * 0.14,
                    decoration:
                    eventsConatinerDecoration.copyWith(
                        image: DecorationImage(
                            image: AssetImage(
                                'images/comm.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2.0),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        CustomWidgets.sizedBox(height: 5.0),
                        Container(
                          child: Text(
                            'Pinterest price IPO above range',
                            style: TextStyle(
                                color: ThemeColors.blackText,
                                fontSize: 18,
                                letterSpacing: 1.0),
                          ),
                        ),
                        CustomWidgets.sizedBox(height: 5.0),
                        Container(
                          child: Text("SOCIALTECHCRUNCH.COM",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  decoration: TextDecoration
                                      .underline)),
                        ),
                        CustomWidgets.sizedBox(height: 10.0),
                        Container(
                          child: Text("Pinterest will begun trading on the NYSE  tomorrow",
                              style: TextStyle(
                                  color: ThemeColors.blackText,
                                  fontSize: 12.0,
                                  decoration: TextDecoration
                                      .underline)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }*/
