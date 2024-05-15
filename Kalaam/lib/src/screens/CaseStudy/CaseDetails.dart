// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks

import 'package:kalaam/src/services/Library.dart';



class CaseDetail extends StatefulWidget {
  var id;
CaseDetail(this.id);
  @override
  CaseDetailState createState() => CaseDetailState(this.id);
}
class CaseDetailState extends State<CaseDetail> {
  var id;
  CaseDetailState(this.id);
  String title="";
  String desc="";
  String image="";
  PageController pageBannerController = PageController();
  int sliderBannerIndex = 0;
  List show = [false,false,false,false,false,false,false,false,false,false,false];
  PageController pageNewsController = PageController();
  int sliderNewsIndex = 0;

  PageController pageOfferController = PageController();
  int sliderOfferIndex = 0;

  PageController pageSurveyController = PageController();
  int sliderSurveyIndex = 0;
  bool status = false;
  int sliderIndex = 0;

  bool load = false;
  List showText = [false];
  @override
  void initState() {
    super.initState();
    caseDetails();
  }
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
        bottom: false,

      child:  Scaffold(
        appBar: AppBar(

          backgroundColor: Constants.backgroundWhiteColor,
          iconTheme: IconThemeData(color: Colors.black),
          leading: GestureDetector(
              onTap: (){

              },
              child: Icon(Icons.arrow_back_ios, color: Constants.headingBlackColor,)),
          title:


          Text(
            title,
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
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: mediaQueryWidth,
                        child: Text(
                          title,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Color(0xff1c201d),
                            fontSize: 20,
                            fontFamily:  "Bliss Pro",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: mediaQueryWidth,
                        //height: 200,
                        decoration: BoxDecoration(


                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(WebApis.SERVER_URL+image, fit: BoxFit.fill,)),
                      ),
                      SizedBox(height: 20,),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          SizedBox(
                            width: mediaQueryWidth,
                            child: Text(
                              desc,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontFamily: "Bliss Pro",
                                fontSize: 13,
                              ),
                            ),
                          ),
                          /*  SizedBox(height: 8),
                      SizedBox(
                        width: mediaQueryWidth,
                        child: Text(
                          "Kalaam Telecom completed this migration and provided the users with enterprise grade Email & Collaboration suite. ",
                          style: TextStyle(
                            color: Constants.greyTextColor,
                            fontFamily: "Bliss Pro",
                            fontSize: 13,
                          ),
                        ),
                      ),*/
                        ],
                      ),
                      /*  SizedBox(height: 20,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      SizedBox(
                        width: mediaQueryWidth,
                        child: Text(
                          "Overview",
                          style: TextStyle(
                            color: Constants.headingBlackColor,
                            fontSize: 16,

                            fontFamily: "Bliss Pro",                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: mediaQueryWidth,
                        child: Text(
                          "A leading private hospital in Bahrain which provides health care services to 500 patients on a daily basis. The hospital has over 20+ departments with 70+ doctors along with 24/7 clinic.",
                          style: TextStyle(
                            color: Constants.greyTextColor,
                            fontFamily: "Bliss Pro",                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      SizedBox(
                        width: mediaQueryWidth,
                        child: Text(
                          "Business Objective",
                          style: TextStyle(

                            fontSize: 16,
                            color: Constants.headingBlackColor,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          SizedBox(
                            width: mediaQueryWidth,
                            child: Text(
                              "The hospital was having challenge with their current hosted email solution which included many spam and virus, email outages, & loss of emails.",
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontFamily: "Bliss Pro",                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: mediaQueryWidth,
                            child: Text(
                              "Besides this the customer was also not happy with the level of support he was getting from his current service provider wherein there would be delays in responding to their queries, issues etc and there as no clarity on resolution time frame for them.",
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontFamily: "Bliss Pro",                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: mediaQueryWidth,
                            child: Text(
                              "Any Health care industry today needs to have a very secure & a reliable Email and communications system with excellent support as the information being exchanged is very sensitive and critical. ",
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontFamily: "Bliss Pro",                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),*/


                    ],
                  ),
                  load==true?LoadingProgress("Wait.."):SizedBox()
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }



  void caseDetails() async{


setState(() {
  load = true;
});
    var enc = await encryptData({
      "casestudy_id": id,
    });
    var dataSignUp = await caseStudyDetails(enc);
    
    if(dataSignUp["RETURN_FLAG"]==true){

      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
     setState(() {
       title = dataSignUp["RETURN_DATA"]["title"];
       image = dataSignUp["RETURN_DATA"]["image_path"];
       desc = dataSignUp["RETURN_DATA"]["desc"];
     });
    }
    else{
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }

setState(() {
  load = false;
});
  }






}

