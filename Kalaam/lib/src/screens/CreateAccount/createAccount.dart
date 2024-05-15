// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks
import 'package:kalaam/src/screens/CreateAccount/restoreOTP.dart';
import 'package:kalaam/src/services/Library.dart';

class CreateAccount extends StatefulWidget {
  @override
  CreateAccountState createState() => CreateAccountState();
}

class CreateAccountState extends State<CreateAccount> {
  bool selectAll = false;
  bool colorChange = false;
  bool showPass = true;
  bool showConPass = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  bool load = false;
  bool success = false;
  String terms = "";
  Dropdown countryCodeDropDown;
  RegExp pass_valid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*_(),.?:;{}|<>]).{8,}$');

  List<Dropdown> countryCodeList = [];
  bool mob = true;
  @override
  void initState() {
    super.initState();
    contactUs();
    getCountryCode();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return SafeArea(
       top: false,
        bottom: false,
      child: WillPopScope(
        onWillPop: () {
          return Common.canGoBack();
        },
        child: new Scaffold(

            /* bottomNavigationBar: load == true
                ? Container(height: 70,)
                : Container(
              color: Constants.backgroundWhiteColor,
              height: 130,
              child: Padding(
                padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                child: Column(
                  children: [ GestureDetector(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        if (mobile.text.length == 8) {
                          if (password.text == confirmPassword.text) {
                            if (selectAll == true) {
                              setState(() {
                                colorChange = true;
                              });
                              createAccount();
                            }
                            else {
                              WebResponseExtractor.showToast(
                                  "Please Agree to our Terms & Conditions and Privacy Policy");
                            }
                          }
                          else {
                            WebResponseExtractor.showToast(
                                "Password and Confirm Password does not match");
                          }
                        }
                        else {
                          WebResponseExtractor.showToast(
                              "Mobile Number should be of 8 digits");
                        }
                      }
                      */ /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Home(),
                          ));*/ /*
                    },
                    child: Container(
                      width: mediaQueryWidth,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colorChange == true
                            ? Constants.greenColor
                            : Constants.greyButtonColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 62, vertical: 14,),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: 0.90,
                            child: Text(
                              "Continue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: colorChange == true
                                    ? Constants.whiteText
                                    : Constants.greyButtonTextColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                    SizedBox(height: 20,),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Login(),
                              ));
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                "Have an account?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text:
                                " Log in",
                                style: TextStyle(
                                  fontSize: 14, color: Constants.greenColor,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),*/
            body: Padding(
              padding: const EdgeInsets.only(top:0),
              child: Container(
          color: Constants.backgroundWhiteColor,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 256,
                                      child: Text(
                                        "Create an account",
                                        textScaleFactor: 1.0,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xff898a8d),
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
                                      controller: name,
                                      onChanged: (text) {
                                        checkColor();
                                      },
                                      keyboardType: TextInputType.name,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.toString().trim() == "") {
                                          return "Enter Full Name ";
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
                                        labelText: "Full Name",
                                        helperStyle: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
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
                                          return "Enter Email";
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
                                        labelText: "Email",
                                        helperStyle: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    /*
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                              Container(
                                                width: mediaQueryWidth*0.35,                          height: 35,

                                                decoration: BoxDecoration(
                                                  border: Border(

                                                    bottom: BorderSide(width:  1,   color: Constants.greySliderColor),
                                                  ),),
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton<Dropdown>(

                                                    //  icon: Icon(Icons.arrow_drop_down),
                                                    hint: Text("Country Code",
                                                        style:TextStyle(
                                                          color: Constants.labelTextColor,
                                                          fontSize: 16,
                                                          fontFamily: "Bliss Pro",
                                                          fontWeight: FontWeight.w500,
                                                        ),),
                                                    value: countryCodeDropDown,
                                                    isDense: true,
                                                    style: TextStyle(
                                                       color: Constants.headingBlackColor ),
                                                    onChanged: (Dropdown _value) {
                                                      setState(() {
                                                        countryCodeDropDown = _value;
                                                        countryCode =
                                                            countryCodeDropDown.Phonecode;
                                                        countryCodeID =
                                                            countryCodeDropDown.id;
                                                        countryCodeLength =                                           countryCodeDropDown.phone_max_lenght;

                                                      });
                                                    },
                                                    items: countryCodeList
                                                        .map((Dropdown category) {
                                                      return DropdownMenuItem<Dropdown>(
                                                        value: category,
                                                        //child: Text(category.phonecode.toString() ),
                                                        child: Text(category.sortname.toString()+" (+"+category.phonecode.toString() + ")"),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                              Container(width: mediaQueryWidth*0.5,
                                                child: TextFormField(
                                                  controller: mobile,
                                                  onChanged: (text) {
                                                    checkColor();
                                                  },
                                                  onTap: (){
                                                    setState(() {
                                                      if(countryCodeLength == "0"){
                                                        WebResponseExtractor.showToast("Select Country Code");
                                                      }
                                                      else{
                                                        mob = false;
                                                      }
                                                    });
                                                  },
                                                  readOnly: mob,
                                                  keyboardType: TextInputType.number,

                                                  validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return "Enter " + "Mobile Number";
                                                    }
                                                    */
                                    /*if(value.length!=8){
                                                    return  "Mobile Number should be of 8 digits";
                                                  }*/
                                    /*

                                                    return null;
                                                  },
                                                  maxLength: int.parse(countryCodeLength) == 0 ?1:int.parse(countryCodeLength),
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
                                                    labelText:
                                                    "Mobile Number",

                                                    helperStyle: TextStyle(fontSize: 12.0),
                                                  ),
                                                ),
                                              ),

                                            ],),
                                                  */
                                    IntlPhoneField(
                                      initialCountryCode: "BH",
                                      controller: mobile,
                                      style: TextStyle(
                                        color: Constants.labelTextColor,
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
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
                                        labelText: "Mobile Number",
                                        helperStyle: TextStyle(fontSize: 12.0),
                                      ),
                                      onChanged: (phone) {
                                        checkColor();
                                        setState(() {
                                          countryCode = phone.countryCode;
                                        });
                                      },
                                      onCountryChanged: (country) {
                                        setState(() {
                                          countryShort = country.flag;
                                        });
                                      },
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
                                        if (value.length < 8) {
                                          return "Password should be of atleast 8 characters";
                                        }
                                        if (!pass_valid.hasMatch(password.text)) {
                                          return "Password should contain uppercase letter, lowercase letter, digit and special character";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        counterText: "",
                                        isDense: true,
                                        errorMaxLines: 2,
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
                                        helperStyle: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: confirmPassword,
                                      obscureText: showConPass,
                                      onChanged: (text) {
                                        checkColor();
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter " + "Confirm Password";
                                        }
                                        if (value.length < 8) {
                                          return "Confirm Password should be of atleast 8 characters";
                                        }
                                        if (!pass_valid
                                            .hasMatch(confirmPassword.text)) {
                                          return "Password should contain uppercase letter, lowercase letter, digit and special character";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        counterText: "",
                                        isDense: true,
                                        errorMaxLines: 2,
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
                                        labelText: "Confirm Password",
                                        suffix: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showConPass = !showConPass;
                                            });
                                          },
                                          child: Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Constants.labelTextColor,
                                          ),
                                        ),
                                        helperStyle: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          child: Checkbox(
                                              value: selectAll,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectAll = !selectAll;
                                                  checkColor();
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.8,
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "By signing up you agree to our ",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: "Bliss Pro",
                                                  ),
                                                ),
                                                TextSpan(
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          // FlutterWebBrowser.openWebPage(
                                                          //   url: terms,
                                                          //   customTabsOptions: CustomTabsOptions(
                                                          //     colorScheme: CustomTabsColorScheme
                                                          //         .dark,
                                                          //     toolbarColor: Constants
                                                          //         .greenColor,
                                                          //     secondaryToolbarColor: Colors
                                                          //         .green,
                                                          //     navigationBarColor: Constants
                                                          //         .greenColor,
                                                          //     addDefaultShareMenuItem: true,
                                                          //     instantAppsEnabled: false,
                                                          //     showTitle: true,
                                                          //     urlBarHidingEnabled: true,
                                                          //   ),
                                                          //   safariVCOptions: SafariViewControllerOptions(
                                                          //     barCollapsingEnabled: true,
                                                          //     preferredBarTintColor: Constants
                                                          //         .greenColor,
                                                          //     preferredControlTintColor: Constants
                                                          //         .greenColor,
                                                          //     dismissButtonStyle:
                                                          //     SafariViewControllerDismissButtonStyle
                                                          //         .close,
                                                          //     modalPresentationCapturesStatusBarAppearance: true,
                                                          //   ),
                                                          // );
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    WebBrowser(
                                                                        terms),
                                                              ));
                                                        },
                                                  text: "terms & conditions",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: "Bliss Pro",
                                                      color:
                                                          Constants.greenColor),
                                                ),
                                                TextSpan(
                                                  text: " and ",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: "Bliss Pro",
                                                  ),
                                                ),
                                                TextSpan(
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    WebBrowser(
                                                                        privacy),
                                                              ));
                                                          // FlutterWebBrowser.openWebPage(
                                                          //     url: privacy,
                                                          //     customTabsOptions: CustomTabsOptions(
                                                          //       colorScheme: CustomTabsColorScheme
                                                          //           .dark,
                                                          //       toolbarColor: Constants
                                                          //           .greenColor,
                                                          //       secondaryToolbarColor: Colors
                                                          //           .green,
                                                          //       navigationBarColor: Constants
                                                          //           .greenColor,
                                                          //       addDefaultShareMenuItem: true,
                                                          //       instantAppsEnabled: false,
                                                          //       showTitle: true,
                                                          //       urlBarHidingEnabled: true,
                                                          //     ),
                                                          //     safariVCOptions: SafariViewControllerOptions(
                                                          //       barCollapsingEnabled: true,
                                                          //       preferredBarTintColor: Constants
                                                          //           .greenColor,
                                                          //       preferredControlTintColor: Constants
                                                          //           .greenColor,
                                                          //       dismissButtonStyle:
                                                          //       SafariViewControllerDismissButtonStyle
                                                          //           .close,
                                                          //       modalPresentationCapturesStatusBarAppearance: true,
                                                          //     ),
                                                          //   );
                                                        },
                                                  text: "privacy policy.",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: "Bliss Pro",
                                                      color:
                                                          Constants.greenColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    // SizedBox(height: mediaQueryHeight*0.12,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        load == true
                            ? Container(
                                height: 70,
                              )
                            : Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: Container(
                                  color: Constants.backgroundWhiteColor,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (_formKey.currentState.validate()) {
                                            if (password.text ==
                                                confirmPassword.text) {
                                              if (selectAll == true) {
                                                setState(() {
                                                  colorChange = true;
                                                });
                                                createAccount();
                                              } else {
                                                WebResponseExtractor.showToast(
                                                    "Please Agree to our Terms & Conditions and Privacy Policy");
                                              }
                                            } else {
                                              WebResponseExtractor.showToast(
                                                  "Password and Confirm Password does not match");
                                            }
                                          }
                                          /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                            Home(),
                                    ));*/
                                        },
                                        child: Container(
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
                                                  "Continue",
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
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Login(),
                                                ));
                                          },
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Have an account?",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Bliss Pro",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: " Log in",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Constants.greenColor,
                                                    fontFamily: "Bliss Pro",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  load == true ? LoadingSmall() : SizedBox()
                ],
              ),
          ),
        ),
            )),
      ),
    );
  }

  void createAccount() async {
    setState(() {
      load = true;
    });
    deviceId = await FirebaseMessaging.instance.getToken();
    await FirebaseServices.signUp(email.text, "12345678");
    /*setStringPreference("userEmail", email.text);
    setStringPreference(
        "userPass", password.text);*/
    Map data = {
      "name": name.text,
      "email": email.text,
      "phone": mobile.text,
      "password": password.text,
      "confirm_password": confirmPassword.text,
      "firebase_id": firebaseId,
      "device_id": deviceId,
    };

    print("send data:" + data.toString());

    var enc = await encryptData({
      "name": name.text,
      "email": email.text,
      "phone": mobile.text,
      "password": password.text,
      "country_code": countryCode,
      "confirm_password": confirmPassword.text,
      "firebase_id": firebaseId,
      "device_id": deviceId,
    });
    var de = {
      "name": name.text,
      "email": email.text,
      "phone": mobile.text,
      "password": password.text,
      "country_code": countryCode,
      "confirm_password": confirmPassword.text,
      "firebase_id": firebaseId,
      "device_id": deviceId,
    };
    print("send data 1:" + de.toString());
    var dataSignUp = await signUp(enc);
    print("signup acc");
    print(dataSignUp);
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      // bool status =
      //     await FirebaseServices.userLogin(email.text.trim(), "12345678");
      setState(() {
        userId = dataSignUp["RETURN_DATA"]["user_id"].toString();
        otpCreate = dataSignUp["RETURN_DATA"]["otp"].toString();
      });

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => VerifyOTP(),
          ));
    } else {

     // WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      if(dataSignUp["RETURN_TYPE"] == "popup"){
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    dataSignUp["RETURN_MSG"],
                    maxLines: 5,
                    style: TextStyle(
                      color: Constants.headingBlackColor,
                      fontSize: 20,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {

                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.transparent,


                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Center(
                            child: Text(
                              "No",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 18,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        sendRestOtp();
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.transparent,


                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Center(
                            child: Text(
                              "Yes",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.greenColor,
                                fontSize: 18,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
      else{
        WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      }
    }

    setState(() {
      load = false;
    });
  }

  void sendRestOtp() async {
    setState(() {
      load = true;
    });
    var enc = await encryptData({
      "email": email.text,
      "phone": mobile.text,
    });
    print(enc);

    var dataSignUp = await sendRestoreOTP(enc);
    print("rest otp acc");
    print(dataSignUp);
    if (dataSignUp["RETURN_FLAG"] == true) {
      setState(() {
        userId = dataSignUp["RETURN_DATA"]['user_id'];

      });

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => RestoreOTP(),
          ));
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }
    setState(() {
      //  load = false;
    });
  }



  void checkColor() {
    if (name.text == "") {
      setState(() {
        colorChange = false;
      });
    } else {
      if (email.text == "") {
        setState(() {
          colorChange = false;
        });
      } else {
        if (mobile.text == "") {
          setState(() {
            colorChange = false;
          });
        } else {
          if (password.text == "") {
            setState(() {
              colorChange = false;
            });
          } else {
            if (confirmPassword.text == "") {
              setState(() {
                colorChange = false;
              });
            } else {
              if (selectAll == false) {
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
        }
      }
    }
  }

  void contactUs() async {
    var dataAPI = await contactAPI();

    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        if (dataAPI["RETURN_DATA"]["support_number"] != "" ||
            dataAPI["RETURN_DATA"]["support_number"] != null) {
          contactNo = dataAPI["RETURN_DATA"]["support_number"];
          terms = dataAPI["RETURN_DATA"]["terms_and_condition"];
          privacy = dataAPI["RETURN_DATA"]["privacy_policy"];
        }
      });
    } else {
      setState(() {});
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
    }
  }

  Future<Null> getCountryCode() async {
    setState(() {
      load = true;
    });
    // test nowsole

    var jsonData = await countryCodeGet();

    setState(() {
      // what is happening >
      for (Map category in jsonData) {
        countryCodeList.add(new Dropdown(category["id"], category["phonecode"],
            category["phone_max_lenght"], category['sortname']));
      }
      load = false;
    });
  }
}

class Dropdown {
  String id;
  String phonecode;
  String phone_max_lenght;
  String sortname;

  Dropdown(this.id, this.phonecode, this.phone_max_lenght, this.sortname);
  String get Phonecode => phonecode;
  String get Id => id;
  String get Sortname => sortname;
  String get Phone_max_lenght => phone_max_lenght;
}
