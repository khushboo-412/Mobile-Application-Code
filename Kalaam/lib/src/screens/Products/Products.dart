// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps

import 'package:kalaam/src/services/Library.dart';


class Products extends StatefulWidget {
  var catID;
  var subCatID;
  Products(this.catID, this.subCatID);
  @override
  ProductsState createState() => ProductsState(this.catID, this.subCatID);
}

class ProductsState extends State<Products> {
  var catID;
  var subCatID;
  ProductsState(this.catID, this.subCatID);
  String name;
  PageController pageBannerController = PageController();
  int sliderBannerIndex = 0;
  List show = [false, false, false];
  PageController pageNewsController = PageController();
  int sliderNewsIndex = 0;
  List counter = [];
  PageController pageOfferController = PageController();
  int sliderOfferIndex = 0;
  double total = 0.0;
  int c = 0;

  bool load = false;
  PageController pageSurveyController = PageController();
  int sliderSurveyIndex = 0;
  bool status = false;
  int sliderIndex = 0;
  List productDataList = [];
  List cartDataList = [];
  List news = ['images/news.png', 'images/news.png', 'images/news.png'];
  List offer = ['images/offer.png', 'images/offer.png', 'images/offer.png'];
  bool loadtrans = false;
  @override
  void initState() {
    super.initState();
    productsList();
    cartList();
    isNewOrder = false;
    productCount = 0;
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
        onWillPop: () async{
          Navigator.pop(context);
          return true;
          // return Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (BuildContext context) => CategoryList(),
          //     ));
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (BuildContext context) => CategoryList(),
                  //     ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Constants.headingBlackColor,
                )),
            title:
//Align(      alignment: Alignment(-12, 0),

