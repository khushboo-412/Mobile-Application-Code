// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations

import 'package:kalaam/src/screens/Orders/OrderData.dart';
import 'package:kalaam/src/services/Library.dart';
import 'package:intl/intl.dart';

class Orders extends StatefulWidget {
  @override
  OrdersState createState() => OrdersState();
}

class OrdersState extends State<Orders> {
  String name;
  List cartDataList = [];

  bool load = false;

  bool status = false;
  String firstDate = "";

  List cartListData = [];

  bool showSubmit = false;
 
  
  @override
  void initState() {
   
    super.initState();

    cartCheck();
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
            title: Text(
              "My Requests",
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
          bottomNavigationBar: showSubmit == false && load == true
              ? SizedBox()
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
                              textScaleFactor: 1.0,
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
          body: Container(
            width: mediaQueryWidth,
            height: mediaQueryHeight,
            color: Constants.backgroundWhiteColor,
            child: Stack(
              children: [
                Container(
                    width: mediaQueryWidth,
                    height: mediaQueryHeight - 160,
                    child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartDataList.length,
                        itemBuilder: (context, index) =>
                            dataWidget(cartDataList[index], index))),
                load == true ? LoadingHome() : SizedBox(),
              ],
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
   

    var enc =
        await encryptData({"survey_status": "PLACED_ORDER", "user_id": userId});
    var dataSignUp = await getSurveyStatusAPI(enc);

   
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
                          textScaleFactor: 1.0,
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
                            textScaleFactor: 1.0,
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
                              textScaleFactor: 1.0,
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
                    textScaleFactor: 1.0,
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

  Widget dataWidget(var data, int i) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => OrderData(cartDataList[i]),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Card(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Request ID: " + data["order_no"],
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Constants.headingBlackColor,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "${DateFormat('dd MMM yyyy').format(DateTime.parse(data['created_at'].toString()))} | ",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Constants.headingBlackColor,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Item Count : " + data['total_item_count'].toString(),
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Constants.headingBlackColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                  color: Constants.greenColor,
                )
              ],
            ),
          ),
        ),
      ),
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
                          textScaleFactor: 1.0,
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
                            textScaleFactor: 1.0,
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
                                      textScaleFactor: 1.0,
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

    if (dataSignUp["RETURN_FLAG"] == true) {
      setState(() {
        cartListData = dataSignUp["RETURN_DATA"];

        if (cartListData.length == 0) {
          showSubmit = true;
        } else {
          showSubmit = false;
        }
      });
    } else {
      setState(() {
        if (cartListData.length == 0) {
          showSubmit = true;
        }
      });
      // WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    getProductList();
  }

  Future<void> cartList() async {
    setState(() {
      load = true;
    });

    cartCheck();

    var enc = await encryptData({
      "user_id": userId,
    });
    var dataSignUp = await orderListAPI(enc);
   
    if (dataSignUp["RETURN_FLAG"] == true) {
     
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        cartDataList = dataSignUp["RETURN_DATA"];
        firstDate = dataSignUp["RETURN_DATA"][0]["order_date"];
      });
     
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }

  void getProductList() async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({
      "user_id": userId,
    });
    var dataSignUp = await getRequestList(enc);
    
    if (dataSignUp["RETURN_FLAG"] == true) {
     
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        cartDataList = dataSignUp["RETURN_DATA"];
        firstDate = dataSignUp["RETURN_DATA"][0]["order_date"];
      });
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }
}
