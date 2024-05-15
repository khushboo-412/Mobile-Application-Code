import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Utils/AppAssets.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Utils/Constaints.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:intl/intl.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:younited_application/main.dart';

FirebaseUser loggedInUser;
final _firestore = Firestore.instance;
String receiverId;
String currentId;

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  var data;

  ChatScreen(this.data);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  File file;
  bool showEmojiKeyboard = false;

  bool showEmojiPicker = false;
  FocusNode textFieldFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    receiverId = widget.data['id'];
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        currentId = loggedInUser.uid;
      }
    } catch (e) {}
  }

  final sendMsg = TextEditingController();

  showKeyboard() => textFieldFocus.requestFocus();

  hideKeyboard() => textFieldFocus.unfocus();

  hideEmojiContainer() {
    setState(() {
      showEmojiPicker = false;
    });
  }

  showEmojiContainer() {
    setState(() {
      showEmojiPicker = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    String userId;
    List list = [];
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeColors.appbarColor,
      appBar: AppBarWidget.centerTitleAppbar(context, 'Chat'),
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
                    /* Container(
                      height: 25,
                      width: mediaQueryWidth * 0.45,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            hintText: "Search"),
                      ),
                    ),*/
                    Container(
                      width: 100,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/chat');
                        },
                        child: Text("New Chat",
                            style: TextStyle(color: Colors.grey)),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        elevation: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 70,
                width: mediaQueryWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: ThemeColors.appbarColor,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      width: 70,
                      height: 70,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        shadowColor: ThemeColors.shadowColor,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child:CachedNetworkImage(
                            imageUrl:widget.data['userProfileImage'],
                            placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                            errorWidget: (context, url, error) => new Image.asset(
                              'images/comm.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomWidgets.sizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        child: Text(
                          widget.data['name'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.0),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: FutureBuilder(
                      future: FirebaseAuth.instance.currentUser(),
                      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                        if (snapshot.hasData) {
                          userId = snapshot.data.uid;

                          return StreamBuilder(
                              stream: Firestore.instance
                                  .collection('message')
                                  .document(snapshot.data.uid)
                                  .collection(
                                    widget.data['id'],
                                  )
                                  .orderBy('time', descending: true)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Container(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator());
                                } else {
                                  list = snapshot.data.documents;

                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: list.length,
                                      reverse: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            child:
                                                loggedInUser.uid ==
                                                        list[index]
                                                            ['ReceiverId']
                                                    ? Wrap(
                                                        spacing: 8,
                                                        runSpacing: 10,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional
                                                                    .topStart,
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50.0),
                                                                  color: ThemeColors
                                                                      .appbarColor,
                                                                ),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            30,
                                                                        vertical:
                                                                            5),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      list[index]
                                                                          [
                                                                          'Message'],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              15),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right,
                                                                    )
                                                                  ],
                                                                )),
                                                          ),
                                                        ],
                                                      )
                                                    : loggedInUser.uid ==
                                                            list[index]
                                                                ['SenderId']
                                                        ? Wrap(
                                                            spacing: 8,
                                                            runSpacing: 10,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional
                                                                        .topEnd,
                                                                child:
                                                                    Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(50.0),
                                                                          color:
                                                                              Colors.grey[200],
                                                                        ),
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                30,
                                                                            vertical:
                                                                                5),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Text(
                                                                              list[index]['Message'],
                                                                              style: TextStyle(color: ThemeColors.appbarColor, fontSize: 15),
                                                                              textAlign: TextAlign.right,
                                                                            )
                                                                          ],
                                                                        )),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox(),
                                          ),
                                        );
                                      });
                                }
                              });
                        }
                        return Container(
                          alignment: Alignment.bottomCenter,
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ),
              showEmojiPicker
                  ? Container(
                      child: emojiContainer(),
                    )
                  : Container(),
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
                    CustomWidgets.sizedBox(height: 10.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                width: mediaQueryWidth,
                                height: mediaQueryHeight * 0.055,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.grey[100],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.sentiment_satisfied_alt_outlined,
                                              size: 20,
                                            ),
                                            onPressed: () {
                                              if (!showEmojiPicker) {
                                                hideKeyboard();
                                                showEmojiContainer();
                                              } else {
                                                showKeyboard();
                                                hideEmojiContainer();
                                              }
                                            })),
                                    Expanded(
                                      child: TextField(
                                        controller: sendMsg,
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.send_outlined,
                                  color: Colors.indigo[900],
                                ),
                                onPressed: () async {
                                  setState(() {
                                    DateTime nows = DateTime.now();

                                    String formattedDate =nows.microsecondsSinceEpoch.toString();
                                        /*DateFormat('yyyy-MM-dd hh:mm:ss')
                                            .format(nows);*/
                                    Firestore.instance

                                        .collection("message")
                                        .document(loggedInUser.uid)
                                        .collection(
                                          widget.data['id'],
                                        )
                                        .add({
                                      "SenderId": loggedInUser.uid,
                                      "ReceiverId": widget.data['id'],
                                      "Message": sendMsg.text,
                                      "time": formattedDate,
                                      'messageType': 'text',
                                      'image_url': 'url',
                                    });
                                    Firestore.instance
                                        .collection("message")
                                        .document(widget.data['id'])
                                        .collection(loggedInUser.uid)
                                        .add({
                                      "SenderId": loggedInUser.uid,
                                      "ReceiverId": widget.data['id'],
                                      "Message": sendMsg.text,
                                      "time": formattedDate,
                                      'messageType': 'text',
                                      'image_url': 'url',
                                    });



                                  });

                                  sendMsg.clear();
                                }),
                          ],
                        ),
                      ),
                    ),
                    CustomWidgets.sizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  emojiContainer() {
    return EmojiPicker(
      bgColor: Colors.black,
      indicatorColor: ThemeColors.appbarColor,
      rows: 3,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        sendMsg.text = sendMsg.text + emoji.emoji;
      },
      numRecommended: 50,
    );
  }

  Widget showEmoji(BuildContext context) {
    if (!showEmojiKeyboard) return Container();
    //hide keyboard
    FocusScope.of(context).requestFocus(new FocusNode());
    //create emojipicker
    return EmojiPicker(
      rows: 4,
      columns: 7,
      bgColor: Colors.lightBlueAccent,
      indicatorColor: Colors.grey,
      onEmojiSelected: (emoji, category) {
        sendMsg.text = sendMsg.text + emoji.emoji;
      },
    );
  }

  Widget buildSticker(BuildContext context) {
    return EmojiPicker(
      rows: 3,
      columns: 7,
      buttonMode: ButtonMode.MATERIAL,
      recommendKeywords: ["racing", "horse"],
      numRecommended: 10,
      onEmojiSelected: (emoji, category) {
        print(emoji);
      },
    );
  }
