// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks
import 'package:kalaam/src/services/Library.dart';


class FAQ extends StatefulWidget {
  @override
  FAQState createState() => FAQState();
}
class FAQState extends State<FAQ> {
  String name;
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
  List banner = [
    'images/banner.png','images/banner.png','images/banner.png'
  ];
  List news = [
    'images/news.png','images/news.png','images/news.png'
  ];
  List offer = [
    'images/offer.png','images/offer.png','images/offer.png'
  ];
  TextEditingController search = new TextEditingController();
  List showText = [false];
  bool showSuggest = false;
  List faqData = [];
  bool showBlank = false;
  bool load = false;
  @override
  void initState() {
    super.initState();
    faqDataGet();
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
                ));},
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
              "FAQ",
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
            child:Stack(
                children: [
                  Padding(
              padding: EdgeInsets.all(mediaQueryWidth*0.04),

                 child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*SizedBox(height: 20,),
                      Container(
                        width: mediaQueryWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0x19898a8d),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.start,

                            children:[
                              Icon(Icons.search, color:Color(0x4c1c201d)),
                              SizedBox(width: 4),
                              Container(
                                width: mediaQueryWidth*0.75,
                                child: TextFormField(
                                  style:  TextStyle(
                                    color: Color(0x4c1c201d),
                                    fontSize: 16,
                                  ),
                                  controller: search,
                                  onTap:(){
                                    setState(() {
                                      showSuggest = true;

                                    });
                                  },
                                  onChanged: (text){
                                    setState(() {
                                      if(search.text.length >3){
                                        showSuggest = false;
                                        showBlank = true;
                                      }
                                      else{
                                        showSuggest = true;
                                        showBlank = false;

                                      }
                                    });
                                  },
                                  decoration: InputDecoration(
                                    isDense: true,   enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                    ),


                                    contentPadding: EdgeInsets.all(0.0),
                                    labelStyle: TextStyle(
                                      color: Constants.labelTextColor,
                                      fontSize: 16,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),


                                    hintText: "Search",
                                    hintStyle:  TextStyle(
                                      color: Color(0x4c1c201d),
                                      fontSize: 16,
                                    ),
                                    helperStyle: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),*/
                      showSuggest == true?
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if(search.text.length==0){
                              showBlank =false;
                              showSuggest = false;
                            }
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                            SizedBox(
                              width: mediaQueryWidth,
                              child: Text(
                                "Suggested Searches",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: Constants.greyTextColor,
                                  fontSize: 14,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "How to reset my password?",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: Constants.headingBlackColor,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(

                                    child: Image.asset("images/arr.png",width: 15,
                                      height: 15,)),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(height: 1, color: Constants.greySliderColor, width: mediaQueryWidth,),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "How to reset my password?",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: Constants.headingBlackColor,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(

                                    child: Image.asset("images/arr.png",width: 15,
                                      height: 15,)),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(height: 1, color: Constants.greySliderColor, width: mediaQueryWidth,),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "How to reset my password?",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: Constants.headingBlackColor,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(

                                    child: Image.asset("images/arr.png",width: 15,
                                      height: 15,)),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(height: 1, color: Constants.greySliderColor, width: mediaQueryWidth,),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "How to reset my password?",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: Constants.headingBlackColor,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(

                                    child: Image.asset("images/arr.png",width: 15,
                                      height: 15,)),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(height: 1, color: Constants.greySliderColor, width: mediaQueryWidth,),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ):

                      showBlank == true?
                      Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "0 Results Found",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: Color(0xcc898a8d),
                                  fontSize: 12,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],),
                          SizedBox(height: mediaQueryHeight*0.15),

                          Center(
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(Icons.search, color: Constants.greyTextColor, size: 70,),
                                ),
                                SizedBox(height: 24),
                                SizedBox(
                                  width: 178,
                                  child: Text(
                                    "Couldn’t find what you were looking for?",
                                    textScaleFactor: 1.0,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xcc1c201d),
                                      fontSize: 18,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12),
                                SizedBox(
                                  width: 178,
                                  child: Text(
                                    "Chat with us!",
                                    textScaleFactor: 1.0,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff00a817),
                                      fontSize: 16,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ):

                      Container(
//                        height:  faqData.length*150.0,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            // This next line does the trick.

                            itemCount: faqData.length,
                            itemBuilder: (context, index) {
                              return textCard(faqData[index], index, faqData);
                            }),
                      ),





                    ],
                  ),

              ),
                  load==true?LoadingSmall():SizedBox()
                ],
            ),

          ),
        ),
      ),
    );
  }

  Future<void> faqDataGet () async {
    setState(() {
      load =true;
    });


    faqData = await faqListGet();

    setState(() {
      load =false;
    });
  }



  Widget textCard(Map data,int index, List faqList)
  {final mediaQueryHeight = MediaQuery.of(context).size.height;
  final mediaQueryWidth = MediaQuery.of(context).size.width;
  return  Container(
    width: mediaQueryWidth,
    child: Column(
      children:[

        GestureDetector(
          onTap: (){
            setState(() {
              show[index] = !show[index];

            });
          },
          child: Container(
            width: mediaQueryWidth,

color: Colors.transparent,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                data["FaqTitle"],    
                                textScaleFactor: 1.0,  
                                 style: TextStyle(
                                  color: Constants.headingBlackColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            show[index]==false?  SizedBox(
                width: double.infinity,
                // height:  show[index]==true? data["FaqAnswer"].toString().length<30?30:14*(data["FaqAnswer"].toString().length/30 ):30,
                child: Text(
                  data["FaqAnswer"],
                  textScaleFactor: 1.0,
                  maxLines: 2,
                  style: TextStyle(
                    color:Constants.greyTextColor,
                    fontFamily: "Bliss Pro",

                    fontSize: 14,
                  ),
                ),
              ): SizedBox(
                              width: double.infinity,
                             // height:  show[index]==true? data["FaqAnswer"].toString().length<30?30:14*(data["FaqAnswer"].toString().length/30 ):30,
                              child: Text(
                                data["FaqAnswer"],
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color:Constants.greyTextColor,
                                  fontFamily: "Bliss Pro",

                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: show[index]==false?Icon(Icons.add, color: Constants.greyTextColor,):Icon(Icons.remove, color: Constants.greyTextColor,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(height: 1,color: Constants.greySliderColor,width: mediaQueryWidth,),
        SizedBox(height: 20,)

      ],),
  );
  /*:

  Column(
    children:[

      GestureDetector(
        onTap: (){
          setState(() {
            show[index] = !show[index];

          });
        },
        child: Container(
          width: mediaQueryWidth,

          color: Colors.transparent,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "How To Reset My Password?",
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          SizedBox(
                            width: double.infinity,

                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas semper sollicitudin quam vitae, consequat diam ultrices vulputate. Lacinia nibh sed massa vivamus et sed. Quis mauris at in in morbi.",
                              style: TextStyle(
                                color:Constants.greyTextColor,
                                fontFamily: "Bliss Pro",

                                fontSize: 12,
                              ),
                            ),


                          ),
                          SizedBox(height: 4),
                          SizedBox(
                            width: double.infinity,

                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas semper sollicitudin quam vitae, consequat diam ultrices vulputate. Lacinia nibh sed massa vivamus et sed. Quis mauris at in in morbi.",
                              style: TextStyle(
                                color:Constants.greyTextColor,
                                fontFamily: "Bliss Pro",

                                fontSize: 12,
                              ),
                            ),


                          ),
                          SizedBox(height: 4),
                          SizedBox(
                            width: double.infinity,

                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas semper sollicitudin quam vitae, consequat diam ultrices vulputate. Lacinia nibh sed massa vivamus et sed. Quis mauris at in in morbi.",
                              style: TextStyle(
                                color:Constants.greyTextColor,
                                fontFamily: "Bliss Pro",

                                fontSize: 12,
                              ),
                            ),


                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.remove, color: Constants.greyTextColor,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Container(height: 1,color: Constants.greySliderColor,width: mediaQueryWidth,),
      SizedBox(height: 20,)

    ],)
  ;*/
  }






}

