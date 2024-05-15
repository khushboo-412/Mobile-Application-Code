// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks
import 'package:kalaam/src/services/Library.dart';

class RestoreOTP extends StatefulWidget {
  @override
  RestoreOTPState createState() => RestoreOTPState();
}

class RestoreOTPState extends State<RestoreOTP> {
  bool selectAll = false;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController one = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController two = TextEditingController();
  final TextEditingController three = TextEditingController();
  final TextEditingController four = TextEditingController();
  bool load = false;
  bool success = false;
  bool colorChange = false;
  bool resend = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      if (otpCreate == "") {
      } else {

        colorChange = true;
      }
    });
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
                builder: (BuildContext context) => Login(),
              ));
        },
        child: new Scaffold(
          body: SingleChildScrollView(
            child: Container(
                color: Constants.backgroundWhiteColor,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 256,
                                child: Text(
                                  "Enter OTP",
                                  textScaleFactor: 1.0,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Constants.headingBlackColor,
                                    fontSize: 28,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 287,
                                child: Text(
                                  "An OTP has been sent to your registered Email.",
                                  textScaleFactor: 1.0,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Constants.greyTextColor,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Pinput(
                                defaultPinTheme: PinTheme(
                                  width: 77,
                                  height: 50,
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                  /* textStyle: TextStyle(
                              //fontSize: 20,
                              //color: Color.fromRGBO(30, 60, 87, 1),
                              fontWeight: FontWeight.w600),*/
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Color(0x66898a8d),
                                      width: 1,
                                    ),
                                    color: Color(0xfffafafa),
                                  ),
                                ),
                                focusedPinTheme: PinTheme(
                                  width: 77,
                                  height: 50,
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                  ),
/*
                          textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
*/
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Color(0x66898a8d),
                                      width: 1,
                                    ),
                                    color: Color(0xfffafafa),
                                  ),
                                ),
                                submittedPinTheme: PinTheme(
                                  width: 77,
                                  height: 50,
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                  ),
/*
                          textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
*/
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Constants.greenColor,
                                      width: 1,
                                    ),
                                    color: Color(0xfffafafa),
                                  ),
                                ),
                                controller: pinController,
                                showCursor: true,
                                onCompleted: (pin) {
                                  setState(() {
                                    colorChange = true;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              resend == false?  GestureDetector(
                                  onTap: (){
                                    resendOTPdata();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children:[ Text(
                                      "Resend",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Color(0xff00a817),
                                        fontSize: 14,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    ],)
                              ):
                              Container(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children:[
                                    Text(
                                      "Resend",
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        color: Color(0x99898a8d),
                                        fontSize: 14,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Image.asset("images/resend.png", width:18, height: 18),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    load == true ? LoadingSmall() : SizedBox(),
                    //  success == true?AlertBox("", "You've successfully registered", "", "Click on Login to Continue", "Login", ""): SizedBox()
                  ],
                )),
          ),
          bottomNavigationBar: load == true
              ? Container(
            height: 70,
          )
              : Container(
            color: Constants.backgroundWhiteColor,
            child: Padding(
              padding: EdgeInsets.all(mediaQueryWidth * 0.04),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    colorChange = true;
                    otpCreate = pinController.text;

                    verifyOtp();
                  });
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
                    horizontal: 62,
                    vertical: 14,
                  ),
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
            ),
          ),
        ),
      ),
    );
  }

  void verifyOtp() async {
    setState(() {
      load = true;
    });

    var otpEnc = await encryptData({
      "user_id": userId,
      "otp": pinController.text,
    });
    var otpData = await accRestore(otpEnc);
    if (otpData["RETURN_FLAG"] == true) {
      setState(() {
        load = false;
      });
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "You've successfully restored your account",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff1d201e),
                fontSize: 18,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.all(8),
            child:
            Text(
              "Check your mail for login credentials\n\nClick on Login to Continue",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xcc1c201d),
                fontSize: 14,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
                letterSpacing: 0.72,
              ),
            ),

          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Login(),
                      ));
                },
                child: Container(
                  width: 250,
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
                        "Login",
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
              ),
            ),
          ],
        ),
      );
    } else {
      WebResponseExtractor.showToast(otpData["RETURN_MSG"]);

      setState(() {
        one.clear();
        two.clear();
        three.clear();
        four.clear();
        pinController.clear();
        colorChange = false;
        load = false;
      });
    }
  }
  void resendOTPdata() async{
    setState(() {
      resend = true;
    });


    var enc = await encryptData({

      "user_id": userId,



    });
    var dataAPI = await resendOTP(enc);


    if(dataAPI["RETURN_FLAG"]==true){

      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        otpForget  = dataAPI["RETURN_DATA"]['otp'].toString();

      });


    }
    else{
      setState(() {

      });
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);

    }

    setState(() {
      resend = false;
    });
  }
}
