// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, annotate_overrides, sized_box_for_whitespace, prefer_const_constructors, unnecessary_string_escapes, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:kalaam/src/services/Library.dart';

class IntroPlaceholder extends StatefulWidget {
  @override
  _IntroPlaceholderState createState() => _IntroPlaceholderState();
}

class _IntroPlaceholderState extends State<IntroPlaceholder> {
  PageController pageController = PageController(initialPage: 0);
  int sliderIndex = 0;
  bool showSkip = false;
  List<Widget> sliderList = [];
  build(context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    sliderList = [
      slider1(mediaQueryWidth, mediaQueryHeight),
      slider1_5(mediaQueryWidth, mediaQueryHeight),
      slider2(mediaQueryWidth, mediaQueryHeight),
      slider3(mediaQueryWidth, mediaQueryHeight),
      slider4(mediaQueryWidth, mediaQueryHeight),
      slider5(mediaQueryWidth, mediaQueryHeight),
    ];
    return WillPopScope(
      onWillPop: () {
        return Common.canGoBack();
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
                color: Constants.whiteText,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: PageView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return sliderList[index];
                    },
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        sliderIndex = index;
                      });
                    },
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget pageIndicator() {
    return Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 6; i++)
              i == sliderIndex
                  ? pageIndicatorContainer(true)
                  : pageIndicatorContainer(false)
          ],
        ));
  }

  Widget pageIndicatorContainer(bool isCurrentPage) {
    return isCurrentPage
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            height: 8,
            width: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Constants.whiteText, Constants.whiteText],
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Constants.greySliderColor, Constants.greySliderColor],
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          );
  }

  Widget introBuilder() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.56,
      child: PageView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return introData[index];
        },
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            sliderIndex = index;
          });
          //            Navigator.of(context).pushReplacementNamed('/intro');
        },
      ),
    );
  }

  List<IntroScreen> introData = [
    IntroScreen(
        image: 'sp1.png',
        description: 'Welcome to the',
        heading: 'World of Digital Possibilities',
        //'Grow your business by accepting card payments with the new card reader',
        description1: "",
        description2: "",
        description3: "",
        type: "de"),
    IntroScreen(
        image: 'sp1.png',
        description: 'Welcome to the',
        heading: 'World of Digital Possibilities',
        //'Grow your business by accepting card payments with the new card reader',
        description1: "",
        description2: "",
        description3: "",
        type: "png"),
    IntroScreen(
        image: 'sp2.png',
        heading: 'Subscribe to Digital Solutions', // 'Quick and Easy',
        description:
            '', //'Grow your business by accepting card payments with the new card reader',
        description1: "Subscribe to Kalaam\'s next-gen",
        description2: "cutting-edge technology solutions to",
        description3: "empower your business needs",
        type: "png"),
    IntroScreen(
        image: 'sp3.png',
        heading: 'Track your tickets', //'Quick and Easy',
        description: "",
        description1:
            'Now you can raise tickets and get', //'Grow your business by accepting card payments with the new card reader',
        description2: "real-time updates of its progress",
        description3: "",
        type: "png"),
    IntroScreen(
        image: '',
        heading: '', //'Quick and Easy',
        description: "",
        description1:
            '', //'Grow your business by accepting card payments with the new card reader',
        description2: "",
        description3: "",
        type: "desk"),
  ];

  Widget slider1(final screenWidth, final screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        color: Constants.greenColor,
        /*  image: DecorationImage(
          image: AssetImage('images/slider1.png'),
          fit: BoxFit.fill,
        ),*/
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(5);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Skip",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 42,
                    child: Image.asset(
                      "images/logoF.png",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Digital Solutions Partner",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Constants.whiteText,
                        fontSize: 25,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Towards achieving more impactful business growth",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Constants.whiteText,
                        fontSize: 14.4,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
/*
                  Text(
                    "Cloud | Managed Networks | Cybersecurity | Connectivity",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Constants.whiteText,
                        fontSize: 12.75,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.normal),
                  ),
*/
                ],
              ),
            ),
          ),
          Expanded(
            //flex: 1,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Constants.greenColor,
                image: DecorationImage(
                  image: AssetImage('images/slider1.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  // SizedBox(height: 70,),
                  Container(
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 6; i++)
                            i == 0
                                ? pageIndicatorContainer(true)
                                : pageIndicatorContainer(false)
                        ],
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pageController.jumpToPage(1);
                      });
                    },
                    child: CircularPercentIndicator(
                        radius: 75,
                        lineWidth: 3.0,
                        percent: 0.20,
                        center: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.whiteText,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.arrow_forward,
                            color: Constants.greenColor,
                          )),
                        ),
                        linearGradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: <Color>[
                              Constants.whiteText,
                              Constants.whiteText
                            ]),
                        rotateLinearGradient: true,
                        circularStrokeCap: CircularStrokeCap.round),
                  ),
                  // SizedBox(
                  //   height: 60.0,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget slider1_5(final screenWidth, final screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        color: Constants.greenColor,
        /*  image: DecorationImage(
          image: AssetImage('images/slider1.png'),
          fit: BoxFit.fill,
        ),*/
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(5);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Skip",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 42,
                    child: Image.asset(
                      "images/logoF.png",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                      Container(
                        height: 90,
                        width:90,

                        child: Column(
                          children: [
                            Container(

                                height: 70,
                                width:70,
                                child: Image.asset("images/s11.png", )),
                            Text("Cloud", textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 14.4,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                        Container(
                          height: 90,
                          width:90,
                        child: Column(
                          children: [
                            Container(

                                height: 70,
                                width:70,
                                child: Image.asset("images/s12.png", )),
                            Text("Cybersecurity", textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 14.4,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                        Container(
                          //height: 90,
                          width: 90,
                        child: Column(
                          children: [
                            Container(

                                height: 70,
                                width:70,
                                child: Image.asset("images/s13.png", )),
                            Text("Managed Networks", textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 14.4,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],),
                    SizedBox(height: 20,),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 90,
                          width:90,
                        child: Column(
                          children: [
                            Container(

                                height: 70,
                                width:70,
                                child: Image.asset("images/s14.png", )),
                            Text("Connectivity", textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 14.4,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                        Container(
                          height: 90,
                          width:90,
                        child: Column(
                          children: [
                            Container(

                                height: 70,
                                width:70,
                                child: Image.asset("images/s15.png", )),
                            Text("Digital & ICT", textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 14.4,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                        Container(
                          height: 90,
                          width:90,
                        child: Column(
                          children: [
                            Container(

                                height: 70,
                                width:70,
                                child: Image.asset("images/s16.png", )),
                            Text("Datacenter", textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 14.4,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],),

                  ],
                ),
              ),
            ),
          ),
          Expanded(
            //flex: 1,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Constants.greenColor,
                image: DecorationImage(
                  image: AssetImage('images/slider1.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  // SizedBox(height: 70,),
                  Container(
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 6; i++)
                            i == 1
                                ? pageIndicatorContainer(true)
                                : pageIndicatorContainer(false)
                        ],
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pageController.jumpToPage(2);
                      });
                    },
                    child: CircularPercentIndicator(
                        radius: 75,
                        lineWidth: 3.0,
                        percent: 0.20,
                        center: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.whiteText,
                          ),
                          child: Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Constants.greenColor,
                              )),
                        ),
                        linearGradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: <Color>[
                              Constants.whiteText,
                              Constants.whiteText
                            ]),
                        rotateLinearGradient: true,
                        circularStrokeCap: CircularStrokeCap.round),
                  ),
                  // SizedBox(
                  //   height: 60.0,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget slider2(final screenWidth, final screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Constants.whiteText,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(5);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Skip",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.greyTextColor,
                            fontSize: 16,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Constants.greyTextColor,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 42,
                    child: Image.asset("images/logoF.png"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height * 0.35,
                  child: Image(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.8,
                    image: AssetImage('images/sp1.png'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "Welcome to the",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "World of Digital Possibilities",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.greenColor,
                            fontSize: 25,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 6; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            height: 8,
                            width: i == 2 ? 48 : 8,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  i == 2 ? Colors.green : Constants.greyColor,
                                  i == 2 ? Colors.green : Constants.greyColor
                                ],
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          )
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(3);
                    });
                  },
                  child: CircularPercentIndicator(
                      radius: 75,
                      lineWidth: 3.0,
                      percent: 0.40,
                      center: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Constants.greenColor,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.arrow_forward,
                          color: Constants.whiteText,
                        )),
                      ),
                      linearGradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: <Color>[
                            Constants.greenColor,
                            Constants.greenColor
                          ]),
                      rotateLinearGradient: true,
                      circularStrokeCap: CircularStrokeCap.round),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget slider3(final screenWidth, final screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Constants.whiteText,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(5);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Skip",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.greyTextColor,
                            fontSize: 16,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Constants.greyTextColor,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 42,
                    child: Image.asset("images/logoF.png"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height * 0.35,
                  child: Image(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.8,
                    image: AssetImage('images/sp2.png'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "Subscribe to Digital Solutions",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.greenColor,
                            fontSize: 25,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "Choose from our portfolio of cutting edge",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "technology solutions",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    /*  SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "empower your business needs",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),*/
                      SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 6; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            height: 8,
                            width: i == 3 ? 48 : 8,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  i == 3 ? Colors.green : Constants.greyColor,
                                  i == 3 ? Colors.green : Constants.greyColor
                                ],
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          )
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(4);
                    });
                  },
                  child: CircularPercentIndicator(
                      radius: 75,
                      lineWidth: 3.0,
                      percent: 0.60,
                      center: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Constants.greenColor,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.arrow_forward,
                          color: Constants.whiteText,
                        )),
                      ),
                      linearGradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: <Color>[
                            Constants.greenColor,
                            Constants.greenColor
                          ]),
                      rotateLinearGradient: true,
                      circularStrokeCap: CircularStrokeCap.round),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget slider4(final screenWidth, final screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Constants.whiteText,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(5);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Skip",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.greyTextColor,
                            fontSize: 16,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Constants.greyTextColor,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 42,
                    child: Image.asset("images/logoF.png"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height * 0.35,
                  child: Image(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.8,
                    image: AssetImage('images/sp3.png'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "Track your tickets",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.greenColor,
                            fontSize: 25,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "Now you can raise tickets and get",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "real-time updates instantly",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            "",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 20,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 6; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            height: 8,
                            width: i == 4 ? 48 : 8,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  i == 4 ? Colors.green : Constants.greyColor,
                                  i == 4 ? Colors.green : Constants.greyColor
                                ],
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          )
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(5);
                    });
                  },
                  child: CircularPercentIndicator(
                      radius: 75,
                      lineWidth: 3.0,
                      percent: 0.70,
                      center: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Constants.greenColor,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.arrow_forward,
                          color: Constants.whiteText,
                        )),
                      ),
                      linearGradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: <Color>[
                            Constants.greenColor,
                            Constants.greenColor
                          ]),
                      rotateLinearGradient: true,
                      circularStrokeCap: CircularStrokeCap.round),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget slider5(final screenWidth, final screenHeight) {
    return Container(
        width: screenWidth,
        height: screenHeight,
        color: Constants.whiteText,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      pageController.jumpToPage(5);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "",
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.greyTextColor,
                              fontSize: 16,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Constants.greyTextColor,
                            size: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 42,
                      child: Image.asset("images/logoF.png"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "How to Register?",
                        textScaleFactor: 1.0,
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.greenColor,
                          fontSize: 25,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.greenColor,
                          ),
                          child: Center(
                            child: Text(
                              "1",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text(
                          "  Click “Create an Account”",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Constants.greyTextColor,
                              fontSize: 20,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.normal),
                        ),

                          ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.greenColor,
                            ),
                            child: Center(
                              child: Text(
                                "2",
                                textScaleFactor: 1.0,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Constants.whiteText,
                                    fontSize: 18,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "  Enter your details",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Constants.greyTextColor,
                              fontSize: 20,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.normal),

                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "(if you are an existing Kalaam Customer, use the registered email account with Kalaam)",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            color: Constants.greyTextColor,
                            fontSize: 18,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.greenColor,
                            ),
                            child: Center(
                              child: Text(
                                "3",
                                textScaleFactor: 1.0,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Constants.whiteText,
                                    fontSize: 18,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "  Verify your account with OTP\n  sent to your registered email",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Constants.greyTextColor,
                              fontSize: 20,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.normal),

                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.greenColor,
                            ),
                            child: Center(
                              child: Text(
                                "4",
                                textScaleFactor: 1.0,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Constants.whiteText,
                                    fontSize: 18,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "  Once verified, click “Log in”\n  using verified email",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Constants.greyTextColor,
                              fontSize: 20,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.normal),

                        ),
                      ],
                    ),
                    // Spacer(),
                    // SizedBox(
                    //   height: 20.0,
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                        width: screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 6; i++)
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                height: 8,
                                width: i == 5 ? 48 : 8,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      i == 5
                                          ? Colors.green
                                          : Constants.greyColor,
                                      i == 5
                                          ? Colors.green
                                          : Constants.greyColor
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CreateAccount(),
                              ));
                        },
                        child: Container(
                          width: screenWidth,
                          height: 48,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x4f00a817),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Constants.greenColor,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 62,
                            vertical: 14,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Create Account",
                                textScaleFactor: 1.0,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 16,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
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
                                builder: (BuildContext context) => Login(),
                              ));
                        },
                        child: Text(
                          "Log in",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Constants.greenColor,
                            fontSize: 16,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 20.0,
                  // ),
                ],
              ),
            ),
          ],
        ));
  }
}

