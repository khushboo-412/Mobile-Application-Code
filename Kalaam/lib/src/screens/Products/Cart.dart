// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations
import 'package:kalaam/src/services/Library.dart';

class Cart extends StatefulWidget {
  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  String name;
  PageController pageBannerController = PageController();
  int sliderBannerIndex = 0;
  List show = [false, false, false];
  PageController pageNewsController = PageController();
  int sliderNewsIndex = 0;
  List counter = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  List total = [
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0
  ];
  PageController pageOfferController = PageController();
  int sliderOfferIndex = 0;
  TextEditingController remarks = new TextEditingController();
  bool load = false;
  PageController pageSurveyController = PageController();
  int sliderSurveyIndex = 0;
  bool status = false;
  double subtotal = 0.0;
  bool showSubmit = false;
  int sliderIndex = 0;
  List cartListData = [];
  List news = ['images/news.png', 'images/news.png', 'images/news.png'];
  List offer = ['images/offer.png', 'images/offer.png', 'images/offer.png'];
  int c = 0;
  String selectAttributeId = "";
  String selectAttributeName = "";
  bool isClickButton = false;

  @override
  void initState() {
    super.initState();
    cartList();
    setState(() {
      isNewOrder = false;
    });
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
            title:
//Align(      alignment: Alignment(-12, 0),

                Text(
              "Cart",
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
          bottomNavigationBar: showSubmit == false && load == false
              ? Container(
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
                )
              : load == false
                  ? Container(
                      height: 110,
                      color: Constants.backgroundWhiteColor,
                      child: Padding(
                        padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Home(),
                                        ));
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Continue Shopping",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Constants.greenColor,
                                            fontFamily: "Bliss Pro",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              /*Text(
                    "SUBTOTAL: \$"+ subtotal.toString(),
                    style: TextStyle(
                      color: Constants.greyTextColor,
                      fontSize: 14,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.12,
                    ),
                  ),
                 */

                              GestureDetector(
                                onTap: () {
                                  showCustomDialog(context);
                                  //orderProceed();
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
                                        "Submit Request",
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
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
          body: Container(
            color: Constants.backgroundWhiteColor,
            child: Stack(
              children: [
                //  load == true ? LoadingTransProgress("") : SizedBox(),

                itemCount == 0 && load == false
                    ? Padding(
                        padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                        child: Container(
                          child: Column(children: [
                            SizedBox(
                              height: 100,
                            ),
                            Image.asset("images/cartE.png"),
                            Text(
                              "No Product in Cart.",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 25,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]),
                        ),
                      )
                    : SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                          child: Container(
                            //height: cartListData.length*150.0,

                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                // This next line does the trick.

                                itemCount: cartListData.length,
                                itemBuilder: (context, index) {
                                  return cartCard(
                                      cartListData[index], index, cartListData);
                                }),
                          ),
                        ),
                    ),
                load == true
                    ? SizedBox(
                        width: mediaQueryWidth,
                        height: mediaQueryHeight,
                        child: Center(child: LoadingHome()),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cartCard(Map data, int index, List cartList) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    counter[index] = int.parse(data["qty"].toString());
    total[index] =
        counter[index] * double.parse(data["product_price"].toString());

    int k = counter[index];

    return Column(
      children: [
        Container(
          width: mediaQueryWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: mediaQueryWidth * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0x19898a8d),
                          width: 1,
                        ),
                        color: Colors.white,
                      ),
                      child: data["product_web_img"] == "" ||
                              data["product_web_img"] == null ||
                              data["product_web_img"].toString() == "null"
                          ? Image.asset("images/aws.png")
                          : Image.network(
                              WebApis.SERVER_URL + data["product_app_img"],
                            ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: mediaQueryWidth * 0.48,
                          child: Text(
                            data["product_name"],
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  counter[index] = counter[index] - 1;
                                  c--;
                                  total[index] = counter[index] *
                                      double.parse(
                                          data["product_price"].toString());

                                  sub();
                                  updateCart(
                                      data["id"], counter[index].toString());
                                });
                              },
                              child: Container(
                                width: 32,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Color(0xcc1c201d),
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "-",
                                    textScaleFactor: 1.0,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xcc1c201d),
                                      fontSize: 16,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 32,
                              height: 24,
                              child: Center(
                                child: Text(
                                  counter[index].toString(),
                                  textScaleFactor: 1.0,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xcc1c201d),
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  counter[index] = counter[index] + 1;
                                  c++;
                                  total[index] = counter[index] *
                                      double.parse(
                                          data["product_price"].toString());
                                  sub();
                                  updateCart(
                                      data["id"], counter[index].toString());
                                });
                              },
                              child: Container(
                                width: 32,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Color(0xcc1c201d),
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "+",
                                    textScaleFactor: 1.0,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xcc1c201d),
                                      fontSize: 16,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomWidgets.checkValidString(data["attribute_name"])
                            ? SizedBox(
                                height: 10,
                              )
                            : SizedBox(),
                        CustomWidgets.checkValidString(data["attribute_name"])
                            ? SizedBox(
                                width: mediaQueryWidth * 0.48,
                                child: Text(
                                  "Product Varient : " + data["attribute_name"],
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
              SizedBox(width: mediaQueryWidth * 0.025),
              GestureDetector(
                onTap: () {
                  showDeleteDialog(context, data["id"]);
                },
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset("images/bin.png"),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 1,
          color: Constants.greySliderColor,
          width: mediaQueryWidth,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Future<void> cartList() async {
    setState(() {
      load = true;
    });

    //cartListData.clear();

    var enc = await encryptData({
      "user_id": userId,
    });
    var dataSignUp = await cartListAPI(enc);

    if (dataSignUp["RETURN_FLAG"] == true) {
      //WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        subtotal = 0.0;
        showSubmit = false;

        cartListData = dataSignUp["RETURN_DATA"];

        if (cartListData.length == 0) {
          subtotal = 0.0;
          showSubmit = false;
        }

        for (int i = 0; i < cartListData.length; i++) {
          showSubmit = true;

          subtotal = subtotal +
              (double.parse(cartListData[i]["product_price"].toString()) *
                  double.parse(cartListData[i]["qty"].toString()));
        }
      });
    } else {
      setState(() {
        subtotal = 0.0;
        // showSubmit =false;
        showSubmit = false;

        if (cartListData.length == 0) {
          subtotal = 0.0;
          showSubmit = false;
        }

        itemCount = 0;
        load = false;
      });
      //WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }

    setState(() {
      load = false;
    });
  }

  void orderProceed() async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({"user_id": userId, "comments": remarks.text});
    var dataSignUp = await orderProceedAPI(enc);

    if (dataSignUp["RETURN_FLAG"] == true) {
      setState(() {
        isNewOrder = true;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Orders(),
          ));
    } else {
      //WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }

    setState(() {
      isClickButton = false;
      load = false;
    });
  }

  void cartDelete(String cartId) async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({
      "user_id": userId,
      "cart_id": cartId,
    });
    var dataSignUp = await deleteCartAPI(enc);

    if (dataSignUp["RETURN_FLAG"] == true) {
      setState(() {
        cartList();
      });

      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    } else {
      setState(() {
        cartList();
      });
      //WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }

    setState(() {
      load = false;
    });
  }

  void addCart(String proID, String qty) async {
    setState(() {
      load = true;
    });
    var enc = await encryptData({
      "user_id": userId,
      "product_id": proID,
      "qty": qty,
      "attribute_id": selectAttributeId,
      "attribute_name": selectAttributeName
    });
    var dataSignUp = await addToCartAPI(enc);

    if (dataSignUp["RETURN_FLAG"] == true) {
      //WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    } else {
      //WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }

    setState(() {
      load = false;
    });
  }

  void sub() {
    setState(() {
      subtotal = 0.0;
      for (int k = 0; k < total.length; k++) {
        subtotal = subtotal + total[k];
      }
    });
  }

  void updateCart(String cartID, String qty) async {
    setState(() {
      load = true;
    });
    var enc = await encryptData({
      "cart_id": cartID,
      "qty": qty,
    });
    var dataSignUp = await updateToCartAPI(enc);

    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      cartList();
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }

  showCustomDialog(BuildContext context) {
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                // border: Border.all(color: Color(0x19898a8d), width: 1, ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Additional Comments (optional)",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            color: Constants.headingBlackColor,
                            fontSize: 18,
                            fontFamily: "Bliss Pro"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: remarks,
                      onChanged: (text) {},
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.sentences,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.toString().trim() == "") {
                          return "Enter Remarks ";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        counterText: "",
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Constants.greySliderColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Constants.greySliderColor),
                        ),
                        contentPadding: EdgeInsets.all(0.0),
                        labelStyle: TextStyle(
                          color: Constants.labelTextColor,
                          fontSize: 16,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w500,
                        ),
                        labelText: "Remarks",
                        helperStyle: TextStyle(fontSize: 12.0),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (!isClickButton) {
                      setState(() {
                        isClickButton = true;
                        load = true;
                      });

                      orderProceed();
                      Navigator.pop(context);
                    }
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
                          "Submit",
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
  }

  showDeleteDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Delete",textScaleFactor: 1.0,),
        content: Text("Do you want to delete cart item.",textScaleFactor: 1.0,),
        actions: [
          TextButton(
            onPressed: () {
              cartDelete(id);
              Navigator.pop(context);
            },
            child: Text(
              "Ok",
              style: TextStyle(
                color: Constants.greenColor,
                fontSize: 16,
                fontFamily: "Bliss Pro",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Constants.headingBlackColor,
                  fontSize: 16,
                  fontFamily: "Bliss Pro",
                  fontWeight: FontWeight.w500,
                ),
              )),
        ],
      ),
    );
  }
}
