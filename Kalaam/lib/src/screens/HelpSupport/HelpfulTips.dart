// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks

import 'package:kalaam/src/services/Library.dart';

class HelpfulTips extends StatefulWidget {
  @override
  HelpfulTipsState createState() => HelpfulTipsState();
}
class HelpfulTipsState extends State<HelpfulTips> {

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
      child: WillPopScope(
        onWillPop: () {
          return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    Help(),
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
                            Help(),
                      ));
                },
                child: Icon(Icons.arrow_back_ios, color: Constants.headingBlackColor,)),
            title:
//Align(      alignment: Alignment(-12, 0),

            Text(
              "Helpful Tips",
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
              child: Column (
                children: [
SizedBox(height: 10,),
                  tips("images/t1.png", "How to Replace MPLS with WAN?", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisl porta elementum in sit. Justo, in diam non eu vel a non..."),
                  tips("images/t2.png", "How to Setup a Managed Network?", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisl porta elementum in sit. Justo, in diam non eu vel a non..."),
                  tips("images/t3.png", "How to Replace MPLS with WAN?", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisl porta elementum in sit. Justo, in diam non eu vel a non..."),
                  tips("images/t1.png", "How to Setup a Managed Network?", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisl porta elementum in sit. Justo, in diam non eu vel a non..."),




                ],
              ),


            ),
          ),
        ),
      ),
    );
  }

  Widget tips(String im, String heading, String description)
  {    final mediaQueryWidth = MediaQuery.of(context).size.width;

  return
    Column(children: [
      Padding(
        padding: EdgeInsets.all(mediaQueryWidth*0.04),
        child: Container(
          width: mediaQueryWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Container(
                width: mediaQueryWidth,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0c000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Image.asset(im),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    SizedBox(
                      width: mediaQueryWidth,
                      child: Text(
                        heading,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: Constants.headingBlackColor,
                          fontSize: 20,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        description,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: Constants.greyTextColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      Container(height: 2, color: Constants.greySliderColor,)
    ],)
   ;
  }



}

