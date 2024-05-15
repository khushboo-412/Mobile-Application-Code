// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations
import 'package:kalaam/src/services/Library.dart';
import 'package:intl/intl.dart';

class Orders1 extends StatefulWidget {
  @override
  Orders1State createState() => Orders1State();
}

class Orders1State extends State<Orders1> {
  String name;
  PageController pageBannerController = PageController();
  int sliderBannerIndex = 0;
  List show = [false, false, false];
  PageController pageNewsController = PageController();
  int sliderNewsIndex = 0;
  List cartDataList = [];

  bool load = false;
  PageController pageOfferController = PageController();
  int sliderOfferIndex = 0;

  PageController pageSurveyController = PageController();
  int sliderSurveyIndex = 0;
  bool status = false;
  String firstDate = "";
  int sliderIndex = 0;
  List banner = ['images/banner.png', 'images/banner.png', 'images/banner.png'];
  List news = ['images/news.png', 'images/news.png', 'images/news.png'];
  List offer = ['images/offer.png', 'images/offer.png', 'images/offer.png'];
  List cartListData = [];

  bool showSubmit = false;
  @override
  void initState() {
    super.initState();

    cartList();
    if (isNewOrder) {
      //survey();
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Home(),
              ));
        },
        child: new Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.backgroundWhiteColor,
            iconTheme: IconThemeData(color: Colors.black),
            leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Home(),
                      ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Constants.headingBlackColor,
                )),
            title:
