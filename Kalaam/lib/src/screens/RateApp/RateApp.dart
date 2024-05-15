// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps
import 'package:kalaam/src/services/Library.dart';

class RateApp extends StatefulWidget {
  @override
  RateAppState createState() => RateAppState();
}
class RateAppState extends State<RateApp> {
  String name;
  PageController pageBannerController = PageController();
  int sliderBannerIndex = 0;
  List show = [false,false,false];
  PageController pageNewsController = PageController();
  int sliderNewsIndex = 0;

  PageController pageOfferController = PageController();
  int sliderOfferIndex = 0;

  PageController pageSurveyController = PageController();
  int sliderSurveyIndex = 0;
  bool status = false;
  int sliderIndex = 0;
  List banner = [
    'images/banner.png','images/banner.png','images/banner.png'
  ];
  List news = [
    'images/news.png','images/news.png','images/news.png'
  ];
  List offer = [
    'images/offer.png','images/offer.png','images/offer.png'
  ];
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

      child: new Scaffold(
        appBar: AppBar(

          backgroundColor: Constants.backgroundWhiteColor,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            GestureDetector(
              onTap: (){

              },

              child: Container(
                color:Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,20,10,10),
                  child: Text(
                    "Skip",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Constants.greenColor,
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
          leading: GestureDetector(
              onTap: (){

              },
              child: Icon(Icons.arrow_back_ios, color: Constants.headingBlackColor,)),
          title:
//Align(      alignment: Alignment(-12, 0),

          Text(
            "Rate Our App",
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
        bottomNavigationBar: Container(
          color: Constants.backgroundWhiteColor,
          child:  Padding(
            padding: EdgeInsets.all(mediaQueryWidth*0.04),
            child: GestureDetector(
              onTap: (){

              },
              child: Container(
                width: mediaQueryWidth,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Constants.greenColor,
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
                        "Sure",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
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

        body: SingleChildScrollView(
          child: Container(
            color: Constants.backgroundWhiteColor,
            child: Padding(
              padding: EdgeInsets.all(mediaQueryWidth*0.04),
              child: Column(
                children: [
                  SizedBox(height: mediaQueryHeight*0.12,),

                  Container(
                    width: mediaQueryWidth*0.8,
                    height: 188,
                    child: Image.asset("images/splash.png"),
                  ),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: mediaQueryWidth*0.8,
                    child: Text(
                      "Thanks! Mind giving us a\n5 star rating on Appstore too?",
                     textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.headingBlackColor,
                        fontSize: 20,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),

                  Container(
                    width: mediaQueryWidth,
                    height: 40,
                    child: Image.asset("images/stars.png"),
                  ),


                ],
              ),
            ),

          ),
        ),
      ),
    );
  }

  Widget dateCard()
  {
    return GestureDetector(
      onTap: (){

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  OrderStatus(),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0x0c898a8d), width: 1, ),
          color: Color(0x0c00a817),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2, ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(
              "22 Mar 2022",
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Color(0xcc1c201d),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget cartCard(String im, String name)
  {final mediaQueryHeight = MediaQuery.of(context).size.height;
  final mediaQueryWidth = MediaQuery.of(context).size.width;
  return Container(
    width: mediaQueryWidth,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Container(
          width: mediaQueryWidth*0.8,
          child: Row(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0x19898a8d), width: 1, ),
                  color: Colors.white,
                ),

                child: Center(
                  child: Image.asset(im, width: 70.96,
                    height: 72,),
                ),
              ),
              SizedBox(width: 20,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Order ID: ORD1234",
                    style: TextStyle(
                      color: Constants.greyButtonTextColor,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Microsoft 365",
                    style: TextStyle(
                      color: Constants.headingBlackColor,
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                        "Expired on 22/05/22,",
                        style: TextStyle(
                          color: Color(0x991c201d),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        "Renew!",
                        style: TextStyle(
                          color: Constants.greenColor,
                          fontSize: 12,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  Text(
                    "\$500.00",
                    style: TextStyle(
                      color: Constants.headingBlackColor,
                      fontSize: 20,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                ],
              ),


            ],
          ),
        ),


      ],
    ),
  );
  }






}

