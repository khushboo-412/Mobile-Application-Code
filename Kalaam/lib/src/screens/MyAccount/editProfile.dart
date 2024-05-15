// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use
import 'package:kalaam/src/services/Library.dart';

class EditProfile extends StatefulWidget {
  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
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
  List<Dropdown> countryCodeList = [];
  bool mob = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      name.text = userName;
      mobile.text = userMobile;
    });
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
          return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => AccountDetails(),
              ));
        },
        child: new Scaffold(
            appBar: AppBar(
              backgroundColor: Constants.backgroundWhiteColor,
              iconTheme: IconThemeData(color: Colors.black),
              leading: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AccountDetails(),
                        ));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Constants.headingBlackColor,
                  )),
              title:
//Align(      alignment: Alignment(-12, 0),

                  Text(
                "Edit Profile",
                textScaleFactor: 1.0,
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
                            SizedBox(
                              height: 10,
                            ),
                            /*  SizedBox(
                              width: 256,
                              child: Text(
                                "Edit Profile",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Constants.headingBlackColor,
                                  fontSize: 28,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 30,),*/
                            TextFormField(
                              controller: name,
                              onChanged: (text) {
                                checkColor();
                              },
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
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
                            /* TextFormField(
                              controller: email,
                              onChanged: (text) {
                                checkColor();
                              },
                              keyboardType: TextInputType.emailAddress,


                              validator: (value) {
                                if (value == null || value.isEmpty ||
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
                                labelText:
                                "Email",

                                helperStyle: TextStyle(fontSize: 12.0),
                              ),
                            ),
                            SizedBox(height: 20,),*/
                            IntlPhoneField(
                              controller: mobile,
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
                              initialCountryCode: countryCode,
                              onCountryChanged: (country) {
                              
                              },
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Container(
                            //       width: mediaQueryWidth*0.35,                          height: 35,
                            //
                            //       decoration: BoxDecoration(
                            //         border: Border(
                            //
                            //           bottom: BorderSide(width:  1,   color: Constants.greySliderColor),
                            //         ),),
                            //       child: DropdownButtonHideUnderline(
                            //         child: DropdownButton<Dropdown>(
                            //
                            //           //  icon: Icon(Icons.arrow_drop_down),
                            //           hint: Text(countryShort + " (+"+countryCode + ")",
                            //             /*style:TextStyle(
                            //               color: Constants.labelTextColor,
                            //               fontSize: 16,
                            //               fontFamily: "Bliss Pro",
                            //               fontWeight: FontWeight.w500,
                            //             ),*/),
                            //           value: countryCodeDropDown,
                            //           isDense: true,
                            //           style: TextStyle(
                            //               color: Constants.headingBlackColor ),
                            //           onChanged: (Dropdown _value) {
                            //             setState(() {
                            //               countryCodeDropDown = _value;
                            //               countryCode =
                            //                   countryCodeDropDown.Phonecode;
                            //               countryCodeID =
                            //                   countryCodeDropDown.id;
                            //               countryCodeLength =                                           countryCodeDropDown.phone_max_lenght;
                            //
                            //             });
                            //           },
                            //           items: countryCodeList
                            //               .map((Dropdown category) {
                            //             return DropdownMenuItem<Dropdown>(
                            //               value: category,
                            //               child: Text(category.sortname.toString()+" (+"+category.phonecode.toString() + ")"),
                            //             );
                            //           }).toList(),
                            //         ),
                            //       ),
                            //     ),
                            //     Container(width: mediaQueryWidth*0.5,
                            //       child: TextFormField(
                            //         controller: mobile,
                            //         onChanged: (text) {
                            //           checkColor();
                            //         },
                            //         onTap: (){
                            //           setState(() {
                            //             if(countryCodeLength == "0"){
                            //               WebResponseExtractor.showToast("Select Country Code");
                            //             }
                            //             else{
                            //               mob = false;
                            //             }
                            //           });
                            //         },
                            //         readOnly: mob,
                            //         keyboardType: TextInputType.number,
                            //
                            //         validator: (value) {
                            //           if (value == null || value.isEmpty) {
                            //             return "Enter " + "Mobile Number";
                            //           }
                            //           /*if(value.length!=8){
                            //           return  "Mobile Number should be of 8 digits";
                            //         }*/
                            //           return null;
                            //         },
                            //         maxLength: int.parse(countryCodeLength) == 0 ?1:int.parse(countryCodeLength),
                            //         decoration: InputDecoration(
                            //           counterText: "",
                            //           isDense: true,
                            //           enabledBorder: UnderlineInputBorder(
                            //             borderSide: BorderSide(
                            //                 color: Constants.greySliderColor),
                            //           ),
                            //           focusedBorder: UnderlineInputBorder(
                            //             borderSide: BorderSide(
                            //                 color: Constants.greySliderColor),
                            //           ),
                            //           contentPadding: EdgeInsets.all(0.0),
                            //           labelStyle: TextStyle(
                            //             color: Constants.labelTextColor,
                            //             fontSize: 16,
                            //             fontFamily: "Bliss Pro",
                            //             fontWeight: FontWeight.w500,
                            //           ),
                            //           labelText:
                            //           "Mobile Number",
                            //
                            //           helperStyle: TextStyle(fontSize: 12.0),
                            //         ),
                            //       ),
                            //     ),
                            //
                            //   ],),
                            SizedBox(
                              height: 20,
                            ),
                            /* TextFormField(
                              controller: password,
                              obscureText: showPass,
                              onChanged: (text) {
                                checkColor();
                              },

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter " + "Password";
                                }
                                if (value.length < 6) {
                                  return "Password should be of atleast 6 characters";
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
                                labelText:
                                "Password",

                                suffix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPass = !showPass;
                                    });
                                  },
                                  child: Icon(Icons.remove_red_eye_outlined,
                                    color: Constants.labelTextColor,
                                  ),
                                ),

                                helperStyle: TextStyle(fontSize: 12.0),
                              ),
                            ),
                            SizedBox(height: 20,),
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
                                if (value.length < 6) {
                                  return "Confirm Password should be of atleast 6 characters";
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
                                labelText:
                                "Confirm Password",
                                suffix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showConPass = !showConPass;
                                    });
                                  },
                                  child: Icon(Icons.remove_red_eye_outlined,
                                    color: Constants.labelTextColor,
                                  ),
                                ),
                                helperStyle: TextStyle(fontSize: 12.0),
                              ),
                            ),
                            SizedBox(height: 20,),*/
                            SizedBox(
                              height: 10,
                            ),
/*
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
                                SizedBox(width: 5,),
                                SizedBox(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.8,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                          "By signing up you agree to our ",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(

                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              FlutterWebBrowser.openWebPage(
                                                url: terms,
                                                customTabsOptions: CustomTabsOptions(
                                                  colorScheme: CustomTabsColorScheme
                                                      .dark,
                                                  toolbarColor: Constants
                                                      .greenColor,
                                                  secondaryToolbarColor: Colors
                                                      .green,
                                                  navigationBarColor: Constants
                                                      .greenColor,
                                                  addDefaultShareMenuItem: true,
                                                  instantAppsEnabled: false,
                                                  showTitle: true,
                                                  urlBarHidingEnabled: true,
                                                ),
                                                safariVCOptions: SafariViewControllerOptions(
                                                  barCollapsingEnabled: true,
                                                  preferredBarTintColor: Constants
                                                      .greenColor,
                                                  preferredControlTintColor: Constants
                                                      .greenColor,
                                                  dismissButtonStyle:
                                                  SafariViewControllerDismissButtonStyle
                                                      .close,
                                                  modalPresentationCapturesStatusBarAppearance: true,
                                                ),
                                              );
                                            },

                                          text:
                                          "terms & conditions",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Constants.greenColor
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          " and ",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              FlutterWebBrowser.openWebPage(
                                                url: privacy,
                                                customTabsOptions: CustomTabsOptions(
                                                  colorScheme: CustomTabsColorScheme
                                                      .dark,
                                                  toolbarColor: Constants
                                                      .greenColor,
                                                  secondaryToolbarColor: Colors
                                                      .green,
                                                  navigationBarColor: Constants
                                                      .greenColor,
                                                  addDefaultShareMenuItem: true,
                                                  instantAppsEnabled: false,
                                                  showTitle: true,
                                                  urlBarHidingEnabled: true,
                                                ),
                                                safariVCOptions: SafariViewControllerOptions(
                                                  barCollapsingEnabled: true,
                                                  preferredBarTintColor: Constants
                                                      .greenColor,
                                                  preferredControlTintColor: Constants
                                                      .greenColor,
                                                  dismissButtonStyle:
                                                  SafariViewControllerDismissButtonStyle
                                                      .close,
                                                  modalPresentationCapturesStatusBarAppearance: true,
                                                ),
                                              );
                                            },

                                          text:
                                          "privacy policy.",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Constants.greenColor
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
*/
                            // SizedBox(height: mediaQueryHeight*0.12,),

                            load == true
                                ? Container(
                                    height: 70,
                                  )
                                : Expanded(
                                    child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                      child: Container(
                                        color: Constants.backgroundWhiteColor,
                                        height: 50,
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  setState(() {
                                                    colorChange = true;
                                                  });
                                                  editAccount();
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
                                                        BorderRadius.circular(
                                                            12),
                                                    color:
                                                        Constants.greenColor),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 62,
                                                  vertical: 14,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Opacity(
                                                      opacity: 0.90,
                                                      child: Text(
                                                        "Submit",
                                                        textScaleFactor: 1.0,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Constants
                                                              .whiteText,
                                                          fontSize: 16,
                                                          fontFamily:
                                                              "Bliss Pro",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ), /*
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
                                      )*/
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    load == true ? LoadingSmall() : SizedBox()
                  ],
                ),
              ),
            )),
      ),
    );
  }

  void editAccount() async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({
      "name": name.text,
      "country_code": countryCode,
      "phone": mobile.text,
      "user_id": userId,
    });
    var dataSignUp = await updateProfileAPI(enc);

    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => AccountDetails(),
          ));
    } else {
      setState(() {
        load = false;
      });
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }

  void checkColor() {
    if (name.text == "") {
      setState(() {
        colorChange = false;
      });
    } else {
      if (mobile.text == "") {
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