// class IntroPlaceholder extends StatefulWidget {
//   @override
//   _IntroPlaceholderState createState() => _IntroPlaceholderState();
// }

// class _IntroPlaceholderState extends State<IntroPlaceholder> {
//   PageController pageController = PageController(initialPage: 0);
//   int sliderIndex = 0;
//   bool showSkip = false;
//   build(context) {
//     return WillPopScope(
//       onWillPop: () {
//         return Common.canGoBack();
//       },
//       child: SafeArea(
//         child: Scaffold(
//           body: Container(
//             color: Constants.whiteText,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: sliderIndex == 3
//                       ? Container(
//                           color: Colors.transparent,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text(
//                                 "Skip",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Colors.transparent,
//                                   fontSize: 16,
//                                   fontFamily: "Bliss Pro",
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               Icon(
//                                 Icons.arrow_forward_ios,
//                                 color: Colors.transparent,
//                                 size: 15,
//                               ),
//                             ],
//                           ),
//                         )
//                       : GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               showSkip = true;
//                               pageController.jumpToPage(3);
//                             });
//                           },
//                           child: Container(
//                             color: Colors.transparent,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   "Skip",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Constants.greyTextColor,
//                                     fontSize: 16,
//                                     fontFamily: "Bliss Pro",
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 Icon(
//                                   Icons.arrow_forward_ios,
//                                   color: Constants.greyTextColor,
//                                   size: 15,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 10, bottom: 20),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.7,
//                     height: 42,
//                     child: Image.asset("images/logoF.png"),
//                   ),
//                 ),
//                 introBuilder(),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 pageIndicator(),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Container(
//                   height: 95,
//                   child: sliderIndex == 3
//                       ? Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (BuildContext context) =>
//                                           CreateAccount(),
//                                     ));
//                               },
//                               child: Container(
//                                 width: 327,
//                                 height: 48,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color(0x4f00a817),
//                                       blurRadius: 8,
//                                       offset: Offset(0, 4),
//                                     ),
//                                   ],
//                                   color: Constants.greenColor,
//                                 ),
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 62,
//                                   vertical: 14,
//                                 ),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "Create Account",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Constants.whiteText,
//                                         fontSize: 16,
//                                         fontFamily: "Bliss Pro",
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (BuildContext context) =>
//                                           Login(),
//                                     ));
//                               },
//                               child: Text(
//                                 "Log in",
//                                 style: TextStyle(
//                                   color: Constants.greenColor,
//                                   fontSize: 16,
//                                   fontFamily: "Bliss Pro",
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       : 
// GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (sliderIndex == 0) {
//                                 pageController.jumpToPage(1);
//                               } else if (sliderIndex == 1) {
//                                 pageController.jumpToPage(2);
//                               } else if (sliderIndex == 2) {
//                                 pageController.jumpToPage(3);
//                               }
//                             });
//                           },
//                           child: CircularPercentIndicator(
//                               radius: 70,
//                               lineWidth: 3.0,
//                               percent: sliderIndex == 0
//                                   ? 0.25
//                                   : sliderIndex == 1
//                                       ? 0.5
//                                       : 0.75,
//                               center: Container(
//                                 width: 64,
//                                 height: 64,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Constants.greenColor,
//                                 ),
//                                 child: Center(
//                                     child: Icon(
//                                   Icons.arrow_forward,
//                                   color: Constants.whiteText,
//                                 )),
//                               ),
//                               linearGradient: LinearGradient(
//                                   begin: Alignment.topRight,
//                                   end: Alignment.bottomLeft,
//                                   colors: <Color>[
//                                     Constants.greenColor,
//                                     Constants.greenColor
//                                   ]),
//                               rotateLinearGradient: true,
//                               circularStrokeCap: CircularStrokeCap.round),
//                         ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget pageIndicator() {
//     return Container(
//         width: 100,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             for (int i = 0; i < 5; i++)
//               i == sliderIndex
//                   ? pageIndicatorContainer(true)
//                   : pageIndicatorContainer(false)
//           ],
//         ));
//   }

//   Widget pageIndicatorContainer(bool isCurrentPage) {
//     return isCurrentPage
//         ? Container(
//             margin: EdgeInsets.symmetric(horizontal: 2),
//             height: 8,
//             width: 48,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Constants.greenColor, Constants.greenColor],
//               ),
//               borderRadius: BorderRadius.circular(4),
//             ),
//           )
//         : Container(
//             margin: EdgeInsets.symmetric(horizontal: 2),
//             height: 8,
//             width: 8,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Constants.greySliderColor, Constants.greySliderColor],
//               ),
//               borderRadius: BorderRadius.circular(4),
//             ),
//           );
//   }

//   Widget introBuilder() {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.56,
//       child: PageView.builder(
//         itemCount: 4,
//         itemBuilder: (context, index) {
//           return introData[index];
//         },
//         controller: pageController,
//         onPageChanged: (index) {
//           setState(() {
//             sliderIndex = index;
//           });
//           //            Navigator.of(context).pushReplacementNamed('/intro');
//         },
//       ),
//     );
//   }

//   List<IntroScreen> introData = [
//     IntroScreen(
//         image: 'sp1.png',
//         description: 'Welcome to the',
//         heading: 'World of Digital Possibilities',
//         //'Grow your business by accepting card payments with the new card reader',
//         description1: "",
//         description2: "",
//         description3: "",
//         type: "de"),
//     IntroScreen(
//         image: 'sp1.png',
//         description: 'Welcome to the',
//         heading: 'World of Digital Possibilities',
//         //'Grow your business by accepting card payments with the new card reader',
//         description1: "",
//         description2: "",
//         description3: "",
//         type: "png"),
//     IntroScreen(
//         image: 'sp2.png',
//         heading: 'Subscribe to Digital Solutions', // 'Quick and Easy',
//         description:
//             '', //'Grow your business by accepting card payments with the new card reader',
//         description1: "Subscribe to Kalaam\'s next-gen",
//         description2: "cutting-edge technology solutions to",
//         description3: "empower your business needs",
//         type: "png"),
//     IntroScreen(
//         image: 'sp3.png',
//         heading: 'Track your tickets', //'Quick and Easy',
//         description: "",
//         description1:
//             'Now you can raise tickets and get', //'Grow your business by accepting card payments with the new card reader',
//         description2: "real-time updates of its progress",
//         description3: "",
//         type: "png"),
//     IntroScreen(
//         image: '',
//         heading: '', //'Quick and Easy',
//         description: "",
//         description1:
//             '', //'Grow your business by accepting card payments with the new card reader',
//         description2: "",
//         description3: "",
//         type: "desk"),
//   ];
// }
