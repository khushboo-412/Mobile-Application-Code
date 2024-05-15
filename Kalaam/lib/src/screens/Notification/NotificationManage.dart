// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use
import 'package:kalaam/src/services/Library.dart';

class Manage extends StatefulWidget {
  @override
  ManageState createState() =>ManageState();
}
class ManageState extends State<Manage> {
  String name;

  bool isSwitched1 ;
  String switchValue ;
  @override
  void initState() {
    super.initState();
  }
  void toggleSwitch(bool value) {
    if (isSwitched1 == false) {
      setState(() {
        isSwitched1 = true;
        switchValue = 'ON';
      });
      WebResponseExtractor.showToast('Switch Button is ON');
    } else {
      setState(() {
        isSwitched1 = false;
        switchValue = 'OFF';
      });
      WebResponseExtractor.showToast('Switch Button is OFF');
    }
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
                    Notifications(),
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
                              Notifications(),
                        ));

                },
                child: Container(child: Icon(Icons.arrow_back_ios, color: Constants.headingBlackColor,))),
            title:
//Align(      alignment: Alignment(-12, 0),

            Text(
              "Notifications Manager",
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


          body: SingleChildScrollView(
            child: Container(
              color: Constants.backgroundWhiteColor,
              child: Padding(
                padding: EdgeInsets.all(mediaQueryWidth*0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                  SizedBox(height: 10,),

                    Container(

                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children:[


                          Text(
                            "Bills & Payments",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: Constants.headingBlackColor,
                              fontSize: 18,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),

                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: Transform.scale(
                                scale: 1.5,
                                child: Switch(
                                  onChanged: toggleSwitch,
                                  value: isSwitched1,
                                  activeColor: Colors.white,
                                  activeTrackColor: Constants.greenColor,
                                  inactiveThumbColor: Colors.grey,
                                  inactiveTrackColor: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(height: 1,color: Constants.greySliderColor,),

                    SizedBox(height: 10,),

                    GestureDetector(
                      onTap: (){


                      },
                      child: Container(
                        color: Colors.transparent,

                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children:[


                            Text(
                              "Events & Offers",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 18,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),

                            ),Container(
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: Transform.scale(
                                  scale: 1.5,
                                  child: Switch(
                                    onChanged: toggleSwitch,
                                    value: isSwitched1,
                                    activeColor: Colors.white,
                                    activeTrackColor: Constants.greenColor,
                                    inactiveThumbColor: Colors.grey,
                                    inactiveTrackColor: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    Container(height: 1,color: Constants.greySliderColor,),
                    SizedBox(height: 10,),

                    GestureDetector(
                      onTap: (){



                      },                    child: Container(
                      width: mediaQueryWidth,
                      color: Colors.transparent,
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children:[


                          Text(
                            "News",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: Constants.headingBlackColor,
                              fontSize: 18,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),),
                      Container(
                                     margin: EdgeInsets.only(left: 5, right: 5),
                                   child: Transform.scale(
                                        scale: 1.5,
                                         child: Switch(
                                           onChanged: toggleSwitch,
                                           value: isSwitched1,
                                           activeColor: Colors.white,
                                           activeTrackColor: Constants.greenColor,
                                          inactiveThumbColor: Colors.grey,
                                           inactiveTrackColor: Colors.white,
                                         )),
                                   ),
                        ],
                      ),
                    ),
                    ),


                  ],),
              ),

            ),
          ),
        ),
      ),
    );
  }










}

