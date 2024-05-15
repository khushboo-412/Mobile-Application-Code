
// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks

import 'package:kalaam/src/services/Library.dart';




class OTP extends StatefulWidget {
  @override
  OTPState createState() => OTPState();
}
class OTPState extends State<OTP> {
  bool selectAll = false;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController one = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController two = TextEditingController();
  final TextEditingController three = TextEditingController();
  final TextEditingController four = TextEditingController();
  bool resend = false;
  bool colorChange = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      if(otpForget==""){


      }
      else{
        /*  one.text = otpForget.substring(0,1);
        two.text = otpForget.substring(1,2);
        three.text = otpForget.substring(2,3);
        four.text = otpForget.substring(3);
        colorChange=true;*/
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
      child:WillPopScope(
        onWillPop: () {
          return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    ForgotPassword(),
              ));
        },
        child: new Scaffold(
          body: Container(
            height: mediaQueryHeight,
            color: Constants.backgroundWhiteColor,
            child: Column(
              children: [  LinearProgressIndicator(
                value: four.text==""? 0.4: 0.6,
                minHeight: 10,
                valueColor: AlwaysStoppedAnimation(Constants.greenColor),
                backgroundColor: Colors.grey.withOpacity(0.2),
              ),
                SizedBox(height: 30,),
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
                      SizedBox(height: 20,),
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
                      SizedBox(height: 30,),
                      Pinput(
                        defaultPinTheme: PinTheme(
                          width: 77,
                          height: 50,textStyle: TextStyle(fontSize: 20,),
                         /* textStyle: TextStyle(
                              //fontSize: 20,
                              //color: Color.fromRGBO(30, 60, 87, 1),
                              fontWeight: FontWeight.w600),*/
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Color(0x66898a8d), width: 1, ),
                            color: Color(0xfffafafa),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 77,
                          height: 50, textStyle: TextStyle(fontSize: 20,),
/*
                          textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
*/
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Color(0x66898a8d), width: 1, ),
                            color: Color(0xfffafafa),
                          ),
                        ),
                        submittedPinTheme: PinTheme(
                          width: 77,
                          height: 50,textStyle: TextStyle(fontSize: 20,),
/*
                          textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
*/
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Constants.greenColor, width: 1, ),
                            color: Color(0xfffafafa),
                          ),
                        ),
                        validator: (s) {
                          return s == otpForget ? null : 'Pin is Incorrect';
                        },
                        controller: pinController,

                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin){
                          setState(() {
                            colorChange = true;
                          });
                        },


                      ),
                   /*   Row
                        (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 77,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Color(0x66898a8d), width: 1, ),
                              color: Color(0xfffafafa),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12, ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                SizedBox(
                                  width: 40,
                                  child: CustomWidgets.textOTPField("", one, context),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 77,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Color(0x66898a8d), width: 1, ),
                              color: Color(0xfffafafa),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12, ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                SizedBox(
                                  width: 40,
                                  child: CustomWidgets.textOTPField("", two, context),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 77,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Color(0x66898a8d), width: 1, ),
                              color: Color(0xfffafafa),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12, ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                SizedBox(
                                  width: 40,
                                  child: CustomWidgets.textOTPField("", three, context),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 77,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Color(0x66898a8d), width: 1, ),
                              color: Color(0xfffafafa),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12, ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                SizedBox(
                                  width: 40,
                                  child:  TextField(
                                    controller: four,
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
                                    onChanged: (text){
                                      setState(() {
                                        colorChange=true;
                                        if (one.text !="" && two.text !="" && three.text != ""){
                                          setState(() {
                                            colorChange = true;
                                            String enter = one.text+two.text+three.text+four.text;
                                            if(otpForget == enter) {

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext context) =>
                                                        NewPassword(),
                                                  ));
                                            }
                                            else{
                                              one.clear();
                                              two.clear();
                                              three.clear();
                                              four.clear();
                                              colorChange = false;

                                              WebResponseExtractor.showToast("Enter Valid OTP");
                                            }
                                          });
                                        }
                                      });
                                    },
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      counterText: "",
                                      //   prefixIcon: new Icon(Icons.search,color: Colors.white),


                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),*/
                      SizedBox(height: 20,),
                      resend == false?  GestureDetector(
                          onTap: (){
                            resendOTPdata();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:[ Text(
                              "Resend",
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
                      ),                  ],
                  ),
                ),
    Expanded(
    child: Align(
    alignment: Alignment.bottomCenter,
    child: Container(
                  color: Constants.backgroundWhiteColor,
                  child:  Padding(
                    padding: EdgeInsets.all(mediaQueryWidth*0.04),
                    child: GestureDetector(
                      onTap: (){

                        if(otpForget==""){}
                        else{
                          setState(() {
                            colorChange = true;
                            String enter = one.text+two.text+three.text+four.text;
                            if(otpForget == pinController.text) {

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        NewPassword(),
                                  ));
                            }
                            else{
                              one.clear();
                              two.clear();
                              three.clear();
                              four.clear();
                              pinController.clear();
                              colorChange = false;

                              WebResponseExtractor.showToast("Enter Valid OTP");
                            }
                          });

                          
                        }},
                      child: Container(
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
                                "Continue",
                                textScaleFactor: 1.0,
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
                    ),
                  ),),),
                ),
              ],
            ),
          ),
          ),
      ),
    );
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
        // one.text = dataAPI["RETURN_DATA"]['otp'].substring(0,1);
        // two.text =  dataAPI["RETURN_DATA"]['otp'].substring(1,2);
        // three.text =  dataAPI["RETURN_DATA"]['otp'].substring(2,3);
        // four.text =  dataAPI["RETURN_DATA"]['otp'].substring(3);
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
