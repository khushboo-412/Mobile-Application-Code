// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps
import 'package:kalaam/src/services/Library.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() =>SettingsState();
}
class SettingsState extends State<Settings> {
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
  int c = 0;
  bool isClick = false;
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
          return Navigator.pushReplacement(
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
              "Settings",
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
                  children: [                  
                    SizedBox(height: 10,),

                    GestureDetector(
                      onDoubleTap: (){},

                      onTap: () async{
                        FlutterWebBrowser.openWebPage(
                          url: aboutUs,
                          customTabsOptions: CustomTabsOptions(
                            colorScheme: CustomTabsColorScheme.dark,
                            toolbarColor: Constants.greenColor,
                            secondaryToolbarColor: Constants.greenColor,
                            navigationBarColor: Constants.greenColor,
                            addDefaultShareMenuItem: true,
                            instantAppsEnabled: true,
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
                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  WebBrowser(),
                            ));*/

                      },
                      child: Container(
                        width: mediaQueryWidth,
                        color: Colors.transparent,

                        child:Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset("images/s1.png")
                            ),
                            SizedBox(width: 8),
                            Text(
                              "About Us",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 18,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(height: 1,color: Constants.greySliderColor,),

                    SizedBox(height: 10,),

                    GestureDetector(
                      onDoubleTap: (){},                      onTap: () async{
                        FlutterWebBrowser.openWebPage(
                          url: privacy,
                          customTabsOptions: CustomTabsOptions(
                            colorScheme: CustomTabsColorScheme.dark,
                            toolbarColor: Constants.greenColor,
                            secondaryToolbarColor: Constants.greenColor,
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

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (BuildContext context) =>
                        //           WebBrowser(privacy),
                        //     ));

                      },
                      child: Container(
                        width: mediaQueryWidth,
                        color: Colors.transparent,

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset("images/s2.png")
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Privacy Policy",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 18,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),

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

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AccountDetails(),
                            ));
                      },                    child: Container(
                      width: mediaQueryWidth,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset("images/s3.png")
                            ),
                            SizedBox(width: 8),
                            Text(
                              "My Account",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 18,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),),
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

