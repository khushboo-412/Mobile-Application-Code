// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks
import 'package:kalaam/src/services/Library.dart';



class ChangePassword extends StatefulWidget {
  @override
  ChangePasswordState createState() => ChangePasswordState();
}
class ChangePasswordState extends State<ChangePassword> {
  bool selectAll = false;   TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  TextEditingController confirmPassword1 = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool colorChange = false;
  bool load = false;
  bool showOldPass = true;
  bool showNewPass = true;
  bool showConPass = true;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
       top: false,
        bottom: false,
      child:  WillPopScope(
        onWillPop: () {
          return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    AccountDetails(),
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
                                AccountDetails(),
                          ));

                  },
                  child: Icon(Icons.arrow_back_ios, color: Constants.headingBlackColor,)),
              title:
//Align(      alignment: Alignment(-12, 0),

              Text(
                "Change Password",
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
              child: Stack(
                children:[


                  Padding(
                    padding: const EdgeInsets.all(20),
                    child:Column(
                      children: [


                        Form(
                        key: _formKey,
                        child: Column(
                          children: [


                            SizedBox(height: 30,),
                            TextFormField(
                              controller: password,
                              obscureText: showOldPass,
                              onChanged: (text){
                                checkColor();
                              },

                              validator: (value) {
                                if (value == null || value.isEmpty ) {
                                  return "Enter "+ "Old Password";
                                }
                                if(value.length<6){
                                  return "Old Password should be of atleast 6 characters";

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
                                "Old Password",

                                suffix: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      showOldPass = !showOldPass;
                                    });
                                  },
                                  child: Icon(Icons.remove_red_eye_outlined,                                 color: Constants.labelTextColor,
                                  ),
                                ),

                                helperStyle: TextStyle(fontSize: 12.0),
                              ),
                            ),
                            //CustomWidgets.textField("Old Password", password),
                            SizedBox(height: 20,),
                            TextFormField(
                              controller: confirmPassword,
                              obscureText: showNewPass,
                              onChanged: (text){
                                checkColor();
                              },

                              validator: (value) {
                                if (value == null || value.isEmpty ) {
                                  return "Enter "+ "New Password";
                                }
                                if(value.length<6){
                                  return "New Password should be of atleast 6 characters";

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
                                "New Password",

                                suffix: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      showNewPass = !showNewPass;
                                    });
                                  },
                                  child: Icon(Icons.remove_red_eye_outlined,                                 color: Constants.labelTextColor,
                                  ),
                                ),

                                helperStyle: TextStyle(fontSize: 12.0),
                              ),
                            ),

                           // CustomWidgets.textField("New Password",confirmPassword),
                            SizedBox(height: 20,),
                            TextFormField(
                              controller: confirmPassword1,
                              obscureText: showConPass,
                              onChanged: (text){
                                checkColor();

                              },

                              validator: (value) {
                                if (value == null || value.isEmpty ) {
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

//                            CustomWidgets.textField("Confirm Password",confirmPassword1),


                          ],
                        ),
                      ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child:  Container(
                          color: Constants.backgroundWhiteColor,
                          child:  GestureDetector
                            (
                            onTap: (){
                              if (_formKey.currentState.validate()) {
                                if(confirmPassword.text == confirmPassword1.text)
                                {
                                  setState(() {
                                    colorChange = true;
                                  });
                                  updatePass();
                                }
                                else{
                                  WebResponseExtractor.showToast("New Password does not match with Confirm Password");
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
                        ),),),
                      ],
                    ),
                  ),
                  load==true? LoadingSmall():SizedBox(),

                ],
              ),
            )),
      ),
    );
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
        if (confirmPassword1.text == "") {
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

  void updatePass() async{

    setState(() {
      load = true;
    });

    var enc = await encryptData({

      "user_id": userId,
      "oldpassword": password.text,
      "password": confirmPassword.text



    });
    var dataAPI = await changePassword(enc);
   

    if(dataAPI["RETURN_FLAG"]==true){

      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        load = false;
      });
      setStringPreference(
          "userPass", confirmPassword.text);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                AccountDetails(),
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