                Text(
              "Products",
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
            actions: [
              itemCount == 0
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Cart(),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
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
                      child: Padding(
                        padding: const EdgeInsets.all(15),
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
                    ),
            ],
          ),

/*
          appBar: AppBar(

            backgroundColor: Constants.backgroundWhiteColor,
            iconTheme: IconThemeData(color: Colors.black),
leading: SizedBox(),
            titleSpacing: 0,

            title:
//Align(      alignment: Alignment(-12, 0),

            Container(
              width: mediaQueryWidth,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.translate(
                    offset: Offset(-50, 0),
                    child: Container(
                      width: mediaQueryWidth*0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.greyButtonColor,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Icon(Icons.search, color: Constants.greyButtonTextColor,),
                            SizedBox(width: 4),
                            Text(
                              "Search",
                              style: TextStyle(
                                color: Color(0x4c1c201d),
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),


                  c==0?GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Cart(),
                          ));
                    },
                    child:    Container(
                      color: Colors.transparent,
                      child: Transform.translate(
                        offset: Offset(-30, 0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Cart(),
                                ));
                          },
                          child: Container(
                              width: 25,
                              height: 25,
                              color: Colors.transparent,

                              child: Image.asset("images/cart.png",)),
                        ),
                      ),
                    ),
                  ):GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Cart(),
                          ));
                    },
                    child:                     Transform.translate(
                      offset: Offset(-30, 0),
                      child: Container(
                        width: 30,
                        height: 28,
                        child: Stack(
                          children:[Positioned.fill(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Image.asset("images/cart.png",)
                              ),
                            ),),
                            Positioned.fill(
                              left: mediaQueryWidth*0.03,
                              child: Align(
                                alignment: Alignment.topRight,
                                child:Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,

                                    color: Color(0xff3fbd50),
                                  ),
                                  child:  Center(
                                    child: Text(
                                      c.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),),],
                        ),
                      ),
                    ),

                  ),


                ],
              ),
            ),

            elevation: 3,



          ),
*/
          bottomNavigationBar: AppBarWidget.bottomBarProduct(context, "1"),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  color: Constants.backgroundWhiteColor,
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(8,8,15,8),
                      //   child: Container(
                      //     width: mediaQueryWidth,
                      //
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         GestureDetector(
                      //             onTap: (){
                      //               Navigator.push(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                     builder: (BuildContext context) =>
                      //                         CategoryList(),
                      //                   ));                },
                      //             child: Icon(Icons.arrow_back_ios, color: Constants.headingBlackColor,)),
                      //         Container(
                      //           width: mediaQueryWidth*0.7,
                      //           // decoration: BoxDecoration(
                      //           //   borderRadius: BorderRadius.circular(10),
                      //           //   color: Constants.greyButtonColor,
                      //           // ),
                      //           //
                      //           // child: Padding(
                      //           //   padding: const EdgeInsets.all(8),
                      //           //   child: Row(
                      //           //     mainAxisSize: MainAxisSize.min,
                      //           //     mainAxisAlignment: MainAxisAlignment.start,
                      //           //     crossAxisAlignment: CrossAxisAlignment.center,
                      //           //     children:[
                      //           //       Icon(Icons.search, color: Constants.greyButtonTextColor,),
                      //           //       SizedBox(width: 4),
                      //           //       Text(
                      //           //         "Search",
                      //           //         style: TextStyle(
                      //           //           color: Color(0x4c1c201d),
                      //           //           fontSize: 16,
                      //           //           fontFamily: "Bliss Pro",
                      //           //           fontWeight: FontWeight.w500,
                      //           //         ),
                      //           //       ),
                      //           //
                      //           //     ],
                      //           //   ),
                      //           // ),
                      //         ),
                      //
                      //
                      //         itemCount==0?GestureDetector(
                      //           onTap: (){
                      //             Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                   builder: (BuildContext context) =>
                      //                       Cart(),
                      //                 ));
                      //           },
                      //           child:    Container(
                      //             color: Colors.transparent,
                      //             child: GestureDetector(
                      //               onTap: (){
                      //                 Navigator.push(
                      //                     context,
                      //                     MaterialPageRoute(
                      //                       builder: (BuildContext context) =>
                      //                           Cart(),
                      //                     ));
                      //               },
                      //               child: Container(
                      //                   width: 25,
                      //                   height: 25,
                      //                   color: Colors.transparent,
                      //
                      //                   child: Image.asset("images/cart.png",)),
                      //             ),
                      //           ),
                      //         ):GestureDetector(
                      //           onTap: (){
                      //             Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                   builder: (BuildContext context) =>
                      //                       Cart(),
                      //                 ));
                      //           },
                      //           child:                     Container(
                      //             width: 30,
                      //             height: 28,
                      //             child: Stack(
                      //               children:[Positioned.fill(
                      //                 child: Align(
                      //                   alignment: Alignment.topLeft,
                      //                   child: Container(
                      //                       width: 25,
                      //                       height: 25,
                      //                       child: Image.asset("images/cart.png",)
                      //                   ),
                      //                 ),),
                      //                 Positioned.fill(
                      //                   left: mediaQueryWidth*0.03,
                      //                   child: Align(
                      //                     alignment: Alignment.topRight,
                      //                     child:Container(
                      //                       width: 15,
                      //                       height: 15,
                      //                       decoration: BoxDecoration(
                      //                         shape: BoxShape.circle,
                      //
                      //                         color: Color(0xff3fbd50),
                      //                       ),
                      //                       child:  Center(
                      //                         child: Text(
                      //                           itemCount.toString(),
                      //                           style: TextStyle(
                      //                             color: Colors.white,
                      //                             fontSize: 10,
                      //                             fontFamily: "Roboto",
                      //                             fontWeight: FontWeight.w500,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),),],
                      //             ),
                      //           ),
                      //
                      //         ),
                      //
                      //
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Container(height: 1.5,color: Constants.greySliderColor,),
                      productDataList.length == 0
                          ? Container(
                              child: Column(children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Image.asset("images/proE.png"),
                                Text(
                                  "No Product Available.",
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
                            )
                          :

                      itemCount == 0?Padding(
                      padding: EdgeInsets.all(mediaQueryWidth * 0.04),
        child: Container(
         // height: mediaQueryHeight*0.57,

          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              // This next line does the trick.

              itemCount: productDataList.length,
              itemBuilder: (context, index) {
                return cartCard(productDataList[index],
                    index, productDataList);
              }),
        ),
      ):Padding(
                              padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                              child: Container(
                                 height: mediaQueryHeight*0.57,

                                child: ListView.builder(
                                    shrinkWrap: true,
                                    //physics: NeverScrollableScrollPhysics(),
                                    // This next line does the trick.

                                    itemCount: productDataList.length,
                                    itemBuilder: (context, index) {
                                      return cartCard(productDataList[index],
                                          index, productDataList);
                                    }),
                              ),
                            ),
                    ],
                  ),
                ),
                load == true ? LoadingProgress(" ") : SizedBox(),
                loadtrans == true ? LoadingTransProgress(" ") : SizedBox(),
