// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks
import 'package:kalaam/src/services/Library.dart';




class CaseStudy extends StatefulWidget {
  @override
  CaseStudyState createState() => CaseStudyState();
}
class CaseStudyState extends State<CaseStudy> {
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
  bool load =false;
  List showText = [false];
  @override
  void initState() {
    super.initState();
    newsData();
    
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
                    Home(),
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
                            Home(),
                      ));
                },
                child: Icon(Icons.arrow_back_ios, color: Constants.headingBlackColor,)),
            title:
//Align(      alignment: Alignment(-12, 0),

            Text(
              "Case Studies",
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
                child:Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //height: caseStudyList.length*150.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              // This next line does the trick.

                              itemCount: caseStudyList.length,
                              itemBuilder: (context, index) {
                                return caseStudy(caseStudyList[index], index, caseStudyList);
                              }),
                        ),







                      ],
                    ),
                    load == true? LoadingHome():SizedBox(),
                  ],
                )


              ),

            ),
          ),
        ),
      ),
    );
  }
  Future<void> newsData () async {
    setState(() {
      load =true;
    });


    caseStudyList = await caseStudyListGet();


    setState(() {
      load =false;
    });
  }
  Widget caseStudy(Map data, int i, List caseList)
  {final mediaQueryHeight = MediaQuery.of(context).size.height;
  final mediaQueryWidth = MediaQuery.of(context).size.width;
  return  Column(
    children:[

      GestureDetector(
        onDoubleTap: (){},
        onTap: (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  WebBrowser(WebApis.SERVER_URL+data["url"].toString()),
            ));
/*
          FlutterWebBrowser.openWebPage(
            url: WebApis.SERVER_URL+data["url"].toString(),
            customTabsOptions: CustomTabsOptions(
              colorScheme: CustomTabsColorScheme.dark,
              toolbarColor: Constants.greenColor,
              secondaryToolbarColor: Colors.green,
              navigationBarColor: Constants.greenColor,
              addDefaultShareMenuItem: true,
              instantAppsEnabled: false,
              showTitle: true,
              urlBarHidingEnabled: true,
            ),
            safariVCOptions: SafariViewControllerOptions(
              barCollapsingEnabled: true,
              preferredBarTintColor: Constants.greenColor,
              preferredControlTintColor: Constants.greenColor,
              dismissButtonStyle:
              SafariViewControllerDismissButtonStyle.close,
              modalPresentationCapturesStatusBarAppearance: true,
            ),
          );
*/

        },
        child: Container(
          color: Colors.transparent,
          width: mediaQueryWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children:[
              Container(
                width: 115,
                height: 110,
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
                child: ClipRRect(
  borderRadius: BorderRadius.circular(8),
    child: Image.network(WebApis.SERVER_URL+ data["image_path"], fit: BoxFit.cover,)),
              ),

              Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  SizedBox(
                    width: mediaQueryWidth*0.58,
                    child: Text(
                      data["title"],
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Color(0xe51c201d),
                        fontSize: 16,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: mediaQueryWidth*0.58,
                    child: Text(
                      data["short_desc"],
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Color(0x991c201d),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(



                    children:[
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset("images/cloud2.png"),
                      ),
                      SizedBox(width: 4),
                      Text(
                        data["category_name"],
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: Color(0x7f1c201d),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
      SizedBox(height: 20,),

      Container(height: 1,color: Constants.greySliderColor,width: mediaQueryWidth,),
      SizedBox(height: 20,)

    ],)
  ;
  }









}

