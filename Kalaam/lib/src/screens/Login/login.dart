// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause
import 'package:kalaam/src/services/Library.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool selectAll = false;
  bool colorChange = false;
  bool showPass = true;
  final _formKey = GlobalKey<FormState>();
  bool load = false;

  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  final box = GetStorage();
  final LocalAuthentication auth = LocalAuthentication();
  bool canAuthenticate = false;
  @override
  void initState() {
    super.initState();
    // checkAuthenticate();
    checkColor();
  }

  void checkColor() {
    if (email.text == "") {
      setState(() {
        colorChange = false;
      });
    } else {
      if (password.text == "") {
        setState(() {
          colorChange = false;
        });
      } else {
        setState(() {
          colorChange = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return Common.canGoBack();
      },
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          /* bottomNavigationBar:  load==true? SizedBox(height: 70,):GestureDetector
              (
              onTap: (){
                if (_formKey.currentState.validate()) {
                  setState(() {
                    colorChange = true;
                  });
                  loginAccount();
                }

              },
              child: Container(
                color: Constants.backgroundWhiteColor,
                height: 130,
                child:  Padding(
                  padding: EdgeInsets.all(mediaQueryWidth*0.04),
                  child:  Column(
                    children: [   Container(
                      width: mediaQueryWidth,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:  colorChange == true?Constants.greenColor:Constants.greyButtonColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 14, ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Opacity(
                            opacity: 0.90,
                            child: Text(
                              "Log in",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: colorChange == true?Constants.whiteText:Constants.greyButtonTextColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
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
                                    CreateAccount(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: mediaQueryWidth,

                          child: Center(
                            child: SizedBox(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                      "New here?",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                      " Create an account",
                                      style: TextStyle(
                                        fontSize: 14,color: Constants.greenColor,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )],
                  ),
                ),
              ),
            ),*/
          body: Container(
            color: Constants.backgroundWhiteColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Container(
                    height: mediaQueryHeight,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            child: Container(
                              width: mediaQueryWidth * 0.7,
                              height: 42,
                              child: Image.asset("images/logoF.png"),
                            ),
                          ),
                          SizedBox(
                            width: 256,
                            child: Text(
                              "Login",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.greyColor,
                                fontSize: 28,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: email,
                            onChanged: (text) {
                              checkColor();
                            },
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !EmailValidator.validate(value)) {
                                return "Enter Registered Email ID ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              counterText: "",
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.greySliderColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.greySliderColor),
                              ),
                              contentPadding: EdgeInsets.all(0.0),
                              labelStyle: TextStyle(
                                color: Constants.labelTextColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                              labelText: "Registered Email ID",
                              helperStyle: TextStyle(fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: password,
                            obscureText: showPass,
                            onChanged: (text) {
                              checkColor();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter " + "Password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              counterText: "",
                              isDense: true,
                              suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showPass = !showPass;
                                  });
                                },
                                child: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Constants.labelTextColor,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.greySliderColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.greySliderColor),
                              ),
                              contentPadding: EdgeInsets.all(0.0),
                              labelStyle: TextStyle(
                                color: Constants.labelTextColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                              labelText: "Password",
                              helperStyle: TextStyle(fontSize: 12.0),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ForgotPassword(),
                                      ));
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 30, 0, 10),
                                    child: Text(
                                      "Forgot Password?",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Constants.greenColor,
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // CustomWidgets.checkValidString(box.read("email"))
                          //     ? GestureDetector(
                          //         onTap: () async {
                          //           final isAuthenticated =
                          //               await LocalAuthApi.authenticate();

                          //           print("auth:" + isAuthenticated.toString());

                          //           if (isAuthenticated) {
                          //             loginAccount();
                          //           }
                          //         },
                          //         child: Container(
                          //           color: Colors.transparent,
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               Icon(
                          //                 Icons.fingerprint_outlined,
                          //                 size: 45,
                          //                 color: Colors.green,
                          //               ),
                          //               SizedBox(
                          //                 width: 10.0,
                          //               ),
                          //               Text(
                          //                 "User fingerprint to login",
                          //                 style: TextStyle(fontSize: 18),
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //       )
                          //     : SizedBox(),
                          Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      colorChange = true;
                                    });
                                    loginAccount();
                                  }
                                },
                                child: Container(
                                  color: Constants.backgroundWhiteColor,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: mediaQueryWidth,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: colorChange == true
                                              ? Constants.greenColor
                                              : Constants.greyButtonColor,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 62,
                                          vertical: 14,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Opacity(
                                              opacity: 0.90,
                                              child: Text(
                                                "Log in",
                                                textScaleFactor: 1.0,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: colorChange == true
                                                      ? Constants.whiteText
                                                      : Constants
                                                          .greyButtonTextColor,
                                                  fontSize: 16,
                                                  fontFamily: "Bliss Pro",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        CreateAccount(),
                                              ));
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          width: mediaQueryWidth,
                                          child: Center(
                                            child: SizedBox(
                                              child: Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "New here?",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: "Bliss Pro",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          " Create an account",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Constants
                                                            .greenColor,
                                                        fontFamily: "Bliss Pro",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  load == true ? LoadingHome() : SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginAccount() async {
    final box = GetStorage();
    setState(() {
      load = true;
    });
    if (email.text.trim().isNotEmpty) {
      setStringPreference("userEmail", email.text);
      setStringPreference("userPass", password.text);
    }

    var enc = await encryptData({
      "email": email.text.trim().isNotEmpty ? email.text : box.read("email"),
      "password":
          password.text.trim().isNotEmpty ? password.text : box.read("password")
    });

    print("login data");
    print(email.text);
    print(password.text);

    var dataSignUp = await login(enc);
    print(dataSignUp);

    /* RETURN_DATA: {id: 7, name: Kalaam, email: kalaam@gmail.com, password: 1a24c3da731f813521e4193f407dffe7c9e1eff6,
    phone: 7897897897, otp: 0, otp_time: 0000-00-00 00:00:00,
     otp_status: 1, isActive: Y, last_loged_in: 2022-05-31 11:25:36, CREATED_BY: 7,
     CREATED_AT: 2022-05-30 17:39:44, UPDATE_BY: 7, UPDATED_AT: 2022-05-31 11:25:36}}*/
    if (dataSignUp["RETURN_FLAG"] == true) {
      CustomWidgets.initializeTimer();
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        userName = dataSignUp["RETURN_DATA"]['name'];
        userEmail = dataSignUp["RETURN_DATA"]['email'];
        userMobile = dataSignUp["RETURN_DATA"]['phone'];
        userId = dataSignUp["RETURN_DATA"]['id'];
        isPartner = dataSignUp["RETURN_DATA"]['partner'];
        countryCode = dataSignUp["RETURN_DATA"]['country_code'];
        newUser = dataSignUp["RETURN_DATA"]['type'] == "1" ? true : false;
        countryShort = dataSignUp["RETURN_DATA"]['sortname'];
        countryCodeLength = dataSignUp["RETURN_DATA"]['phone_max_lenght'];
        countryCodeID = dataSignUp["RETURN_DATA"]['country_id'];
        userImage = dataSignUp["RETURN_DATA"]['image'].toString() == "null"
            ? ""
            : WebApis.SERVER_URL + dataSignUp["RETURN_DATA"]['image'];
      });
      deviceId = await FirebaseMessaging.instance.getToken();

      box.write('name', dataSignUp["RETURN_DATA"]['name']);
      box.write('email', dataSignUp["RETURN_DATA"]['email']);
      box.write(
          'password',
          password.text.trim().isNotEmpty
              ? password.text
              : box.read("password"));
      box.write('phone', dataSignUp["RETURN_DATA"]['phone']);
      box.write('id', dataSignUp["RETURN_DATA"]['id']);
      box.write('partner', dataSignUp["RETURN_DATA"]['partner']);
      box.write('countryCode', dataSignUp["RETURN_DATA"]['country_code']);
      box.write('image', dataSignUp["RETURN_DATA"]['image']);
      box.write('deviceId', dataSignUp["RETURN_DATA"]['device_id']);
      box.write('isLogin', "Y");

      CustomWidgets.setData("name", dataSignUp["RETURN_DATA"]['name']);
      CustomWidgets.setData("email", dataSignUp["RETURN_DATA"]['email']);
      CustomWidgets.setData("phone", dataSignUp["RETURN_DATA"]['phone']);
      CustomWidgets.setData("id", dataSignUp["RETURN_DATA"]['id']);
      CustomWidgets.setData("partner", dataSignUp["RETURN_DATA"]['partner']);
      CustomWidgets.setData(
          "countryCode", dataSignUp["RETURN_DATA"]['country_code']);
      CustomWidgets.setData("image", dataSignUp["RETURN_DATA"]['image']);
      CustomWidgets.setData("deviceId", dataSignUp["RETURN_DATA"]['device_id']);
      if (CustomWidgets.checkValidString(
                  dataSignUp["RETURN_DATA"]['firebase_id']) ==
              false ||
          CustomWidgets.checkValidString(
                  dataSignUp["RETURN_DATA"]['device_id']) ==
              false) {
        await FirebaseServices.checkUser(userEmail, "12345678");
        var enc = await encryptData({
          "user_id": userId,
          "firebase_id": firebaseId,
          "device_id": deviceId,
        });

        await updateToken(enc);
      }
      if (dataSignUp["RETURN_DATA"]['firebase_id'] != firebaseId) {
        await FirebaseServices.checkUser(userEmail, "12345678");
        var enc = await encryptData({
          "user_id": userId,
          "firebase_id": firebaseId,
          "device_id": deviceId,
        });

        await updateToken(enc);
      }
      setState(() {
        load = false;
        appStatePasue = true;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ));
    } else {
      if (dataSignUp["RETURN_MSG"] == "Your account is not verify.") {
        setState(() {
          load = false;
          userId = dataSignUp["RETURN_DATA"]['user_id'];
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => VerifyOTP(),
            ));
      } else if (dataSignUp["RETURN_MSG"]
          .toString()
          .contains("deleted earlier.")) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                dataSignUp["RETURN_MSG"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff1d201e),
                  fontSize: 18,
                  fontFamily: "Bliss Pro",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => CreateAccount(),
                        ));
                  },
                  child: Container(
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x2600a817),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Constants.greenColor,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Go to Sign Up Page",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xfffafafa),
                              fontSize: 16,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        SystemChannels.textInput.invokeMethod('TextInput.hide');

        WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      }
      setState(() {
        load = false;
      });
    }
  }

  void checkAuthenticate() async {
    final isAuthenticated = await LocalAuthApi.authenticate();
    if (isAuthenticated) {
      loginAccount();
    }
  }
}

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;
    try {
      return await _auth.authenticate(
        localizedReason: 'Scan Fingerprint to Authenticate',
      );
    } on PlatformException catch (e) {
      return false;
    }
  }
}
