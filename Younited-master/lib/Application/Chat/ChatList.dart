import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Chat/ChatScreen.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Utils/AppAssets.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseUser loggedInUser;

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final _auth = FirebaseAuth.instance;

  List defaultList = [];
  CollectionReference users = Firestore.instance.collection('user');
  TextEditingController searchUser = TextEditingController();

  List filterList = [];
  String _queryForSearch = "";
  bool _isSearchingInChatList = true;


  _ChatListState(){
    searchUser.addListener(() {
      if(searchUser.text.isEmpty){
        setState(() {
          _isSearchingInChatList = true;
          _queryForSearch = "";
        });
      }else{
        setState(() {
          _isSearchingInChatList = false;
          _queryForSearch = searchUser.text.trim();
        });
      }
    });

  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, '/dashboard');
        return;
      },
      child: Scaffold(
        backgroundColor: ThemeColors.appbarColor,
        appBar: AppBarWidget.centerTitleAppbar(context, 'Chat'),
        drawer: Drawer(
          child: SideDrawer.sideDrawer(context),
        ),
        body: MainContainerWidget(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 25,
                        width: mediaQueryWidth * 0.45,
                        child: TextField(
                          controller: searchUser,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              hintText: "Search"),
                        ),
                      ),
                      /* Container(
                        width: 100,
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/chatscreen");
                          },
                          child: Text("New Chat",
                              style: TextStyle(color: Colors.grey)),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          elevation: 10,
                        ),
                      ),*/
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: users.snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          defaultList = snapshot.data.documents;
                          return _isSearchingInChatList ? defaultChatList() : filterChatList();

                        },
                      ),
                    ),
                  ),
                ),

                /*Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(
                        children: [
                          chatListItem(mediaQueryWidth, mediaQueryHeight),
                          chatListItem(mediaQueryWidth, mediaQueryHeight),
                          chatListItem(mediaQueryWidth, mediaQueryHeight),
                          chatListItem(mediaQueryWidth, mediaQueryHeight),
                        ],
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget defaultChatList(){
    return ListView.builder(
      itemCount: defaultList.length,
      itemBuilder: (context, index) {
        if(defaultList[index]['id'] != loggedInUser.uid) {
          return ChatListItems(defaultList, index);
        }else{
          return SizedBox();
        }
      },
    );
  }

  Widget filterChatList(){
    filterList = new List();
    for(int i = 0; i < defaultList.length; i++){
      String item = defaultList[i]["name"];
      if(item.toLowerCase().contains(_queryForSearch.toLowerCase())){
        filterList.add(defaultList[i]);
      }
    }
    return ListView.builder(
      itemCount: filterList.length,
      itemBuilder: (context, index) {
        if(filterList[index]['id'] != loggedInUser.uid) {
          return ChatListItems(filterList, index);
        }else{
          return SizedBox();
        }
      },
    );
  }

}

// ignore: must_be_immutable
class ChatListItems extends StatefulWidget {
  List<dynamic> defaultList;
  int index;

  ChatListItems(this.defaultList, this.index);

  @override
  _ChatListItemsState createState() => _ChatListItemsState(defaultList, index);
}

class _ChatListItemsState extends State<ChatListItems> {
  List<dynamic> defaultList;
  int index;

  _ChatListItemsState(this.defaultList, this.index);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(defaultList.toString());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Map data = {
          "id": defaultList[index]['id'],
          "email": defaultList[index]['email'],
          "name": defaultList[index]['name'],
          "userProfileImage": defaultList[index]['userProfileImage']
        };
        Navigator.pushReplacementNamed(context, '/chatScreen', arguments: data);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Container(
              width: mediaQueryWidth,
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      elevation: 15,
                      shadowColor: ThemeColors.shadowColor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: defaultList[index]['userProfileImage'] != ""
                            ? CachedNetworkImage(
                          imageUrl: defaultList[index]['userProfileImage'],
                          placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                          new Image.asset(
                            'images/comm.jpg',
                            fit: BoxFit.cover,
                          ),
                        )
                            : Image.asset('${AppAssets.profileImage}'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            defaultList[index]['name'],
                            style: TextStyle(fontSize: 18, letterSpacing: 1.0),
                          ),
                          CustomWidgets.sizedBox(height: 5.0),
                          /*Text(
                            "Hello",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )*/
                        ],
                      ),
                    ),
                  ),
                  /*  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "18:25",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                        // CustomWidgets.sizedBox(height: 2.0),

                        Container(
                          height: 25,
                          width: 25,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: Colors.yellow[700],
                            elevation: 5,
                            child: Center(
                              child: Text(
                                "4",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 80),
              height: 1.0,
              width: mediaQueryWidth,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}

/*defaultList[index]['id'],
            defaultList[index]['email'],
            defaultList[index]['name'],
            defaultList[index]['userProfileImage']*/

/* Widget chatListItem(final mediaQueryWidth, final mediaQueryHeight, final id,
      final email, final name, final userProfileImage) {
    return
  }*/

/*
              Container(
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

/*/*return ListView.builder(
                              itemCount: defaultList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return loggedInUser.uid != defaultList[index]['id']
                                    ? defaultList[index]['name']
                                            .toString()
                                            .toLowerCase()
                                            .contains(
                                                searchUser.text.toLowerCase())
                                        ? chatListItem(
                                            mediaQueryWidth,
                                            mediaQueryHeight,
                                    defaultList[index]['id'],
                                    defaultList[index]['email'],
                                    defaultList[index]['name'],
                                    defaultList[index]['userProfileImage'])
                                        : Container()
                                    : SizedBox();
                              });*/*/