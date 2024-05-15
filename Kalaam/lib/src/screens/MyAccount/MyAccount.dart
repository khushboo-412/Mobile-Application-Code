// ignore_for_file: file_names

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalaam/src/services/Library.dart';
import 'package:kalaam/src/screens/Bills/Bills.dart';
import 'package:kalaam/src/screens/MyAccount/AccountDetails.dart';
import 'package:kalaam/src/screens/MyServices/MyServices.dart';
import 'package:kalaam/src/screens/Notification/Notification.dart';
import 'package:kalaam/src/widgets/appbar.dart';
import 'dart:convert';
import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalaam/src/services/Library.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import 'package:intl/intl.dart';




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalaam/src/services/Library.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:image_picker/image_picker.dart';
import 'package:kalaam/main.dart';
import 'package:kalaam/src/screens/ForgotPassword/ChangePassword.dart';
import 'package:kalaam/src/screens/MyAccount/MyAccount.dart';
import 'package:kalaam/src/screens/Notification/Notification.dart';
import 'package:kalaam/src/widgets/appbar.dart';
import 'package:mime/mime.dart';

import '../../services/Api.dart';
import '../../services/WebApis.dart';
import '../../services/WebResponseExtractor.dart';
import '../../widgets/constants.dart';
import '../../widgets/intro_screen.dart';
import '../Home/drawer.dart';

import '../../../main.dart';
import '../../widgets/constants.dart';
import '../../widgets/intro_screen.dart';
import '../Home/drawer.dart';
import '../Home/home.dart';
import '../Orders/Orders.dart';

class MyAccount extends StatefulWidget {
  @override
  MyAccountState createState() => MyAccountState();
}
class MyAccountState extends State<MyAccount> {
bool load = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      accountDetails = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child:WillPopScope(
        onWillPop: () {
          return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    Home(),
              ));
        },
        child: new Scaffold(


          appBar: AppBar(

            backgroundColor: Constants.backgroundWhiteColor,
            iconTheme: IconThemeData(color: Colors.black),
leading: GestureDetector(
    onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  Home(),
            ));
    },
    child: Icon(Icons.arrow_back_ios, color: Constants.headingBlackColor,)),
            title:
//Align(      alignment: Alignment(-12, 0),

            Text(
              "My Account",
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
              child: Column
                (


                children: [
                  SizedBox(height: 20,),

                  Center(
                    child: GestureDetector(
                      onTap: (){
                        _showChooseDialogBox(
                            context, "Upload Profile Photo");
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        child: Stack(
                          children:[Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,


                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x0c101828),
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],

                                  image: DecorationImage(
                                      image:


                                      imageFile != null
                                          ? FileImage(
                                        imageFile,

                                      )
                                          :

                                      userImage == ""?
                                      AssetImage("images/dp.png"):
                                      NetworkImage(userImage),
                                      fit: BoxFit.cover),
                                ),

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
                    ),
                  ),
                  SizedBox(height: 10,),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Text(
                        userName,
                        style: TextStyle(
                          color: Constants.headingBlackColor,
                          fontSize: 20,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        userName+".Co",
                        style: TextStyle(
                          color: Color(0x991c201d),
                          fontSize: 16,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Primary Currency: BHD",
                        style: TextStyle(
                          color: Constants.greyTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
Container(height: 2,color: Constants.greySliderColor,),

                  Padding(
                    padding: EdgeInsets.all(mediaQueryWidth*0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [                  SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AccountDetails(),
                                ));
                          },                    child: Container(
                          width: mediaQueryWidth,
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

                        Container(height: 1,color: Constants.greySliderColor,),

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
                          width: mediaQueryWidth,
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

                        Container(height: 1,color: Constants.greySliderColor,),
                        SizedBox(height: 10,),
                    // GestureDetector(
                    //   onTap: (){
                    //
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (BuildContext context) =>
                    //               MyServices(),
                    //         ));
                    //   },                    child: Container(
                    //   width: mediaQueryWidth,
                    //   color: Colors.transparent,
                    //
                    //         child: Row(
                    //           mainAxisSize: MainAxisSize.min,
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children:[
                    //             Container(
                    //                 width: 24,
                    //                 height: 24,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(8),
                    //                 ),
                    //                 child: Image.asset("images/s2.png")
                    //             ),
                    //             SizedBox(width: 8),
                    //             Text(
                    //               "My Services",
                    //               style: TextStyle(
                    //                 color: Constants.headingBlackColor,
                    //                 fontSize: 18,
                    //                 fontFamily: "Bliss Pro",
                    //                 fontWeight: FontWeight.w500,
                    //               ),
                    //
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(height: 10,),
                    //
                    //     Container(height: 1,color: Constants.greySliderColor,),
                    //     SizedBox(height: 10,),

                        GestureDetector(
                          onTap: (){

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Bills(),
                                ));
                          },                    child: Container(
                          width: mediaQueryWidth,
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
                                    child: Image.asset("images/s3.png")
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Bills & Payments",
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


                      ],),
                  ),


                ],
              ),

            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showChooseDialogBox(
      BuildContext context, String message) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose From:",
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _openCamera(context);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Camera',
                      textScaleFactor: 1.0,
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      _openGallery(context);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Gallery',
                      textScaleFactor: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }



  _openCamera(BuildContext context) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      imageFile = image as File;
      List<int> imageBytes = imageFile.readAsBytesSync();
      base64Image = base64.encode(imageBytes);
      print("base 64 Image :" + base64Image.toString());
      updateProImage(base64Image.toString());
    });


  }

// Open Gallery
  _openGallery(BuildContext context) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      imageFile = image as File;
      List<int> imageBytes = imageFile.readAsBytesSync();
      base64Image = base64.encode(imageBytes);
      print("base 64 Image :" + base64Image.toString());
      updateProImage(base64Image.toString());

    });

    // _showMyDialog(message);
  }

  void updateProImage(String image) async{

    setState(() {
      load = true;

    });

    var enc = await encryptData({
      "user_id": userId,
      "image": image

    });
    var dataAPI = await updateProfileImage(enc);
    print("profile pic"+dataAPI.toString());

    if(dataAPI["RETURN_FLAG"]==true){

      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        load = false;
        userImage =   WebApis.SERVER_URL+ dataAPI["RETURN_DATA"]['image_url'];

      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                MyAccount(),
          ));


    }
    else{
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        load = false;
      });
    }


  }






}

*/
