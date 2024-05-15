import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'dart:ui';
import 'package:younited_application/Utils/AppAssets.dart';
import 'package:http/http.dart' as http;
import 'package:younited_application/Utils/Common.dart';
import 'dart:convert';

import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';

import '../../main.dart';

class LoginByPin extends StatefulWidget {
  @override
  _LoginByPinState createState() => _LoginByPinState();
}

class _LoginByPinState extends State<LoginByPin> {

  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _pinController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: Common.canGoBack,
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: new AssetImage('${AppAssets.loginBackground}'),
                  fit: BoxFit.cover)),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                alignment: Alignment.center,
                color: Colors.grey.withOpacity(0.34),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomWidgets.sizedBox(height: 100.0),
                        Column(
                          children: [
                            Image.asset('${AppAssets.youLogo}'),
                            Align(
                              child: Text('Welcome Back',
                                  style: TextStyle(
                                    color: ThemeColors.whiteText,
                                    fontSize: 25.0,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                          ],
                        ),
                        CustomWidgets.sizedBox(height: 80.0),
                        Container(
                          width: mediaQueryWidth,
                          child: TextFormField(
                            controller: _pinController,
                            cursorColor: Colors.white.withOpacity(0.5),
                            maxLength: 6,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(
                                  6),
                            ],
                            decoration: InputDecoration(
                                counter: SizedBox(),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                labelText: 'Enter Your PIN',
                                hintText: '......',
                                hintStyle: TextStyle(
                                  color: ThemeColors.whiteText
                                      .withOpacity(0.5),
                                ),
                                fillColor: Colors.white,
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                )),
                            obscureText: true,
                            autocorrect: false,
                            onChanged: (value) {
                              if(value.length == 6){
                                _loginUser();
                              }
                            },
                          ),
                        ),

                        /*Container(
                          width: mediaQueryWidth,
                          child: RaisedButton(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            shape: new RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              'Log In',
                              style: TextStyle(color: Colors.black),
                            ),
                            color: Colors.amber[400],
                            onPressed: () {
                            },
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _loginUser() async {

      var userPin = int.parse(_pinController.text.trim());

      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String userMobile = sharedPreferences.getString("userMobile");

      _pinController.text.length < 6
          ? WebResponseExtractor.showToast("Invalid Pin Length")
          : null;

      Map data = {
        "pin":userPin,
        "PrimaryNumber": userMobile // Need To Change Here
      };

      final response = await http.post(
        WebApis.LOGIN_BY_PIN,
        body: json.encode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map;
        var returnCode = jsonData['RETURN_CODE'];
        var returnMessage = jsonData['RETURN_MESSAGE'];
        var associationData = jsonData['ASSOCIATION_DATA'];
        if (returnCode == 1) {
          WebResponseExtractor.showToast(returnMessage);
          Navigator.of(context).pushReplacementNamed('/associationList', arguments: associationData);
        }else{
          WebResponseExtractor.showToast(returnMessage);
        }
      } else {
        throw Exception('failed to load');
      }

    }

}