//  showAttachmentBottomSheet(context){
//    showModalBottomSheet(
//        context: context,
//        builder: (BuildContext bc){
//          return Container(
//            child:  Wrap(
//              children: <Widget>[
//                ListTile(
//                    leading:  Icon(Icons.image),
//                    title:  Text('Image'),
//                    onTap: () => showFilePicker(FileType.image,"image")
//                ),
//                ListTile(
//                    leading:  Icon(Icons.videocam),
//                    title:  Text('Video'),
//                    onTap: () => showFilePicker(FileType.video,"video")
//                ),
//                ListTile(
//                  leading:  Icon(Icons.insert_drive_file),
//                  title:  Text('File'),
//                  onTap: () => showFilePicker(FileType.any,"any"),
//                ),
//              ],
//            ),
//          );
//        }
//    );
//  }
//
// Future showFilePicker(FileType fileType,String type) async {
//    // file = await FilePicker.getFile(type: fileType);
//    //chatBloc.dispatch(SendAttachmentEvent(chat.chatId,file,fileType));
//    Navigator.pop(context);
//    //GradientSnackBar.showMessage(context, 'Sending attachment..');
//  }
}

/*
                            Expanded(
                              child: Container(
                                height: mediaQueryHeight * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.grey[100],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                        child: IconButton(
                                            icon: Icon(
                                              Icons
                                                  .sentiment_satisfied_alt_outlined,
                                              size: 20,
                                            ),
                                            onPressed: () {
                                              if (!showEmojiPicker) {
                                                hideKeyboard();
                                                showEmojiContainer();
                                              } else {
                                                showKeyboard();
                                                hideEmojiContainer();
                                              }
                                            })),
                                    Expanded(
                                      child: Container(
                                        child: TextField(
                                          controller: sendMsg,
                                          focusNode: textFieldFocus,
                                          onTap: () => hideEmojiContainer(),
                                          decoration: InputDecoration(
                                            isDense: true,
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    /* Container(
                                        width: 35,
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.attach_file_outlined,
                                              size: 20,
                                            ),
                                            onPressed: () {})),
                                    Container(
                                        margin: EdgeInsets.only(right: 10),
                                        width: 35,
                                        child: IconButton(
                                            icon: Icon(
                                              Icons
                                                  .center_focus_strong_outlined,
                                              size: 20,
                                            ),
                                            onPressed: () {})),*/
                                  ],
                                ),
                              ),
                            ),*/
