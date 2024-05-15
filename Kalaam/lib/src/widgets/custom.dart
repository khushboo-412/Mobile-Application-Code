// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps
import 'package:kalaam/src/services/DataInfo.dart';
import 'package:kalaam/src/services/Library.dart';
import 'package:intl/intl.dart';

class CustomWidgets {
  static SizedBox sizedBox({double width = 0.0, double height = 0.0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static void showAlertWidgetDialog(final context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        String contentText =
            "Your session has been timed out. Please login again.";
        return AlertDialog(
          title: Text("Alert"),
          content: Text(contentText),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                CustomWidgets.checkSession();
                try {
                  timer.cancel();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Login(),
                      ));
                } catch (e) {
                  print("error:" + e.toString());
                }
                //Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    ).then((value) {
      CustomWidgets.checkSession();
      try {
        timer.cancel();

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Login(),
            ));
      } catch (e) {
        print("error:" + e.toString());
      }
    });
  }

  static void showAppDialog(final context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        String contentText = "Are you sure want to logout?";
        return AlertDialog(
          title: Text("Kalaam"),
          content: Text(contentText),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                checkSession();
                Navigator.push(
                    navigatorKey.currentContext,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Login(),
                    ));
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    ).then((value) {});
  }

  static setSession() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("session", date.toString());
     
    } catch (e) {
      print("error:" + e.toString());
    }
  }

  static checkSession() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.setString("userEmail", "");
    // sharedPreferences.setString("userPass", "");
    
    sharedPreferences.clear();
    caseStudyList = [];
    otpForget = "";
    isPartner = "";

    otpCreate = "";

    privacy = "";
    aboutUs = "";
    isNewTicket = false;
    isNewOrder = false;
    catList = [];
    selectTicketStatus = [];
    selectTicketName = [];
    ticketStatus = [];
    accountDetails = false;
    userId = "";
    imageFile;
    productCount = 0;
    itemCount = 0;
    priceCount = 0.0;
    countryCode = "";
    countryCodeID = "";
    countryShort = "";
    paymentBoxList = [];
    shortName = "";
    userName = "";
    payID = "";
    payerName = "";
    bills = [];
    pageLen = 0;
    invoice = [];
    history = [];
    userImage = "";
    userEmail = "";
    userMobile = "";
    showContact = false;
    payersList = [];
    contactNo = "";
    emailContact = "";
    firebaseId = "";
    deviceId = "";
    filterCount = 0;
    newUser = true;
    countryCodeLength = "0";
    // sharedPreferences.setString("session", DateTime.now().toString());

    // if (CustomWidgets.checkValidString(
    //     sharedPreferences.getString("session"))) {
    //   Duration diff = DateTime.now()
    //       .difference(DateTime.parse(sharedPreferences.getString("session")));
    //   print("rf:" + diff.inSeconds.toString());
    //   if (diff.inSeconds > 10) {
    //     sharedPreferences.setString("userEmail", "");
    //     sharedPreferences.setString("userPass", "");

    //     sharedPreferences.clear();
    //   }
    // } else {
    //   setSession();
    // }
  }

  static Future checkSessionStatus() async {
    if (DataInfo.sessionActive.value) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      // sharedPreferences.setString("session", DateTime.now().toString());

      if (CustomWidgets.checkValidString(
          sharedPreferences.getString("session"))) {
        Duration diff = DateTime.now()
            .difference(DateTime.parse(sharedPreferences.getString("session")));

        if (diff.inSeconds > DataInfo.sessionTime.value) {
          // sharedPreferences.setString("userEmail", "");
          // sharedPreferences.setString("userPass", "");

          // sharedPreferences.clear();
        }
      } else {
        setSession();
      }
    }
  }

  static void initializeTimer() {
    
    if (DataInfo.sessionActive.value) {
      timer = Timer.periodic(Duration(seconds: DataInfo.sessionTime.value), (_) {
        logOutUser();
      });
    }
  }

  static void logOutUser() async {
    // Log out the user if they're logged in, then cancel the timer.
    // You'll have to make sure to cancel the timer if the user manually logs out

    if (DataInfo.sessionActive.value) {
      //   and to call _initializeTimer once the user logs in
      timer.cancel();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      if (CustomWidgets.checkValidString(
          sharedPreferences.getString("userEmail"))) {
        showAlertWidgetDialog(navigatorKey.currentContext);
      }
    }
  }

  static TextFormField textField(
      String labelText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText: labelText == "Password" ||
              labelText == "New Password" ||
              labelText == "Confirm Password"
          ? true
          : false,
      keyboardType: labelText == "Mobile Number"
          ? TextInputType.number
          : labelText == "Email" || labelText == "Registered Email ID"
              ? TextInputType.emailAddress
              : TextInputType.name,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter " + labelText;
        }
        return null;
      },
      maxLength: labelText == "Mobile Number" ? 10 : 1000,
      decoration: InputDecoration(
        counterText: "",
        isDense: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Constants.greySliderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Constants.greySliderColor),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(
          color: Constants.labelTextColor,
          fontSize: 16,
          fontFamily: "Bliss Pro",
          fontWeight: FontWeight.w500,
        ),
        labelText: labelText,
        helperStyle: TextStyle(fontSize: 12.0),
      ),
    );
  }

  static TextFormField searchTextField() {
    return TextFormField(
      style: TextStyle(
        color: Color(0x4c1c201d),
        fontSize: 16,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(
          color: Constants.labelTextColor,
          fontSize: 16,
          fontFamily: "Bliss Pro",
          fontWeight: FontWeight.w500,
        ),
        hintText: "Search",
        hintStyle: TextStyle(
          color: Color(0x4c1c201d),
          fontSize: 16,
        ),
        helperStyle: TextStyle(fontSize: 12.0),
      ),
    );
  }

  static showAlertDialog(
      BuildContext context,
      String heading,
      String description,
      String image,
      String detail,
      String buttonText,
      String otherText) {
    final width = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width / 1.3,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color(0xFFFFFFFF),
            borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
          ),
          child: Container(
            width: width,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0x19898a8d),
                width: 1,
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Alert",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24),
                  Icon(
                    Icons.error_outline,
                    size: 75,
                    color: Color(0xffD88B10),
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width,
                              child: Text(
                                description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff1d201e),
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 6),
                            SizedBox(
                              width: width,
                              child: Text(
                                detail,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xcc1c201d),
                                  fontSize: 12,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.72,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Constants.greySliderColor,
                        ),
                        SizedBox(height: 20),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 311,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x2600a817),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Constants.greenColor,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 62,
                                vertical: 8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    buttonText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xfffafafa),
                                      fontSize: 16,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              otherText,
                              style: TextStyle(
                                color: Color(0xffef3d3d),
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static TextField textOTPField(String labelText,
      TextEditingController controller, BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.number,
      //autofocus: true,
      cursorColor: Colors.black,

      style: TextStyle(
        color: Color(0xcc1d201e),
        fontSize: 16,
      ),
      maxLength: 1,
      onChanged: (_) =>
          labelText == "1" ? null : FocusScope.of(context).nextFocus(),
      decoration: new InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        counterText: "",
        //   prefixIcon: new Icon(Icons.search,color: Colors.white),
      ),
    );
  }

  static Future<String> pickDate(BuildContext context) async {
    DateTime pickDate = DateTime.now();
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(DateTime.now().year + 50),
      initialDate: pickDate,
    );
    if (date != null) {
      pickDate = date;
      //return "${pickDate.day}-${pickDate.month}-${pickDate.year}";
      return "${pickDate.day}-${pickDate.month}-${pickDate.year}";
      //_updateProfileController.elementAt(i).text="${pickDate.day}-${pickDate.month}-${pickDate.year}";
    } else {
      return null;
    }
  }

  static Future<String> pickDate1(BuildContext context) async {
    DateTime pickDate = DateTime.now();
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(
          DateTime.now().year + 20, DateTime.now().month, DateTime.now().day),
      initialDate: DateTime(
          DateTime.now().year - 19, DateTime.now().month, DateTime.now().day),
    );
    if (date != null) {
      pickDate = date;
      //return "${pickDate.day}-${pickDate.month}-${pickDate.year}";
      return "${pickDate.day.toString().padLeft(2, '0')}-${pickDate.month.toString().padLeft(2, '0')}-${pickDate.year}";
      //_updateProfileController.elementAt(i).text="${pickDate.day}-${pickDate.month}-${pickDate.year}";
    } else {
      return null;
    }
  }

  static Future<String> birth(BuildContext context) async {
    DateTime pickDate = DateTime.now();
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year - 18),
      initialDate: pickDate,
    );
    if (date != null) {
      pickDate = date;
      //return "${pickDate.day}-${pickDate.month}-${pickDate.year}";
      return "${pickDate.day}-${pickDate.month}-${pickDate.year}";
      //_updateProfileController.elementAt(i).text="${pickDate.day}-${pickDate.month}-${pickDate.year}";
    } else {
      return null;
    }
  }

  static Future<String> pickDate2(BuildContext context) async {
    DateTime pickDate = DateTime.now();
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
      initialDate: pickDate,
    );
    if (date != null) {
      pickDate = date;
      return "${pickDate.day}/${pickDate.month}/${pickDate.year} (${pickDate.hour}:${pickDate.minute})";
      //return "$pickDate";
      //_updateProfileController.elementAt(i).text="${pickDate.day}-${pickDate.month}-${pickDate.year}";
    } else {
      return null;
    }
  }

  static Future<String> pickTime(BuildContext context) async {
    TimeOfDay time = TimeOfDay.now();
    TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (timeOfDay != null) {
      time = timeOfDay;

      return "${timeOfDay.hour}:${timeOfDay.minute}";
    } else {
      return null;
    }
  }

  static bool checkValidString(String value) {
    if (value == null ||
        value == "null" ||
        value == "NULL" ||
        value.isEmpty ||
        value == "") {
      return false;
    }
    return true;
  }

  static String numberFormat(final number) {
    try {
      if (CustomWidgets.checkValidString(number.toString())) {
        var formatter = NumberFormat(
            number.toString().contains(".") ? '#,##,###.00' : '#,##,###',
            'en_in');

        String data =
            formatter.format(double.parse(number.toString())).toString();
        return data;
      } else {
        return number.toString();
      }
    } catch (e) {
      print("error:" + e.toString());
      return number.toString();
    }
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  static Future setData(String keyName, String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(keyName, data);
  }

  static getData(String keyName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(keyName);
  }
}