/*
                itemCount==0?SizedBox() :GestureDetector(

                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Cart(),
                        ));
                  },
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(15,mediaQueryHeight*0.77,15,15),
                    child: Container(
                      width: mediaQueryWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: Color(0xfff4f4f4),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children:[
                            Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                  productCount.toString()+" Product | ${itemCount} Items",
                                  style: TextStyle(
                                    color: Color(0xcc1c201d),
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Total Amount: \$"+priceCount.toString(),
                                  style: TextStyle(
                                    color: Color(0xcc1c201d),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            Text(
                              "View Cart",
                              style: TextStyle(
                                color: Color(0xff00a817),
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
*/
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: itemCount == 0
              ? SizedBox()
              : Container(
                  height: 130,
                  color: Constants.backgroundWhiteColor,
                  width: mediaQueryWidth,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      height: 120,
                      color: Constants.backgroundWhiteColor,
                      width: mediaQueryWidth,
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: mediaQueryWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Color(0xfff4f4f4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Cart(),
                                          ));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productCount.toString() +
                                                  " Product | ${itemCount} Items",
                                                  textScaleFactor: 1.0,
                                              style: TextStyle(
                                                color: Color(0xcc1c201d),
                                                fontSize: 16,
                                                fontFamily:
                                                    "Bliss Pro",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            /*Text(
                                              "Total Amount: \$" +
                                                  priceCount.toString(),
                                              style: TextStyle(
                                                color: Color(0xcc1c201d),
                                                fontSize: 12,
                                              ),
                                            ),*/
                                          ],
                                        ),
                                        Text(
                                          "View Cart",
                                          textScaleFactor: 1.0,
                                          style: TextStyle(
                                            color: Constants.greenColor,
                                            fontSize: 16,
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
                                  Text(
                                    "---------------------------------------------------------------------------------------------------",
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Constants.greySliderColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CategoryList(),
                                          ));
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      width: mediaQueryWidth,
                                      height: 20,
                                      child: Center(
                                        child: Text(
                                          "Continue Shopping",
                                          textScaleFactor: 1.0,
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
                                ],
                              ),
                            ),
                          )),
                    ), //child widget inside this button
                    shape:
                        BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                ),
        ),
      ),
    );
  }