//Align(      alignment: Alignment(-12, 0),

                Text(
              "My Requests",
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
          bottomNavigationBar: showSubmit == false
              ? Container(
                  height: 1,
                )
              : Container(
                  height: 70,
                  color: Constants.backgroundWhiteColor,
                  child: Padding(
                    padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Home(),
                            ));
                      },
                      child: Container(
                        width: mediaQueryWidth,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Constants.greenColor,
                        ),
                        child: Center(
                          child: Opacity(
                            opacity: 0.90,
                            child: Text(
                              "Shop Now",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.whiteText,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          body: SingleChildScrollView(
            child: Container(
              color: Constants.backgroundWhiteColor,
              child: Padding(
                padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 20,),
                    Container(
                      width: mediaQueryWidth,
                      /*decoration: BoxDecoration(
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
                            Text(
                              "Search",
                              style: TextStyle(
                                color: Color(0x4c1c201d),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),*/
                    ),
                    //SizedBox(height: 20,),

                    Stack(
                      children: [
                        load == true ? LoadingProgress("") : SizedBox(),
/*
                        Container(
                          height: cartDataList.length*150.0,

                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              // This next line does the trick.

                              itemCount: cartDataList.length,
                              itemBuilder: (context, index) {
                                return cartCard(cartDataList[index], index, cartDataList);
                              }),
                        ),
*/

                        Container(
                          child: GroupedListView<dynamic, String>(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            sort: false,
                            elements: cartDataList,

                            groupBy: (element) => element['order_date'],

                            groupSeparatorBuilder: (String groupByValue) =>
                                dateCard(groupByValue),
                            itemBuilder: (context, dynamic element) =>
                                cartCard(element),

                            useStickyGroupSeparators: true,
                            // optional
                            floatingHeader: true, // optional
                            // order: GroupedListOrder.DESC, //
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> survey() async {
    setState(() {
      load = true;
    });
    print("8989");

    var enc =
        await encryptData({"survey_status": "PLACED_ORDER", "user_id": userId});
    var dataSignUp = await getSurveyStatusAPI(enc);

    print(dataSignUp["RETURN_MSG"]);
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      var data = dataSignUp["RETURN_DATA"];
      setState(() {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0)),
                      child: Image.network(
                        WebApis.SERVER_URL + data["SurveyImage"],
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    border: Border.all(
                      color: Color(0x19898a8d),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExpandableText(
                          "${data["SurveyName"]}",
                          expandText: 'read more',
                          collapseText: 'read less',
                          maxLines: 2,
                          linkColor: Constants.greenColor,
                          animation: true,
                          //textScaleFactor: 1.0,
                          style:
                              TextStyle(fontSize: 15, fontFamily: "Bliss Pro"),
                          collapseOnTextTap: true,
                          mentionStyle: TextStyle(
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w600,
                          ),
                          onUrlTap: (url) => launch(url),
                          urlStyle: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
/*
                        Text(
                          data["SurveyName"],
                          maxLines: 5,
                          style: TextStyle(
                            color: Constants.headingBlackColor,
                            fontSize: 14,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
*/
                        SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            data["SurveyDesc"],
                            style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 12,
                                fontFamily: "Bliss Pro"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isNewOrder = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.transparent,
                        /* decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                   */ /* boxShadow: [
                      BoxShadow(
                        color: Color(0x2600a817),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],*/ /*
                   // color: Constants.greenColor,
                  ),*/

                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Center(
                            child: Text(
                              "Skip",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 16,
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
                        setState(() {
                          isNewOrder = false;
                        });
                        launch(data["SurveyLink"].toString());
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.transparent,
                        /* decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                     */ /* boxShadow: [
                      BoxShadow(
                        color: Color(0x2600a817),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],*/ /*
                     // color: Constants.greenColor,
                    ),*/

                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Center(
                            child: Text(
                              "Start Survey",
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }

  Widget dateCard(String date) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /*    date == firstDate?SizedBox():SizedBox(height: 25,),
      date == firstDate?SizedBox(): Container(height: 1,
        color: Constants.greySliderColor,),
      date == firstDate?SizedBox():*/
        SizedBox(
          height: 25,
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0x0c898a8d),
                    width: 1,
                  ),
                  color: Color(0x0c00a817),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  child: Text(
                    DateFormat("dd MMM yyyy").format(DateTime.parse(date)),
                    style: TextStyle(
                      color: Color(0xcc1c201d),
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }

  Widget cartCard(dynamic data) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        /* dateCard( data[""]),
      SizedBox(height: 20),*/
        Container(
          width: mediaQueryWidth,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: mediaQueryWidth * 0.85,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0x19898a8d),
                          width: 1,
                        ),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: data["product_web_img"] == "" ||
                                data["product_web_img"] == null ||
                                data["product_web_img"].toString() == "null"
                            ? Image.asset("images/aws.png",
                                width: 70.96, height: 72)
                            : Image.network(
                                WebApis.SERVER_URL + data["product_app_img"],
                                fit: BoxFit.cover,
                                width: 70.96,
                                height: 72,
                              ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Request ID: " + data["order_no"],
                          style: TextStyle(
                            color: Constants.greyButtonTextColor,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: mediaQueryWidth * 0.43,
                          child: Text(
                            data['product_name'],
                            style: TextStyle(
                              color: Constants.headingBlackColor,
                              fontSize: 16,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Qty: " + data["od_qty"],
                          style: TextStyle(
                            color: Constants.greyTextColor,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        CustomWidgets.checkValidString(
                                data["od_attribute_name"])
                            ? SizedBox(
                                width: mediaQueryWidth * 0.48,
                                child: Text(
                                  "Product Varient : " +
                                      data["od_attribute_name"],
                                  style: TextStyle(
                                    color: Constants.headingBlackColor,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        //  SizedBox(height: 12),

                        /*Text(
                        "\$"+ data["od_amount"],
                        style: TextStyle(
                          color: Constants.headingBlackColor,
                          fontSize: 20,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
*/
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Future<void> cartCheck() async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({
      "user_id": userId,
    });
    var dataSignUp = await cartListAPI(enc);
    print("car l dataSignUp");
    print(dataSignUp);
    print("vers:" + dataSignUp["RETURN_MSG"].toString());
    if (dataSignUp["RETURN_FLAG"] == true) {
      // WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        cartListData = dataSignUp["RETURN_DATA"];
        print("cart len list:" + cartListData.length.toString());
        if (cartListData.length == 0) {
          showSubmit = true;
        } else {
          showSubmit = false;
        }
      });
    } else {
      setState(() {
        // showSubmit =false;
        //  showSubmit = true;

        if (cartListData.length == 0) {
          showSubmit = true;
        }
      });
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      //load = false;
    });
  }

  Future<void> cartList() async {
    setState(() {
      load = true;
    });
    print("8989");
    print(userId);
    cartCheck();

    var enc = await encryptData({
      "user_id": userId,
    });
    var dataSignUp = await orderListAPI(enc);
    print(dataSignUp);
    if (dataSignUp["RETURN_FLAG"] == true) {
      print("message:" + dataSignUp["RETURN_MSG"].toString());
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        cartDataList = dataSignUp["RETURN_DATA"];
        firstDate = dataSignUp["RETURN_DATA"][0]["order_date"];
      });
      print("cartDataList");
      print(cartDataList);
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }
}
