// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks
import 'package:kalaam/src/services/Library.dart';


class NewPassword extends StatefulWidget {
  @override
  NewPasswordState createState() => NewPasswordState();
}
class NewPasswordState extends State<NewPassword> {
  bool selectAll = false;   TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool colorChange = false;
  bool load = false;
  bool showPass = true;
  bool showConPass = true;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  @override
  void initState() {
    super.initState();
  }
  void checkColor (){

    if (password.text == "") {
      setState(() {
        colorChange = false;
      });
    }
    else {
      if (confirmPassword.text == "") {
        setState(() {
          colorChange = false;
        });
      }
      else {
        if (selectAll==false) {
          setState(() {
            colorChange = false;
          });
        }
        else {
          setState(() {
            colorChange = true;
          });
        }
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
        return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  OTP(),
            ));
      },
      child: SafeArea(
           top: false,
        bottom: false,
        child: new Scaffold(



            body: Container(
              height: mediaQueryHeight,
              width: mediaQueryWidth,
              color: Constants.backgroundWhiteColor,
              child:Stack(
                children: [

                  Column(
crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      LinearProgressIndicator(
                        value: 0.8,
                        minHeight: 10,
                        valueColor: AlwaysStoppedAnimation(Constants.greenColor),
                        backgroundColor: Colors.grey.withOpacity(0.2),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 30,),
                            SizedBox(
                              child: Text(
                                "Set a New Password",
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
                            SizedBox(height: 30,),
                            TextFormField(
                              controller: password,
                              obscureText: showPass,
                              onChanged: (text){
                                checkColor();
                              },

                              // validator: (value) {
                              //   if (value == null || value.isEmpty ) {
                              //     return "Enter "+ "Password";
                              //   }
                              //   if(value.length<6){
                              //     return "Password should be of atleast 6 characters";

                              //   }
                              //   return null;
                              // },
                              validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter " + "Password";
                                      }
                                      if (value.length < 8) {
                                        return "Password should be of atleast 8 characters";
                                      }
                                      if(!pass_valid.hasMatch(password.text)){
                                        return "Password should contain uppercase letter, lowercase letter, digit and special character";

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
                                "Password",

                                suffix: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      showPass = !showPass;
                                    });
                                  },
                                  child: Icon(Icons.remove_red_eye_outlined,                                 color: Constants.labelTextColor,
                                  ),
                                ),

                                helperStyle: TextStyle(fontSize: 12.0),
                              ),
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              controller: confirmPassword,
                              obscureText: showConPass,
                              onChanged: (text){
                                checkColor();
                                if(password.text == confirmPassword.text){
                                  colorChange=true;
                                }
                              },

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter "+ "Confirm Password";
                                }
                                if(value.length<6){
                                  return "Confirm Password should be of atleast 6 characters";

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
                                "Confirm Password",
                                suffix: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      showConPass = !showConPass;
                                    });
                                  },
                                  child: Icon(Icons.remove_red_eye_outlined,                                 color: Constants.labelTextColor,
                                  ),
                                ),
                                helperStyle: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          ],
                        ),
                    ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child:load==true?Container(height: 70,): Container(
                            color: Constants.backgroundWhiteColor,
                            child:  Padding(
                              padding: EdgeInsets.all(mediaQueryWidth*0.04),
                              child: GestureDetector
                                (
                                onTap: (){
                                  if (_formKey.currentState.validate()) {
                                    if(password.text == confirmPassword.text)
                                    {
                                      setState(() {
                                        colorChange = true;
                                      });
                                      updatePass();
                                    }
                                    else{
                                      WebResponseExtractor.showToast("Password does not match with Confirm Password");
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
                                  child: Center(
                                    child: Opacity(
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
                                  ),
                                ),
                              ),
                            ),
                          ),),),

                    ],
                  ),
                  load==true? LoadingSmall():SizedBox(),

                ],
              ),
            )),
      ),
    );
  }

  void updatePass() async{

    setState(() {
      load = true;
    });

    var enc = await encryptData({

      "user_id": userId,
      "password": password.text,
      "confirm_password": confirmPassword.text



    });
    var dataAPI = await updatePassword(enc);
    

    if(dataAPI["RETURN_FLAG"]==true){

      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        load = false;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                Login(),
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