/*Widget cartOldCard()
{final mediaQueryHeight = MediaQuery.of(context).size.height;
final mediaQueryWidth = MediaQuery.of(context).size.width;
  return Container(
    width: mediaQueryWidth,
    height: 160,
    child: Stack(
      children:[

        Positioned.fill(
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: mediaQueryWidth,
            height: 130,
            decoration: BoxDecoration(
              color: Constants.backgroundWhiteColor,

              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0x19898a8d), width: 1, ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x0c101828),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                GestureDetector(
                  onTap: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProductDetails(data),
                        ));
                  },
                  child: Container(
                    height: double.infinity,
                    color: Constants.backgroundWhiteColor,
                    padding: const EdgeInsets.symmetric(vertical: 10, ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Container(
                          width: 120,
                          height: 71.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image.asset("images/aws.png"),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                        "Amazon web services",
                        style: TextStyle(
                          color: Constants.headingBlackColor,
                          fontSize: 16,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "\$500.00",
                        style: TextStyle(
                          color: Constants.headingBlackColor,
                          fontSize: 20,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        Positioned(
          left: mediaQueryWidth*0.75,
          top: 110,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color:                           Constants.greenColor,
                width: 1, ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x0c000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              color: Colors.white,
            ),

            child: Padding(child:
Image.asset("images/cartG.png"), padding: EdgeInsets.all(8),
            ),          ),
        ),],
    ),
  );
}*/

  Widget cartCard(Map data, int index, List dataList) {
    int k = counter[index];
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                  
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProductDetails(data, counter[index]),
                        ));
                  },
                  child: Container(
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
                    child: data["product_web_img"] == "" ||
                            data["product_web_img"] == null ||
                            data["product_web_img"].toString() == "null"
                        ? Image.asset("images/aws.png")
                        : Image.network(
                            WebApis.SERVER_URL + data["product_app_img"],
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                SizedBox(width: 24),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ProductDetails(data, counter[index]),
                            ));
                      },
                      child: SizedBox(
                        width: mediaQueryWidth * 0.5,
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
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (BuildContext context) =>
                    //               ProductDetails(data, counter[index]),
                    //         ));
                    //   },
                    //   child: Text(
                    //     "\$" + data["product_price"],
                    //     style: TextStyle(
                    //       color: Constants.headingBlackColor,
                    //       fontSize: 20,
                    //       fontFamily: "Bliss Pro",
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 16),
                    k == 0
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                counter[index] = counter[index] + 1;
                                c++;

                                total = counter[index] *
                                    double.parse(
                                        data["product_price"].toString());
                                addCart(data["product_id"], c.toString());
                                cartList();
                              });
                            },
                            child: Container(
                              width: 48,
                              height: 34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.27),
                                color: Constants.backgroundWhiteColor,
                                border: Border.all(
                                  color: Constants.greenColor,
                                  width: 0.91,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x0c000000),
                                    blurRadius: 3.64,
                                    offset: Offset(0, 3.64),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Container(
                                  width: 20,
                                  height: 22.67,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset("images/cartG.png"),
                                ),
                              ),
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                        total = counter[index] *
                                            double.parse(data["product_price"]
                                                .toString());
                                        addCart(
                                            data["product_id"], c.toString());
                                        cartList();
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
                                            fontFamily: "Work Sans",
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
                                        total = counter[index] *
                                            double.parse(data["product_price"]
                                                .toString());
                                        addCart(
                                            data["product_id"], c.toString());
                                        cartList();
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
                              SizedBox(height: 12),
                            /*  Text(
                                "\$${data["product_price"]} x ${counter[index]} = \$" +
                                    total.toString(),
                                style: TextStyle(
                                  color: Color(0x991c201d),
                                  fontSize: 12,
                                ),
                              ),*/
                            ],
                          ),
                  ],
                ),
              ],
            ),
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

  Future<void> productsList() async {
    setState(() {
      load = true;
    });
    var enc = await encryptData({
      "user_id": userId,
      "CATEGORY_ID": catID,
      "SUB_CATEGORY_ID": subCatID,
    });
    var dataSignUp = await product(enc);
   
    if (dataSignUp["RETURN_FLAG"] == true) {
      // WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        productDataList = dataSignUp["RETURN_DATA"];
      });
     

      for (int k = 0; k < productDataList.length; k++) {
        setState(() {
          counter.add(0);
        });
      }
    } else {
      // WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }

    setState(() {
      load = false;
    });
  }

  void addCart(String proID, String qty) async {
    setState(() {
      loadtrans = true;
    });
    var enc = await encryptData({
      "user_id": userId,
      "product_id": proID,
      "qty": qty,
    });
    var dataSignUp = await addToCartAPI(enc);
   
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }
    cartList();

    setState(() {
      loadtrans = false;
    });
  }

  void updateCart(String cartID, String qty) async {
    setState(() {
      loadtrans = true;
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
      loadtrans = false;
    });
  }

  Future<void> cartList() async {
    setState(() {
      itemCount = 0;
      priceCount = 0.0;
      loadtrans = true;
    });
   
    var enc = await encryptData({
      "user_id": userId,
    });
    var dataSignUp = await cartListAPI(enc);
  
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        itemCount = 0;
        priceCount = 0.0;
        cartDataList = dataSignUp["RETURN_DATA"];
        for (int i = 0; i < cartDataList.length; i++) {
          itemCount = itemCount + int.parse(cartDataList[i]['qty'].toString());
          priceCount = priceCount +
              (
//    int.parse(cartDataList[i]['qty'].toString())*
                  double.parse(cartDataList[i]['amount'].toString()));
        }

        productCount = cartDataList.length;
      });

     
    } else {
      //WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }

    setState(() {
      loadtrans = false;
    });
  }
}
