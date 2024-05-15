// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks

import 'package:kalaam/src/services/Library.dart';



class ForgotPassword extends StatefulWidget {
  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}
class ForgotPasswordState extends State<ForgotPassword> {
  int _currentIndex = 0;
  bool selectAll = false;
  TextEditingController email = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
bool colorChange = false;
bool load = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  Login(),
            ));
      },
      child: SafeArea(
           top: false,
        bottom: false,

        child:  Scaffold(

            body: Padding(
              padding: const EdgeInsets.only(top:0),
              child: Container(
                height: mediaQueryHeight,
                color: Constants.backgroundWhiteColor,
                child: Stack(
                  children: [
                    Column(
                      children:[
                        LinearProgressIndicator(
                          value: 0.25,
                          minHeight: 10,
                          valueColor: AlwaysStoppedAnimation(Constants.greenColor),
                          backgroundColor: Colors.grey.withOpacity(0.2),
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                          key: _formKey,

                          child: Column(
                            children: [
                              SizedBox(
                                width: 256,
                                child: Text(
                                  "Forgot Password",
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
                                  "Enter your registered email to receive an OTP to reset your password.",
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
                             // CustomWidgets.textField("Registered Email ID", email),
                              TextFormField(
                                controller: email,
                                onChanged: (text){
                                  setState(() {
                                    if(text.length>1){
                                    colorChange =true;}
                                    if(text.length==0){
                                      colorChange =false;}

                                  });

                                },
                                keyboardType: TextInputType.emailAddress,


                                validator: (value) {
                                  if (value == null || value.isEmpty || !EmailValidator.validate(value)) {
                                    return "Enter Registered Email ID ";
                                  }
                                  return null;
                                },





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
                                  labelText:
                                  "Registered Email ID",

                                  helperStyle: TextStyle(fontSize: 12.0),
                                ),
                              ),

                              SizedBox(height: 20,),

                            ],
                          ),
                      ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child:load==true?Container(height: 70,):Container(
                              color: Constants.backgroundWhiteColor,
                              child:  Padding(
                                padding: EdgeInsets.all(mediaQueryWidth*0.04),
                                child:  GestureDetector(
                                  onTap: (){
                                    if (_formKey.currentState.validate()) {
                                      if(email.text.contains("@"))
                                      {
                                        setState(() {
                                          colorChange = true;
                                        });
                                        forgetPass();
                                      }

                                      else{
                                        WebResponseExtractor.showToast("Enter correct Email Address");
                                      }
                                    }
                                  },
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
                              ),
                            ),),
                        ),
                ],
                    ),
                    load==true? LoadingSmall(): SizedBox()

                  ],
                ),
              ),
            )),
      ),
    );
  }

  void forgetPass() async{
    setState(() {
      load = true;
    });


    var enc = await encryptData({

      "email": email.text,



    });
    var dataAPI = await forgotPassword(enc);
   

    if(dataAPI["RETURN_FLAG"]==true){

      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        otpForget = dataAPI["RETURN_DATA"]['otp'].toString();
        userId = dataAPI["RETURN_DATA"]['user_id'].toString();
      });
      setState(() {
        load = false;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                OTP(),
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
