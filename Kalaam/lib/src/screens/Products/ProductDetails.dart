// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations
import 'package:kalaam/src/services/Library.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductDetails extends StatefulWidget {
  var productData;
  int count;
  ProductDetails(this.productData, this.count);
  @override
  ProductDetailsState createState() =>
      ProductDetailsState(this.productData, this.count);
}

class ProductDetailsState extends State<ProductDetails> {
  String name;
  var productData;
  int count;

  ProductDetailsState(this.productData, this.count);
  PageController pageDetailController = PageController();
  int sliderDetailIndex = 0;
  bool status = false;
  int c = 1;
  List cartDataList = [];
  bool load = false;
  int selectData = -1;
  String selectAttributeId = "";
  String selectAttributeName = "";
  @override
  void initState() {
    super.initState();
    cartList();
    //c = count;
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
          Navigator.pop(context);
          return;
        },
        child: new Scaffold(
          drawer: Drawer(
            child: DrawerClass(),
          ),
          appBar: AppBar(
            backgroundColor: Constants.backgroundWhiteColor,
            iconTheme: IconThemeData(color: Colors.black),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Constants.headingBlackColor,
                )),
            title:


                Container(
              width: mediaQueryWidth * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: mediaQueryWidth * 0.65,
                    child: Text(
                      productData["product_name"],
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.headingBlackColor,
                        fontSize: 16,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  itemCount == 0
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Cart(),
                                ));
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => Cart(),
                                    ));
                              },
                              child: Container(
                                  width: 25,
                                  height: 25,
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    "images/cart.png",
                                  )),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Cart(),
                                ));
                          },
                          child: Container(
                            width: 30,
                            height: 28,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        child: Image.asset(
                                          "images/cart.png",
                                        )),
                                  ),
                                ),
                                Positioned.fill(
                                  left: mediaQueryWidth * 0.03,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff3fbd50),
                                      ),
                                      child: Center(
                                        child: Text(
                                          itemCount.toString(),
                                          textScaleFactor: 1.0,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontFamily: "Roboto",
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
                  SizedBox(width: 5),
                ],
              ),
            ),
            elevation: 3,
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Constants.backgroundWhiteColor,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                    child: Column(
                      children: [
                        slider([
                          WebApis.SERVER_URL + productData["product_app_img"],
                        ], "detail", pageDetailController,
                            MediaQuery.of(context).size.height * 0.25),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: mediaQueryWidth,
                          child: Text(
                            productData["product_name"],
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: Color(0xcc1c201d),
                              fontSize: 16,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*SizedBox(
                              child: Text(
                                "\$" + productData["product_price"],
                                style: TextStyle(
                                  color: Color(0xff1c201d),
                                  fontSize: 20,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),*/
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (c < 1) {
                                      } else {
                                        c--;
                                        // itemCount--;
                                      }
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
                                      c.toString(),
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
                                      if (c >=
                                          int.parse(productData["product_stock"]
                                              .toString())) {
                                        WebResponseExtractor.showToast(
                                            "Reached Stock Limit");
                                      } else {
                                        c++;
                                        // itemCount++;
                                      }
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
                                          fontFamily: "Work Sans",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        productData['product_attribute'].length > 0
                            ? SizedBox(
                                width: mediaQueryWidth,
                                child: Text(
                                  "Product Variant",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: Color(0xcc1c201d),
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        Container(
                          width: mediaQueryWidth,
                          child: Wrap(
                              children: List.generate(
                                  productData['product_attribute'].length,
                                  (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectData = index;
                                  selectAttributeId =
                                      productData['product_attribute'][index]
                                          ['id'];
                                  selectAttributeName =
                                      productData['product_attribute'][index]
                                          ['name'];
                                });
                              },
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 20,
                                        child: Radio(
                                            value: index,
                                            groupValue: selectData,
                                            onChanged: (value) {
                                              setState(() {
                                                selectData = index;
                                                selectAttributeId = productData[
                                                            'product_attribute']
                                                        [index]['id']
                                                    .toString();
                                                selectAttributeName =
                                                    productData[
                                                            'product_attribute']
                                                        [index]['name'];
                                              });
                                            }),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Html(data:
                                            productData['product_attribute']
                                                [index]['name']),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                           
                            if (productData['product_attribute'].isNotEmpty) {
                              if (selectData != -1) {
                                addCart(
                                    productData["product_id"], c.toString());
                              } else {
                                WebResponseExtractor.showToast(
                                    "Please select product variant.");
                              }
                            } else {
                              addCart(productData["product_id"], c.toString());
                            }
                          },
                          child: Container(
                            width: mediaQueryWidth,
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Constants.greenColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 62,
                              vertical: 8,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Add to cart",
                                  textScaleFactor: 1.0,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xfffafafa),
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: mediaQueryWidth,
                    height: 3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Constants.greySliderColor,
                        width: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                    child: Container(
                      width: mediaQueryWidth,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: mediaQueryWidth,
                            child: Text(
                              "Product Description",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Color(0xcc1c201d),
                                fontSize: 14,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: mediaQueryWidth,
                            child: Text(
                              productData["product_desc"],
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Color(0x991c201d),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: mediaQueryWidth,
                      height: 1,
                      color: Constants.greySliderColor),

/*
                  Padding(
                    padding: EdgeInsets.all(mediaQueryWidth*0.04),
                    child: Container(
                      width: mediaQueryWidth,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          SizedBox(
                            width: mediaQueryWidth,
                            child: Text(
                              "Why Kalaam for Microsoft 365?",
                              style: TextStyle(
                                color: Color(0xcc1c201d),
                                fontSize: 14,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left:15),
                            child: SizedBox(
                              width: mediaQueryWidth,
                              child: Text(
                                "•  Connectivity\n•  Certified\n•  Regional presence\n•  Localized Support",
                                style: TextStyle(
                                  color: Color(0x991c201d),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),



                  ),
*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget slider(
      List data, String type, PageController pageController, double height) {
    return Column(
      children: [
        introBuilder(data, type, pageController, height),
        SizedBox(
          height: 20,
        ),
        data.length == 1 ? SizedBox() : pageIndicator(type, data),
      ],
    );
  }

  Widget pageIndicator(String type, List data) {
    int k = sliderDetailIndex;

    return Container(
        width: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < data.length; i++)
              i == k
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      height: 8,
                      width: 48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Constants.greenColor, Constants.greenColor],
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
                          colors: [
                            Constants.greySliderColor,
                            Constants.greySliderColor
                          ],
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
          ],
        ));
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
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      itemCount = int.parse(qty.toString());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Cart(),
          ));
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }

  Widget introBuilder(List introData, String data,
      PageController pageController, double height) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemCount: introData.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Image.network(
              introData[index],
            ),
          );
        },
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            sliderDetailIndex = index;
            
          });
          //            Navigator.of(context).pushReplacementNamed('/intro');
        },
      ),
    );
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
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }

  Future<void> cartList() async {
    setState(() {
      itemCount = 0;
      priceCount = 0.0;

      load = true;
    });
  
    var enc = await encryptData({
      "user_id": userId,
    });
    var dataSignUp = await cartListAPI(enc);
   
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        cartDataList = dataSignUp["RETURN_DATA"];
        for (int i = 0; i < cartDataList.length; i++) {
          itemCount = itemCount + int.parse(cartDataList[i]['qty'].toString());
          priceCount = priceCount +
              (
                  //     int.parse(cartDataList[i]['qty'].toString())*
                  double.parse(cartDataList[i]['amount'].toString()));
        }

        productCount = cartDataList.length;
      });
     
    } else {
      //WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }
}
