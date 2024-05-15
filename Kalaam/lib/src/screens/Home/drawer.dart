// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use

import 'package:kalaam/src/services/Library.dart';
import 'package:kalaam/src/screens/Bills/Bills.dart';

class DrawerClass extends StatefulWidget {
  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  bool showList = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        color: Constants.backgroundWhiteColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: new Container(
          color: Constants.backgroundWhiteColor,
          child: new Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (BuildContext context) => Home(),
                    //     ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 30, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.close,
                          color: Constants.headingBlackColor,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AccountDetails(),
                        ));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xfffafafa),
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x0c101828),
                                          blurRadius: 2,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                      image: DecorationImage(
                                          image: userImage == ""
                                              ? AssetImage("images/dp.png")
                                              : NetworkImage(userImage),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                              /*Positioned.fill(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: Stack(
                                      children:[Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Color(0xfffafafa), width: 1, ),
                                          color: Constants.greenColor,
                                        ),
                                      ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Center(child: Icon(Icons.camera_alt, size: 10, color: Constants.whiteText,

                                              )),
                                            ),
                                          ),
                                        ),],
                                    ),
                                  ),
                                ),
                              ),*/
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              userEmail,
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              userMobile,
                              style: TextStyle(
                                color: Constants.greyButtonTextColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Constants.greyTextColor,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  color: Constants.greySliderColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // GestureDetector(
                      //   onTap: (){

                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (BuildContext context) =>
                      //               AccountDetails(),
                      //         ));
                      //   },                    child: Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   color: Colors.transparent,
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children:[
                      //       Container(
                      //           width: 24,
                      //           height: 24,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(8),
                      //           ),
                      //           child: Image.asset("images/user.png")
                      //       ),
                      //       SizedBox(width: 8),
                      //       Text(
                      //         "Account Details",
                      //         style: TextStyle(
                      //           color: Constants.headingBlackColor,
                      //           fontSize: 18,
                      //           fontFamily: "Bliss Pro",
                      //           fontWeight: FontWeight.w500,
                      //         ),

                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // ),
                      //SizedBox(height: 10,),

                      //Container(height: 0.5,color: Constants.greySliderColor,),

                      // SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => MyServices(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                    "images/mySer.png",
                                    color: Constants.greyColor,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                "My Services",
                                style: TextStyle(
                                  color: Constants.greyColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        height: 0.5,
                        color: Constants.greySliderColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Bills(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    "images/bill & Payments.svg",
                                    color: Constants.greyColor,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                "Bills & Payments",
                                style: TextStyle(
                                  color: Constants.greyColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        height: 0.5,
                        color: Constants.greySliderColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Help(),
                              ));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  "images/d4.png",
                                  color: Constants.greyColor,
                                )),
                            SizedBox(width: 8),
                            Text(
                              "Help & Support",
                              style: TextStyle(
                                color: Constants.greyColor,
                                fontSize: 18,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        height: 0.5,
                        color: Constants.greySliderColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*   GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Survey(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,

                          child:  Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                width: 24,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset("images/d1.png",
                                  fit: BoxFit.cover,
                                  color: Constants.greyColor,
                                )
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Survey",
                                style: TextStyle(
                                  color: Constants.greyColor,
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

                      Container(height: 0.5,color: Constants.greySliderColor,),

                      SizedBox(height: 10,),*/
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Offers(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    "images/order.svg",
                                    color: Constants.greyColor,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                "Offers",
                                style: TextStyle(
                                  color: Constants.greyColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        height: 0.5,
                        color: Constants.greySliderColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Orders(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 24,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    "images/request.svg",
                                    color: Constants.greyColor,
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                "My Requests",
                                style: TextStyle(
                                  color: Constants.greyColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /* SizedBox(
                        height: 10,
                      ),

                      Container(
                        height: 0.5,
                        color: Constants.greySliderColor,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Orders(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 25,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    "images/request.svg",
                                    color: Constants.greyColor,
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                "My Requests",
                                style: TextStyle(
                                  color: Constants.greyColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),*/
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        height: 0.5,
                        color: Constants.greySliderColor,
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    JoinPartner(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                    "images/d2.png",
                                    color: Constants.greyColor,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                "Join as a partner",
                                style: TextStyle(
                                  color: Constants.greyColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        height: 0.5,
                        color: Constants.greySliderColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      /*     GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    News(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,

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
                                  child: SvgPicture.asset("images/news.svg")
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Our News",
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

                      Container(height: 0.5,color: Constants.greySliderColor,),
                      SizedBox(height: 10,),*/
                      /*  GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CaseStudy(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,

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
                                  child: SvgPicture.asset("images/case study.svg")
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Case Studies",
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

                      Container(height: 0.5,color: Constants.greySliderColor,),
                      SizedBox(height: 10,),*/

                      GestureDetector(
                        onDoubleTap: () {},
                        onTap: () async {
/*
                FlutterWebBrowser.openWebPage(
                  url: aboutUs,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    WebBrowser(aboutUs),
                              ));
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  WebBrowser(),
                            ));*/
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                    "images/s1.png",
                                    color: Constants.greyColor,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                "About Us",
                                style: TextStyle(
                                  color: Constants.greyColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        height: 0.5,
                        color: Constants.greySliderColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      GestureDetector(
                        onDoubleTap: () {},
                        onTap: () async {
                          /*
                        FlutterWebBrowser.openWebPage(
                          url: privacy,
                          customTabsOptions: CustomTabsOptions(
                            colorScheme: CustomTabsColorScheme.dark,
                            toolbarColor: Constants.greenColor,
                            secondaryToolbarColor: Colors.green,
                            navigationBarColor: Constants.greenColor,
                            addDefaultShareMenuItem: true,
                            instantAppsEnabled: false,
                            showTitle: false,
                            urlBarHidingEnabled: false,
                          ),
                          safariVCOptions: SafariViewControllerOptions(
                            barCollapsingEnabled: true,
                            preferredBarTintColor: Constants.greenColor,
                            preferredControlTintColor: Constants.greenColor,
                            dismissButtonStyle:
                            SafariViewControllerDismissButtonStyle.cancel,
                            modalPresentationCapturesStatusBarAppearance: true,
                          ),
                        );
*/

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    WebBrowserLong(privacy),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                    "images/s2.png",
                                    color: Constants.greyColor,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  color: Constants.greyColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        height: 0.5,
                        color: Constants.greySliderColor,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Do you want to delete your account?",
                                      maxLines: 5,
                                      style: TextStyle(
                                        color: Constants.headingBlackColor,
                                        fontSize: 20,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 5, 15, 5),
                                            child: Center(
                                              child: Text(
                                                "No",
                                                textScaleFactor: 1.0,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color:
                                                      Constants.greyTextColor,
                                                  fontSize: 18,
                                                  fontFamily: "Bliss Pro",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          deleteAcc();
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 5, 15, 5),
                                            child: Center(
                                              child: Text(
                                                "Yes",
                                                textScaleFactor: 1.0,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Constants.greenColor,
                                                  fontSize: 18,
                                                  fontFamily: "Bliss Pro",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    "images/del.svg",
                                    color: Constants.greyColor,
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                "Delete My Account",
                                style: TextStyle(
                                  color: Constants.greyColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        height: 0.5,
                        color: Constants.greySliderColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setStringPreference("userEmail", "");
                          setStringPreference("userPass", "");

                          setState(() {
                            if (timer != null) {
                              timer.cancel();
                            }
                            caseStudyList = [];
                            otpForget = "";
                            isPartner = "";

                            otpCreate = "";

                            privacy = "";
                            aboutUs = "";
                            isNewTicket = false;
                            isNewOrder = false;
                            catList = [];
                            selectTicketStatus = [];
                            selectTicketName = [];
                            ticketStatus = [];
                            accountDetails = false;
                            userId = "";
                            imageFile;
                            productCount = 0;
                            itemCount = 0;
                            priceCount = 0.0;
                            countryCode = "";
                            countryCodeID = "";
                            countryShort = "";
                            paymentBoxList = [];
                            shortName = "";
                            userName = "";
                            payID = "";
                            payerName = "";
                            bills = [];
                            pageLen = 0;
                            invoice = [];
                            history = [];
                            userImage = "";
                            userEmail = "";
                            userMobile = "";
                            showContact = false;
                            payersList = [];
                            contactNo = "";
                            emailContact = "";
                            firebaseId = "";
                            deviceId = "";
                            filterCount = 0;
                            newUser = true;
                            countryCodeLength = "0";
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Splash(),
                              ));
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                    "images/log.png",
                                    color: Constants.greyColor,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Log out",
                                style: TextStyle(
                                  color: Constants.greyColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /*SizedBox(
                        height: 10,
                      ),*/

                      /*SizedBox(height:

                      MediaQuery.of(context).size.height*0.11,),*/
                    ],
                  ),
                ),

                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              launch(instagramUrl);
                            },
                            child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SvgPicture.asset(
                                  "images/insta.svg",
                                  color: Constants.greenColor,
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              launch(facbookUrl);
                            },
                            child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SvgPicture.asset(
                                  "images/fb.svg",
                                  color: Constants.greenColor,
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              launch(linkedinUrl);
                            },
                            child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SvgPicture.asset(
                                  "images/linked.svg",
                                  color: Constants.greenColor,
                                )),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      Container(height: 1, color: Constants.greySliderColor),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          "App Version $appVersion",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.greyTextColor,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteAcc() async {
    print(userId);

    var enc = await encryptData({
      "user_id": userId,
    });
    print(enc);

    var dataSignUp = await delAccount(enc);
    print("delete acc");
    print(dataSignUp);
    if (dataSignUp["RETURN_FLAG"] == true) {
      setStringPreference("userEmail", "");
      setStringPreference("userPass", "");

      setState(() {
        if (timer != null) {
          timer.cancel();
        }
        caseStudyList = [];
        otpForget = "";
        isPartner = "";

        otpCreate = "";

        privacy = "";
        aboutUs = "";
        isNewTicket = false;
        isNewOrder = false;
        catList = [];
        selectTicketStatus = [];
        selectTicketName = [];
        ticketStatus = [];
        accountDetails = false;
        userId = "";
        imageFile;
        productCount = 0;
        itemCount = 0;
        priceCount = 0.0;
        countryCode = "";
        countryCodeID = "";
        countryShort = "";
        paymentBoxList = [];
        shortName = "";
        userName = "";
        payID = "";
        payerName = "";
        bills = [];
        pageLen = 0;
        invoice = [];
        history = [];
        userImage = "";
        userEmail = "";
        userMobile = "";
        showContact = false;
        payersList = [];
        contactNo = "";
        emailContact = "";
        firebaseId = "";
        deviceId = "";
        filterCount = 0;
        newUser = true;
        countryCodeLength = "0";
      });

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Splash(),
          ));
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }
    setState(() {
      //  load = false;
    });
  }
}
