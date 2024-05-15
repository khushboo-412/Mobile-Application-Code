// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use
import 'package:kalaam/src/services/Library.dart';

class News extends StatefulWidget {
  @override
  NewsState createState() => NewsState();
}
class NewsState extends State<News> {
  String name;
  PageController pageBannerController = PageController();
  int sliderBannerIndex = 0;
  List show = [false,false,false,false,false,false,false,false,false,false,false];
  PageController pageNewsController = PageController();
  int sliderNewsIndex = 0;
  bool load = false;
  List newsList = [];
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
      child: WillPopScope(
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
              "Our News",
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
                      Container(
                        //height: newsList.length*mediaQueryHeight*0.4,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            // This next line does the trick.

                            itemCount: newsList.length,
                            itemBuilder: (context, index) {
                              return caseCard(newsList[index], index, newsList);
                            }),
                      ),
                      load == true? LoadingProgress(""):SizedBox(),
                    ],
                  )
              ),

            ),
          ),
        ),
      ),
    );
  }

  Widget caseCard(Map data, int index, List newsList)
  {final mediaQueryHeight = MediaQuery.of(context).size.height;
  final mediaQueryWidth = MediaQuery.of(context).size.width;
  return  Column(
    children:[

      GestureDetector(
        onDoubleTap: (){},
        onTap: () async {
          Navigator.push(
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
          child:      Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Container(
                width: mediaQueryWidth,
                height: mediaQueryWidth*0.5,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(WebApis.SERVER_URL+ data["NewsImage"], fit: BoxFit.cover,)),
              ),

              SizedBox(height: 20,),

              SizedBox(
                width: mediaQueryWidth,
                child: Text(
                  data["NewsTitle"],
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Color(0xe51c201d),
                    fontSize: 16,
                    fontFamily:  "Bliss Pro",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              /* SizedBox(height: 4),
              SizedBox(
                width: mediaQueryWidth,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisl porta elementum in sit...",
                  style: TextStyle(
                    color: Color(0x991c201d),
                    fontSize: 13,
                  ),
                ),
              ),*/
              SizedBox(height: 20,),
              SizedBox(
                width: mediaQueryWidth,
                child: Text(
                  "Read more...",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Constants.greenColor,
                    fontSize: 12,
                    fontFamily:  "Bliss Pro",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 10,),

      Container(height: 1,color: Constants.greySliderColor,width: mediaQueryWidth,),
      SizedBox(height: 10,)

    ],)
  ;
  }


  Future<void> newsData () async {
    setState(() {
      load =true;
    });


    newsList = await newsListGet();


    setState(() {
      load =false;
    });
  }







}

