// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations

import 'package:intl/intl.dart';
import 'package:kalaam/src/services/Library.dart';

class OrderData extends StatefulWidget {
  var data;
  OrderData(this.data);

  @override
  State<OrderData> createState() => _OrderDataState(this.data);
}

class _OrderDataState extends State<OrderData> {
  var data;
  _OrderDataState(this.data);
  bool load = false;

  List<dynamic> productList = [];
  @override
  void initState() {
    super.initState();
    getProductData();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Orders(),
            ));
      },
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.backgroundWhiteColor,
            iconTheme: IconThemeData(color: Colors.black),
            leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Orders(),
                      ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Constants.headingBlackColor,
                )),
            title: Text(
              "Request Details",
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
            width: mediaQueryWidth,
            height: mediaQueryHeight,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: mediaQueryWidth,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Request ID: " + data["order_no"],
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: Constants.headingBlackColor,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "${DateFormat('dd MMM yyyy').format(DateTime.parse(data['created_at'].toString()))}",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: Constants.headingBlackColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: mediaQueryWidth,
                        height: mediaQueryHeight - 160,
                        child: ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: productList.length,
                            itemBuilder: (context, index) => dataWidget(
                                mediaQueryWidth,
                                mediaQueryHeight,
                                productList[index],
                                index))),
                  ],
                ),
                load == true ? LoadingHome() : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getProductData() async {
    setState(() {
      load = true;
    });

    var enc =
        await encryptData({"user_id": userId, "order_no": data['order_no']});

    var dataSignUp = await getRequestData(enc);

    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        productList = dataSignUp["RETURN_DATA"];
      });
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }

  Widget dataWidget(final mediaQueryWidth, final mediaQueryHeight,
      var productList, int index) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Card(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
            child: Container(
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
                            child: !CustomWidgets.checkValidString(
                                    productList["product_web_img"])
                                ? Image.asset("images/aws.png",
                                    width: 70.96, height: 72)
                                : Image.network(
                                    WebApis.SERVER_URL +
                                        productList["product_app_img"],
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
                            // Text(
                            //   "Your Request ID: " +
                            //       productList["order_no"].toString(),
                            //   style: TextStyle(
                            //     color: Constants.greyButtonTextColor,
                            //     fontSize: 12,
                            //   ),
                            // ),
                            // SizedBox(height: 4),
                            SizedBox(
                              width: mediaQueryWidth * 0.43,
                              child: Text(
                                productList['product_name'].toString(),
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
                              "Qty: " + productList["od_qty"].toString(),
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            CustomWidgets.checkValidString(
                                    productList["od_attribute_name"])
                                ? SizedBox(
                                    width: mediaQueryWidth * 0.48,
                                    child: Text(
                                      "Product Varient : " +
                                          productList["od_attribute_name"]
                                              .toString(),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
