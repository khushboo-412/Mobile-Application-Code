// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, missing_required_param, unnecessary_brace_in_string_interps, sort_child_properties_last, deprecated_member_use, library_private_types_in_public_api
import 'package:kalaam/src/services/Library.dart';
import 'package:kalaam/src/screens/Bills/Bills.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String name;
  LoopPageController  pageBannerController = LoopPageController ();
  int sliderBannerIndex = 0;
  List show = [];
  String amt = "";
  bool done = false;
  LoopPageController  pageNewsController = LoopPageController ();
  int sliderNewsIndex = 0;
  bool load = true;
  LoopPageController  pageOfferController = LoopPageController ();
  int sliderOfferIndex = 0;

  LoopPageController  pageSurveyController = LoopPageController ();
  int sliderSurveyIndex = 0;
  bool status = false;
  int sliderIndex = 0;
  String catId = "";
  String subCatId = "";
  List banner = ['images/banner.png', 'images/banner.png', 'images/banner.png'];
  List bannerList = [];
  List productDataList = [];
  List surveyList = [];
  List newsList = [];
  List offersList = [];
  List counter = [];
  List subCatList = [];
  List news = ['images/news.png', 'images/news.png', 'images/news.png'];
  List offer = ['images/offer.png', 'images/offer.png', 'images/offer.png'];
  List cartDataList = [];
  double total = 0.0;
  int c = 0;
  int showSubList = 0;
  int cartCount = 0;
  ScrollController _controller;
  bool showCart = true;
  List<bool> showData = [];
  int selectIndex = 0;
  bool isClickCategory = false;
  bool isClickCategory1 = false;
  bool isClickCategory2 = false;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();

    for (int i = 0; i < 1000; i++) {
      show.add(false);
      subCatList.add([]);
    }
    surveyBox();
    cartList();

    setState(() {
      accountDetails = false;

      catList.clear();
    });
    dashboard();



  }

  void payerData() async {
    setState(() {
      //load = true;
    });

    var enc = await encryptData({"resource": "Payers", "keyword": userEmail});
    var dataAPI = await customerBillsAPI(enc);
    

    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        payersList = dataAPI['RETURN_DATA'];

        for(int i =0;i<payersList.length;i++){
          show.add(false);
        }
       
        if(payersList.length==0){}else{
        payID = payersList[0]['internalid'];
        payerName= payersList[0]['name'];
        //billsData(payersList[0]['internalid']);
        }
       // getservicesCategoryFromWeb();
        //payerId = dataAPI['RETURN_DATA'][0]['internalid'];
        //payerName = dataAPI['RETURN_DATA'][0]['name'];
        //linesData();
      });
    } else {
      setState(() {
        load = false;
      });
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
    }
    setState(() {
      load = false;
    });
  }
  void billsData(String id) async {
    setState(() {
     // load = true;

    });

    var enc =
    await encryptData({"resource": "Transactions", "keyword": id});
    var dataAPI = await customerBillsAPI(enc);
   

    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);

      bills = dataAPI["RETURN_DATA"];
     

      for (int i = 0; i < bills.length; i++) {
        show.add(false);
        if (bills[i]["status"] == "Deposited") {
          history.add(bills[i]);
        } else {
          invoice.add(bills[i]);
        }
      }
      

      setState(() {
        pageLen =  history.length > invoice.length ? history.length:invoice.length;

      });
    } else {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        load = false;
      });
    }
    setState(() {
      load = false;
    });
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
     
      setState(() {
        if (_controller.offset > 0.0) {
          showCart = false;
        }
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
     
      setState(() {
        if (_controller.offset == 0.0) {
          showCart = true;
        }
      });
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
          return Common.canGoBack();
        },
        child: new Scaffold(
          drawer: Drawer(
            child: DrawerClass(),
          ),
          appBar: AppBar(
            backgroundColor: Constants.backgroundWhiteColor,
            iconTheme: IconThemeData(color: Colors.black),
            title:
//Align(      alignment: Alignment(-12, 0),

                Container(
              // width: mediaQueryWidth*0.8,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: mediaQueryWidth * 0.5,
                    child: Text(
                      "Home",
                      //  textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.headingBlackColor,
                        fontSize: 16,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  /* Transform.translate(
                    offset: Offset(-20, 0),
                    child: Container(
                      width: mediaQueryWidth*0.5,
                     */ /* decoration: BoxDecoration(
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
                      ),*/ /*
                    ),
                  ),*/

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Notifications(),
                          ));
                    },
                    child: Container(
                        width: 25,
                        height: 25,
                        child: Image.asset(
                          "images/bell.png",
                        )),
                  ),
                  cartCount == 0
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
                                          cartCount.toString(),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => AccountDetails(),
                          ));
                    },
                    child: Container(
                      width: 22,
                      height: 22,
                      child: Image.asset(
                        "images/user.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            elevation: 3,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: itemCount>0 && showCart == true  && done == true
              ?  Container(
                  height: 80,
                  color: Colors.transparent,
                  width: mediaQueryWidth,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      height: 65,
                      color:Colors.transparent,
                      width: mediaQueryWidth,
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: mediaQueryWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Constants.greySliderColor,
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
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
                                              style: TextStyle(
                                                color: Color(0xcc1c201d),
                                                fontSize: 16,
                                                fontFamily:
                                                    "Bliss Pro",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
/*
                                            Text(
                                              "Total Amount: \$" +
                                                  priceCount.toString(),
                                              style: TextStyle(
                                                color: Color(0xcc1c201d),
                                                fontSize: 12,
                                              ),
                                            ),
*/
                                          ],
                                        ),
                                        Text(
                                          "View Cart",
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
                                  /*  SizedBox(height: 10,),
                            Text(
                              "---------------------------------------------------------------------------------------------------",
                              maxLines: 1,
                              style: TextStyle(
                                color: Constants.greySliderColor,
                                fontSize: 13,
                              ),
                            ),

                            SizedBox(height: 5,),
                            GestureDetector(
                              onTap: (){Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CategoryList(),
                                  )); },
                              child: Container(
                                color: Colors.transparent,
                                width: mediaQueryWidth,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    "Continue Shopping",
                                    style: TextStyle(
                                      color: Constants.greenColor,
                                      fontSize: 16,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),*/
                                ],
                              ),
                            ),
                          )),
                    ), //child widget inside this button
                    shape:
                        BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                ):SizedBox()
              ,
          bottomNavigationBar: AppBarWidget.bottomBar(context, "1"),
          body: RefreshIndicator(
            color: Constants.greenColor,
            onRefresh: () {
              return Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Home()),
                      (route) => false);
                });

                // showing snackbar
              });
            },
            child: Stack(
              children: [
                Container(
                  width: mediaQueryWidth,
                  height: mediaQueryHeight,
                  color: Constants.backgroundWhiteColor,
                  child: Padding(
                    padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      controller: _controller,
                      children: [
                        Container(
                          width: mediaQueryWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                             boxShadow: [
            BoxShadow(
                color: Constants.greySliderColor,
                blurRadius: 4,
                offset: Offset(0, 0),
            ),],
                              color: Constants.whiteText),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    amt==""?
                                        Row(children: [
                                          Text(
                                            "Outstanding Amount: ",
                                            style: TextStyle(
                                              color: Constants.amberColor,
                                              fontSize: 16,
                                              fontFamily: "Bliss Pro",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Constants.amberColor,
                                              strokeWidth: 2.0,


                                            ),
                                          ),


                                        ],)

                                        : Text(
                                      "Outstanding Amount: "+amt.toString() + " BHD",
                                      style: TextStyle(
                                        color: Constants.amberColor,
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                           Bills(),
                                            ));
                                      },
                                      child: Text(
                                        "Quick Pay",
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
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        status == false
                            ? slider(bannerList, "banner", pageBannerController,
                                MediaQuery.of(context).size.height * 0.28)
                            : userCard(),
                        SizedBox(
                          height: 20,
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
                            width: mediaQueryWidth,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                    color: Constants.headingBlackColor,
                                    fontSize: 18,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
/*
                                Text(
                                  "View All",
                                  style: TextStyle(
                                    color: Constants.greenColor,
                                    fontSize: 12,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
*/
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        catList.length == 0
                            ? SizedBox()
                            : Column(
                              children: [

                                Container(
                                  width: mediaQueryWidth,

                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: List.generate(3, (index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectIndex = index;
                                            isClickCategory = true;
                                            isClickCategory1 = false;
                                            isClickCategory2 = false;
                                            _toggle(index);
                                          });
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10,
                                                bottom:
                                                showData[index] ? 0 : 0),
                                            child:Stack(
                                              alignment:Alignment.bottomCenter,
                                              children: [
                                                Container(
                                                  width: mediaQueryWidth*0.3,
                                                  height: mediaQueryWidth*0.35,
                                                  decoration: BoxDecoration(
                                                   boxShadow: [
            BoxShadow(
                color: Constants.greySliderColor,
                blurRadius: 4,
                offset: Offset(0, 0),
            ),],
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(10),
                                                        topRight:
                                                        Radius.circular(
                                                            10),
                                                        bottomLeft:
                                                        Radius.circular(
                                                            showData[
                                                            index]
                                                                ? 0
                                                                : 10),
                                                        bottomRight:
                                                        Radius.circular(
                                                            showData[
                                                            index]
                                                                ? 0
                                                                : 10)),
                                                    //   border: Border.all(color: showData[index] ? Color(0xff50a700) : Color(0x19898a8d), width: 1, ),
                                                    border: Border(
                                                      left: BorderSide(
                                                        color: showData[index] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),

                                                      top: BorderSide(
                                                        color: showData[index] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),
                                                      right: BorderSide(
                                                        //                    <--- top side
                                                        color: showData[index] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),
                                                      bottom:  BorderSide(
                                                        color: showData[index] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),
                                                    ),

                                                    color: Colors.white,
                                                  ),
                                                  padding:
                                                  const EdgeInsets.all(0),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        width: 65,
                                                        height: 65,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                            image:
                                                            DecorationImage(
                                                              image: NetworkImage(WebApis
                                                                  .SERVER_URL +
                                                                  catList[index][
                                                                  'IMAGE_PATH']),
                                                            )),
                                                      ),
                                                      SizedBox(height: 5),
                                                      SizedBox(


                                                        child: Text(
                                                          "${catList[index]['NAME']}",
                                                          maxLines:3,
                                                          textAlign: TextAlign.center, style: TextStyle(
                                                            color:
                                                            Color(0xcc181b19),
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                showData[index] ?Container(
                                                  width: mediaQueryWidth*0.3,
                                                  height: 1,
                                                  //color: Colors.white,
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      left: BorderSide(
                                                        color: Color(0xff50a700) , width: 1,
                                                      ),

                                                      right: BorderSide(
                                                        color: Color(0xff50a700) , width: 1,
                                                      ),


                                                    ),

                                                    color: Colors.white,
                                                  ),

                                                ) : SizedBox(),
                                              ],
                                            )),
                                      );
                                    }),
                                  ),
                                ),
                                isClickCategory ? Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    width: mediaQueryWidth,
                                    child: Row(
                                      mainAxisAlignment: selectIndex==0?MainAxisAlignment.start:
                                      selectIndex==2? MainAxisAlignment.end:MainAxisAlignment.center ,
                                      children: [
                                        SizedBox(width:  selectIndex == 0 ? 1:0,),
                                        selectIndex == 0 ?
                                        Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: Container(
                                    width: mediaQueryWidth*0.3,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          border: Border(
                                            left: BorderSide(
                                              color: Color(0xff50a700) , width: 1,
                                            ),

                                            right: BorderSide(
                                              color: Color(0xff50a700) , width: 1,
                                            ),


                                          ),

                                          color: Colors.white,
                                      ),
                                    ),
                                        ) :
                                        SizedBox(
                                          width: mediaQueryWidth*0.3,
                                        ),
                                       selectIndex == 1 ? Container(
                                         width: mediaQueryWidth*0.3,
                                         height: 10,

                                         decoration: BoxDecoration(


                                           border: Border(
                                             left: BorderSide(
                                               color:  Color(0xff50a700), width: 1,
                                             ),


                                             right: BorderSide(

                                               color: Color(0xff50a700), width: 1,
                                             ),


                                           ),

                                           color: Colors.white,
                                         ),
                                       ) :
                                       SizedBox(width: mediaQueryWidth*0.3,),
                                       selectIndex == 2 ? Container(
                                          width: mediaQueryWidth*0.3,
                                          height: 10,

                                          decoration: BoxDecoration(

                                            border: Border(
                                              left: BorderSide(
                                                color:  Color(0xff50a700) , width: 1,
                                              ),


                                              right: BorderSide(

                                                color:  Color(0xff50a700) , width: 1,
                                              ),

                                            ),

                                            color: Colors.white,
                                          ),
                                        ) :  SizedBox(width: mediaQueryWidth*0.3,),
                                        SizedBox(width:  selectIndex == 2 ? 1:0,),

                                      ],
                                    ),
                                  ),
                                ) : SizedBox(),
                                isClickCategory ?   Stack(
                                  children: [

                                    subCategoryWidget(catList,catList[selectIndex]['data_type'] == "subcategory" ?
                                    catList[selectIndex]['sub_category'] : catList[selectIndex]['product'], selectIndex,mediaQueryWidth),
                                    Row(
                                      mainAxisAlignment: selectIndex==0?MainAxisAlignment.start:
                                      selectIndex==2? MainAxisAlignment.end:MainAxisAlignment.center ,
                                      children: [
                                        Container(
                                          width: selectIndex == 0 ?
                                              mediaQueryWidth*0.3:mediaQueryWidth*0.25,
                                          height: 1,
                                          //margin: EdgeInsets.only(left: selectIndex != 0  ? 7 : 0),
                                          color: selectIndex == 0 ? Colors.white : Color(0xff50a700),

                                        ),
                                        Container(
                                          width: selectIndex == 1 ?
                                          mediaQueryWidth*0.3:mediaQueryWidth*0.25,
                                          height: 1,
                                          color: selectIndex == 1 ? Colors.white : Color(0xff50a700),
                                        ),
                                        Container(
                                          width:selectIndex == 2 ?
                                          mediaQueryWidth*0.3:mediaQueryWidth*0.25,
                                          height: 1,
                                          //margin: EdgeInsets.only(right: selectIndex != 2 ? 7 : 0),
                                          color: selectIndex == 2 ? Colors.white : Color(0xff50a700),
                                        ),
                                      ],
                                    ),
                                  ],
                                ) : Container(),
                              ],
                            ),
                        catList.length > 3
                            ? Column(
                          children: [

                            Container(
                              width: mediaQueryWidth,

                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: List.generate(3, (index) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectIndex = index + 3;
                                            isClickCategory = false;
                                            isClickCategory1 = true;
                                            isClickCategory2 = false;

                                            _toggle(index + 3);
                                          });
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10,
                                               ),
                                            child:Stack(
                                              alignment:Alignment.bottomCenter,
                                              children: [
                                                Container(
                                                  width: mediaQueryWidth*0.3,
                                                  height: mediaQueryWidth*0.35,
                                                  decoration: BoxDecoration(
                                                   boxShadow: [
            BoxShadow(
                color: Constants.greySliderColor,
                blurRadius: 4,
                offset: Offset(0, 0),
            ),],
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(10),
                                                        topRight:
                                                        Radius.circular(
                                                            10),
                                                        bottomLeft:
                                                        Radius.circular(
                                                            showData[
                                                            index + 3]
                                                                ? 0
                                                                : 10),
                                                        bottomRight:
                                                        Radius.circular(
                                                            showData[
                                                            index + 3]
                                                                ? 0
                                                                : 10)),
                                                    //   border: Border.all(color: showData[index] ? Color(0xff50a700) : Color(0x19898a8d), width: 1, ),
                                                    border: Border(
                                                      left: BorderSide(
                                                        color: showData[index + 3] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),

                                                      top: BorderSide(
                                                        color: showData[index + 3] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),
                                                      right: BorderSide(

                                                        color: showData[index + 3] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),
                                                      bottom: BorderSide(
                                                        color: showData[index + 3] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),
                                                    ),

                                                    color: Colors.white,
                                                  ),
                                                  padding:
                                                  const EdgeInsets.all(12),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        width: 65,
                                                        height: 65,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                            image:
                                                            DecorationImage(
                                                              image: NetworkImage(WebApis
                                                                  .SERVER_URL +
                                                                  catList[index + 3][
                                                                  'IMAGE_PATH']),
                                                            )),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        "${catList[index + 3]['NAME']}", maxLines:3,
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color:
                                                          Color(0xcc181b19),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                showData[index + 3] ?Container(
                                                  width: mediaQueryWidth*0.3,
                                                  height: 1,
                                                  //color: Colors.white,
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      left: BorderSide(
                                                        color: Color(0xff50a700) , width: 1,
                                                      ),

                                                      right: BorderSide(
                                                        color: Color(0xff50a700) , width: 1,
                                                      ),


                                                    ),

                                                    color: Colors.white,
                                                  ),

                                                ): SizedBox(),
                                              ],
                                            )),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                            isClickCategory1 ? Container(
                              width: mediaQueryWidth,


                              child: Row(
                                mainAxisAlignment: selectIndex==3?MainAxisAlignment.start:
                                selectIndex==5? MainAxisAlignment.end:MainAxisAlignment.center ,
                                children: [                                        SizedBox(width:  selectIndex == 3 ? 2:0,),

                                  selectIndex == 3 ? Container(
                                    width: mediaQueryWidth*0.3,
                                    height: 10,
                                    decoration: BoxDecoration(


                                      border: Border(
                                        left: BorderSide(
                                          color: Color(0xff50a700) , width: 1,
                                        ),


                                        right: BorderSide(

                                          color: Color(0xff50a700) , width: 1,
                                        ),


                                      ),

                                      color: Colors.white,
                                    ),
                                  ) :
                                  SizedBox(
                                    width: mediaQueryWidth*0.3,
                                  ),
                                  selectIndex == 4 ? Container(
                                    width: mediaQueryWidth*0.3,
                                    height: 10,

                                    decoration: BoxDecoration(


                                      border: Border(
                                        left: BorderSide(
                                          color:  Color(0xff50a700), width: 1,
                                        ),


                                        right: BorderSide(

                                          color: Color(0xff50a700), width: 1,
                                        ),


                                      ),

                                      color: Colors.white,
                                    ),
                                  ) :
                                  SizedBox(width: mediaQueryWidth*0.3,),
                                  selectIndex == 5 ? Container(
                                    width: mediaQueryWidth*0.3,
                                    height: 10,

                                    decoration: BoxDecoration(

                                      border: Border(
                                        left: BorderSide(
                                          color:  Color(0xff50a700) , width: 1,
                                        ),


                                        right: BorderSide(

                                          color:  Color(0xff50a700) , width: 1,
                                        ),

                                      ),

                                      color: Colors.white,
                                    ),
                                  ) :  SizedBox(width: mediaQueryWidth*0.3,),
                                  SizedBox(width:  selectIndex == 5 ? 2:0,),
                                ],
                              ),
                            ) : SizedBox(),
                            isClickCategory1 ?   Stack(
                              children: [
                                subCategoryWidget(catList,catList[selectIndex]['data_type'] == "subcategory" ? catList[selectIndex]['sub_category'] : catList[selectIndex]['product'], selectIndex,mediaQueryWidth),
                                Row(
                                  mainAxisAlignment: selectIndex==3?MainAxisAlignment.start:
                                  selectIndex==5? MainAxisAlignment.end:MainAxisAlignment.center ,
                                  children: [
                                    Container(
                                      width: selectIndex == 3?
                                      mediaQueryWidth*0.3:mediaQueryWidth*0.25,
                                      height: 1,
                                      //margin: EdgeInsets.only(left: selectIndex != 0  ? 7 : 0),
                                      color: selectIndex == 3 ? Colors.white : Color(0xff50a700),

                                    ),
                                    Container(
                                      width: selectIndex == 4 ?
                                      mediaQueryWidth*0.3:mediaQueryWidth*0.25,
                                      height: 1,
                                      color: selectIndex == 4 ? Colors.white : Color(0xff50a700),
                                    ),
                                    Container(
                                      width:selectIndex == 5 ?
                                      mediaQueryWidth*0.3:mediaQueryWidth*0.25,
                                      height: 1,
                                      //margin: EdgeInsets.only(right: selectIndex != 2 ? 7 : 0),
                                      color: selectIndex == 5 ? Colors.white : Color(0xff50a700),
                                    ),
                                  ],
                                ),                              ],
                            ) : Container(),
                          ],
                        )
                            : SizedBox(),

                        catList.length > 6
                            ? Column(
                          children: [

                            Container(
                              width: mediaQueryWidth,

                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: List.generate(3, (index) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectIndex = index + 6;
                                            isClickCategory = false;
                                            isClickCategory1 = false;
                                            isClickCategory2 = true;

                                            _toggle(index + 6);
                                          });
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10,
                                                bottom:
                                                showData[index + 6] ? 0 : 0),
                                            child:Stack(
                                              alignment:Alignment.bottomCenter,
                                              children: [
                                                Container(
                                                  width: mediaQueryWidth*0.3,
                                                  height: mediaQueryWidth*0.35,
                                                  decoration: BoxDecoration(
                                                   boxShadow: [
            BoxShadow(
                color: Constants.greyButtonColor,
                blurRadius: 4,
                offset: Offset(0, 0),
            ),],
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(10),
                                                        topRight:
                                                        Radius.circular(
                                                            10),
                                                        bottomLeft:
                                                        Radius.circular(
                                                            showData[
                                                            index + 6]
                                                                ? 0
                                                                : 10),
                                                        bottomRight:
                                                        Radius.circular(
                                                            showData[
                                                            index + 6]
                                                                ? 0
                                                                : 10)),
                                                    //   border: Border.all(color: showData[index] ? Color(0xff50a700) : Color(0x19898a8d), width: 1, ),
                                                    border: Border(
                                                      left: BorderSide(
                                                        color: showData[index + 6] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),

                                                      top: BorderSide(
                                                        color: showData[index + 6] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),
                                                      right: BorderSide(

                                                        color: showData[index + 6] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),
                                                      bottom: BorderSide(
                                                        color: showData[index + 6] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
                                                      ),
                                                    ),

                                                    color: Colors .white,
                                                  ),
                                                  padding:
                                                  const EdgeInsets.all(12),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        width: 65,
                                                        height: 65,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                            image:
                                                            DecorationImage(
                                                              image: NetworkImage(WebApis
                                                                  .SERVER_URL +
                                                                  catList[index + 6][
                                                                  'IMAGE_PATH']),
                                                            )),
                                                      ),
                                                      SizedBox(height: 5),
                                                      SizedBox(
                                                        //height:50,

                                                        child: Center(
                                                          child: Text(
                                                            "${catList[index + 6]['NAME']}",
                                                            maxLines:3,
                                                            textAlign: TextAlign.center,

                                                            style: TextStyle(

                                                              color:
                                                              Color(0xcc181b19),
                                                              overflow: TextOverflow
                                                                  .ellipsis,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                showData[index + 6] ? Container(
                                                  width: mediaQueryWidth*0.3,
                                                  height: 1,
                                                  //color: Colors.white,
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      left: BorderSide(
                                                        color: Color(0xff50a700) , width: 1,
                                                      ),

                                                      right: BorderSide(
                                                        color: Color(0xff50a700) , width: 1,
                                                      ),


                                                    ),

                                                    color: Colors.white,
                                                  ),

                                                ) : SizedBox(),
                                              ],
                                            )),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                            isClickCategory2 ? Container(
                              width: mediaQueryWidth,


                              child: Row(
                                mainAxisAlignment: selectIndex==6?MainAxisAlignment.start:
                                selectIndex==8? MainAxisAlignment.end:MainAxisAlignment.center ,
                                children: [                                  SizedBox(width:  selectIndex == 6 ? 1:0,),

                                  selectIndex == 6 ? Container(
                                    width: mediaQueryWidth*0.3,
                                    height: 10,
                                    decoration: BoxDecoration(


                                      border: Border(
                                        left: BorderSide(
                                          color: Color(0xff50a700) , width: 1,
                                        ),


                                        right: BorderSide(

                                          color: Color(0xff50a700) , width: 1,
                                        ),


                                      ),

                                      color: Colors.white,
                                    ),
                                  ) :
                                  SizedBox(
                                    width: mediaQueryWidth*0.3,
                                  ),
                                  selectIndex == 7 ? Container(
                                    width: mediaQueryWidth*0.3,
                                    height: 10,

                                    decoration: BoxDecoration(


                                      border: Border(
                                        left: BorderSide(
                                          color:  Color(0xff50a700), width: 1,
                                        ),


                                        right: BorderSide(

                                          color: Color(0xff50a700), width: 1,
                                        ),


                                      ),

                                      color: Colors.white,
                                    ),
                                  ) :
                                  SizedBox(width: mediaQueryWidth*0.3,),
                                  selectIndex == 8 ? Container(
                                    width: mediaQueryWidth*0.3,
                                    height: 10,

                                    decoration: BoxDecoration(

                                      border: Border(
                                        left: BorderSide(
                                          color:  Color(0xff50a700) , width: 1,
                                        ),


                                        right: BorderSide(

                                          color:  Color(0xff50a700) , width: 1,
                                        ),

                                      ),

                                      color: Colors.white,
                                    ),
                                  ) :  SizedBox(width: mediaQueryWidth*0.3,),
                                  SizedBox(width:  selectIndex == 8 ? 1:0,),
                                ],
                              ),
                            ) : SizedBox(),
                            isClickCategory2 ?   Stack(
                              children: [

                                subCategoryWidget(catList,catList[selectIndex]['data_type'] == "subcategory" ? catList[selectIndex]['sub_category'] : catList[selectIndex]['product'], selectIndex,mediaQueryWidth),
                                Row(
                                  mainAxisAlignment: selectIndex==6?MainAxisAlignment.start:
                                  selectIndex==8? MainAxisAlignment.end:MainAxisAlignment.center ,
                                  children: [
                                    Container(
                                      width: selectIndex == 6 ?
                                      mediaQueryWidth*0.3:mediaQueryWidth*0.25,
                                      height: 1,
                                      //margin: EdgeInsets.only(left: selectIndex != 0  ? 7 : 0),
                                      color: selectIndex == 6 ? Colors.white : Color(0xff50a700),

                                    ),
                                    Container(
                                      width: selectIndex == 7 ?
                                      mediaQueryWidth*0.3:mediaQueryWidth*0.25,
                                      height: 1,
                                      color: selectIndex == 7 ? Colors.white : Color(0xff50a700),
                                    ),
                                    Container(
                                      width:selectIndex == 8 ?
                                      mediaQueryWidth*0.3:mediaQueryWidth*0.25,
                                      height: 1,
                                      //margin: EdgeInsets.only(right: selectIndex != 2 ? 7 : 0),
                                      color: selectIndex == 8 ? Colors.white : Color(0xff50a700),
                                    ),
                                  ],
                                ),                              ],
                            ) : Container(),
                          ],
                        ) : SizedBox(),

                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Featured Products",
                          style: TextStyle(
                            color: Constants.headingBlackColor,
                            fontSize: 18,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          //  height: productDataList.length*150.0,
                          height: 230,

                          child: ListView.builder(
                              shrinkWrap: true,
                              //physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,

                              // This next line does the trick.

                              itemCount: productDataList.length > 10
                                  ? 10
                                  : productDataList.length,
                              itemBuilder: (context, index) {
                                return productImage(productDataList[index],
                                    index, productDataList);
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Offers",
                          style: TextStyle(
                            color: Constants.headingBlackColor,
                            fontSize: 18,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        slider(offersList, "offer", pageOfferController,
                            MediaQuery.of(context).size.height * 0.28),
                        SizedBox(
                          height: 20,
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
                              width: mediaQueryWidth,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Surveys",
                                    style: TextStyle(
                                      color: Constants.headingBlackColor,
                                      fontSize: 18,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  Text(
                                    "View All",
                                    style: TextStyle(
                                      color: Constants.greenColor,
                                      fontSize: 12,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          */
                        /*
                    status==true?survey(pageSurveyController, MediaQuery.of(context).size.height * 0.2)
                        :surveyUser(pageSurveyController, MediaQuery.of(context).size.height * 0.15)*/
                        /*
                          survey(pageSurveyController, MediaQuery.of(context).size.height * 0.2),
                          Center(child: pageIndicator("survey", surveyList)),
                          SizedBox(height: 20,),*/
                        /* GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      News(),
                                ));
                          },
                          child: Container(
                            width: mediaQueryWidth,
                            color: Colors.transparent,
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Our News",
                                  style: TextStyle(
                                    color: Constants.headingBlackColor,
                                    fontSize: 18,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Text(
                                  "View All",
                                  style: TextStyle(
                                    color: Constants.greenColor,
                                    fontSize: 12,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),SizedBox(height: 10,),
                        slider(newsList, "news", pageNewsController, MediaQuery.of(context).size.height * 0.25),
                        SizedBox(height: 20,),*/
                        /* GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      CaseStudy(),
                                ));
                          },
                          child: Container(
                            width: mediaQueryWidth,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Case Studies",
                                  style: TextStyle(
                                    color: Constants.headingBlackColor,
                                    fontSize: 18,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Text(
                                  "View All",
                                  style: TextStyle(
                                    color: Constants.greenColor,
                                    fontSize: 12,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                         // height: caseStudyList.length*100.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              // This next line does the trick.

                              itemCount: caseStudyList.length,
                              itemBuilder: (context, index) {
                                return caseStudy(caseStudyList[index], index, caseStudyList);
                              }),
                        ),*/
                     
                      ],
                    ),
                  ),
                ),
                load == true ? LoadingHome() : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> surveyBox() async {
    setState(() {
      //load = true;
    });
   

    var enc = await encryptData({
      // "survey_status": "NEW_ACTIVATION",
      "user_id": userId
    });
    var dataSignUp = await surveyTriggerGet(enc);

   
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
                          style: TextStyle(fontSize: 15),
                          collapseOnTextTap: true,
                          mentionStyle: TextStyle(
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
                            ),
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
                          isNewTicket = false;
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
                          isNewTicket = false;
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
    //  load = false;
    });
  }

  Future<void> imageList() async {
    setState(() {
     // load = true;
    });

    ticketStatus = await ticketStatusGet();

   
    setState(() {
     // load = false;
    });
  }

  Widget productImage(Map data, int index, List dataList) {
    int k = counter[index];
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Container(
                width: 125,
                height: 125,
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
          ),
          SizedBox(height: 5),
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
                  width: 125,
                  height: 50,
                  child: Text(
                    data["product_name"],
                    maxLines: 3,
                    style: TextStyle(
                      color: Constants.headingBlackColor,
                      fontSize: 14,
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
              //       fontSize: 18,
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
                              double.parse(data["product_price"].toString());
                          addCart(
                              data["product_id"], counter[index].toString());
                          // updateCart(data["product_id"], counter[index].toString());

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
                                      double.parse(
                                          data["product_price"].toString());
                                  addCart(data["product_id"],
                                      counter[index].toString());
                                  //  updateCart(data["product_id"], counter[index].toString());

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
                                      double.parse(
                                          data["product_price"].toString());
                                  addCart(data["product_id"],
                                      counter[index].toString());
                                  // updateCart(data["product_id"], counter[index].toString());

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
                        /* SizedBox(height: 12),
                Text(
                  "\$${data["product_price"]} x ${counter[index]} = \$"+ total.toString(),
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
    );
  }

  Widget userCard() {
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          width: mediaQueryWidth,
          height: 159,
          child: Container(
            width: mediaQueryWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Color(0x0c101828),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff00a438), Color(0xff54ae32)],
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Text(
                                    "Account Details",
                                    style: TextStyle(
                                      color: Color(0xe5fafafa),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "BHD",
                                  style: TextStyle(
                                    color: Color(0xe5fafafa),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Mahmood Hamid Salmaan",
                                  style: TextStyle(
                                    color: Color(0xfffafafa),
                                    fontSize: 20,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Constants.whiteText,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            "-------------------------------------------------------------------------",
                            style: TextStyle(color: Constants.whiteText),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CPR NO.",
                            style: TextStyle(
                              color: Color(0xe5fafafa),
                              fontSize: 12,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.72,
                            ),
                          ),
                          Text(
                            "831204206",
                            style: TextStyle(
                              color: Color(0xfffafafa),
                              fontSize: 16,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CPR EXPIRY",
                            style: TextStyle(
                              color: Color(0xe5fafafa),
                              fontSize: 12,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.72,
                            ),
                          ),
                          Text(
                            "07/06/22",
                            style: TextStyle(
                              color: Color(0xfffafafa),
                              fontSize: 16,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: mediaQueryWidth * 0.58,
              height: 174,
              child: Stack(
                children: [
                  Container(
                    width: mediaQueryWidth * 0.58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0x19d78b10),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                            radius: 80,
                            lineWidth: 2.0,
                            percent: 0.2,
                            backgroundColor: Constants.greySliderColor,
                            center: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Constants.amberColor,
                              ),
                              child: Center(
                                  child: Text(
                                "2",
                                style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 28,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                            ),
                            linearGradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: <Color>[
                                  Constants.amberColor,
                                  Constants.amberColor
                                ]),
                            rotateLinearGradient: true,
                            circularStrokeCap: CircularStrokeCap.round),
                        SizedBox(height: 8),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Payments Pending",
                              style: TextStyle(
                                color: Constants.amberColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Total Amount Due: 2000\$",
                              style: TextStyle(
                                color: Constants.amberColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: mediaQueryWidth * 0.52,
                    top: 8,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset("images/dollar.png"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: mediaQueryWidth * 0.32,
              height: 174,
              child: Stack(
                children: [
                  Container(
                    width: mediaQueryWidth * 0.32,
                    height: 174,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0x1900a817),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "10",
                          style: TextStyle(
                            color: Color(0x99007510),
                            fontSize: 28,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Services",
                          style: TextStyle(
                            color: Color(0x99007510),
                            fontSize: 16,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 86,
                    top: 8,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset("images/des.png"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget categoryList(Map data, int index, List subList) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        subCatId = data["ID_NO"];

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Products(catId, subCatId),
            ));
      },
      child: Container(
        width: mediaQueryWidth,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    child:
                        Image.network(WebApis.SERVER_URL + data["IMAGE_PATH"]),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    data["NAME"],
                    style: TextStyle(
                      color: Constants.greyTextColor,
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              color: Constants.greyButtonColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget caseStudy(Map data, int i, List caseList) {
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: mediaQueryWidth * 0.8,
                  child: Text(
                    data["title"],
                    style: TextStyle(
                      color: Constants.headingBlackColor,
                      fontSize: 16,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: mediaQueryWidth * 0.8,
                  child: Text(
                    data["short_desc"],
                    style: TextStyle(
                      color: Constants.greyTextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Constants.greyTextColor,
              size: 18,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          color: Constants.greyButtonColor,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget category(Map data, int index, List catlist) {
    List sub = [];
    sub = subCatList[index];
    
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              show[index] = !show[index];
              catId = data["ID_NO"];

              for (int i = 0; i < show.length; i++) {
                if (i == index) {
                } else {
                  show[i] = false;
                }
              }
            });
          },
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(
                            WebApis.SERVER_URL + data['IMAGE_PATH']),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: mediaQueryWidth * 0.6,
                            child: Text(
                              data["NAME"],
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: mediaQueryWidth * 0.6,
                            child: Text(
                              data["DESCRIPTION"],
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      show[index] == false
                          ? Icon(
                              Icons.keyboard_arrow_right,
                              color: Constants.greenColor,
                              size: 18,
                            )
                          : Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Constants.greenColor,
                              size: 18,
                            )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  show[index] == true
                      ? SizedBox()
                      : Container(
                          height: 1,
                          color: Constants.greyButtonColor,
                        ),
                ],
              ),
            ),
          ),
        ),
        show[index] == true && sub.length != 0
            ? Container(
                //height: subCatList.length*60.0,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // This next line does the trick.

                    itemCount: sub.length,
                    itemBuilder: (context, index) {
                      return categoryList(sub[index], index, sub);
                    }),
              )
            : SizedBox(),
      ],
    );
  }

  Widget pageIndicator(String type, List data) {
    int k = 0;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    if (type == "banner") {
      k = sliderBannerIndex;
    } else if (type == "news") {
      k = sliderNewsIndex;
    } else if (type == "offer") {
      k = sliderOfferIndex;
    } else {
      k = sliderSurveyIndex;
    }
    return Container(
        width: mediaQueryWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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

  void subCategory(String id) async {
    setState(() {
    //  load = true;
    });
    var enc = await encryptData({
      "category_id": id,
    });
    var dataSignUp = await subCat(enc);
    
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        subCatList = dataSignUp["RETURN_DATA"];
      });
    } else {
      // WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }
    setState(() {
    //  load = false;
    });
  }

  Widget introBuilder(List introData, String data,
      LoopPageController  pageController, double height) {
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return           Container(
      width: mediaQueryWidth,

      height: 200,
      // NEW


    child: LoopPageView.builder(

        itemCount: introData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              if(data=="banner"){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          WebBrowser(introData[index]['LINK']),
                    ));
              }
            },
          //  child: ClipRRect(
             // borderRadius: BorderRadius.circular(15),
              child: data == "offer"
                  ? Image.network(
                      WebApis.SERVER_URL + introData[index]["ImageForMobile"],
                      fit: BoxFit.fitWidth,
                    )
                  : Image.network(
                      WebApis.SERVER_URL + introData[index]["MOBILE_IMAGE"],
                fit: BoxFit.fitWidth,
                    ),
           // ),
        )
          ;
        },

        controller: pageController,
//        pageSnapping: false,
        onPageChanged: (index) {
          setState(() {
            if (data == "banner") {
              sliderBannerIndex = index;

            } else if (data == "news") {
              sliderNewsIndex = index;

            } else if (data == "offer") {
              sliderOfferIndex = index;

            }


          });
          //            Navigator.of(context).pushReplacementNamed('/intro');
        },
      ),
    );
  }

  Widget survey(LoopPageController pageController, double height) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: LoopPageView.builder(
        itemCount: surveyList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              launch(surveyList[index]["SurveyLink"]);
            },
            child: Column(
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
                        WebApis.SERVER_URL + surveyList[index]["SurveyImage"],
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
                        Text(
                          surveyList[index]["SurveyName"],
                          maxLines: 1,
                          style: TextStyle(
                            color: Constants.headingBlackColor,
                            fontSize: 14,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            surveyList[index]["SurveyDesc"],
                            style: TextStyle(
                              color: Constants.greyTextColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            sliderSurveyIndex = index;
          });
          //            Navigator.of(context).pushReplacementNamed('/intro');
        },
      ),
    );
  }

  Widget surveyUser(LoopPageController pageController, double height) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: LoopPageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: 285,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0x1900a817),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fill the survey form",
                    style: TextStyle(
                      color: Color(0xb2007510),
                      fontSize: 18,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ipsum dolor sit amet, consectetur.",
                      style: TextStyle(
                        color: Color(0xb2007510),
                        fontSize: 12,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            sliderSurveyIndex = index;
          });
          //            Navigator.of(context).pushReplacementNamed('/intro');
        },
      ),
    );
  }

  Widget slider(
      List data, String type, LoopPageController  pageController, double height) {
    return Column(
      children: [
        introBuilder(data, type, pageController, height),
        SizedBox(
          height: 10,
        ),
        pageIndicator(type, data),
      ],
    );
  }

  void contactUs() async {
    setState(() {
     // load = true;
    });

    var dataAPI = await contactAPI();
   
    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        if (dataAPI["RETURN_DATA"]["support_number"] != "" ||
            dataAPI["RETURN_DATA"]["support_number"] != null) {
          contactNo = dataAPI["RETURN_DATA"]["support_number"];
          privacy = dataAPI["RETURN_DATA"]["privacy_policy"];
          aboutUs = dataAPI["RETURN_DATA"]["aboout_us"];

          showContact = true;
        }
      });
    } else {
      setState(() {
        showContact = false;
      });
      //   WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);

    }
    setState(() {
      load = false;
    });
  }

  Future<void> dashboard() async {
    setState(() {
      load = true;
    });

    out();


    var enc = await encryptData({
      "email": userEmail,

    });
    var dataAPI = await dashboardGet(enc);
   

    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        bannerList = dataAPI["RETURN_DATA"]["banners"];
        offersList = dataAPI["RETURN_DATA"]["offers"];
        
        surveyList = dataAPI["RETURN_DATA"]["surveys"];
        // newsList = await newsBannerGet();
        catList = dataAPI["RETURN_DATA"]["categories"];

       
        for (int i = 0; i < catList.length; i++) {
          showData.add(false);
        }
        for (int k = 0; k < dataAPI["RETURN_DATA"]["categories"].length; k++) {
          setState(() {
            show.add(false);
           
            subCatList[k] =
                (dataAPI["RETURN_DATA"]["categories"][k]['sub_category']);
           
          });
        }
        productsList();
        done =true;
      });
    } else {
      //   WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);

    }

    payerData();
    imageList();
    contactUs();

  }

  Future<void> productsList() async {
    cartList();
    setState(() {
    //  load = true;
    });
    var enc = await encryptData({
      "user_id": userId,
      "CATEGORY_ID": "",
      "SUB_CATEGORY_ID": "",
    });
    var dataSignUp = await product(enc);
    
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        productDataList = dataSignUp["RETURN_DATA"];
      });
      

      for (int k = 0; k < productDataList.length; k++) {
        setState(() {
          counter.add(0);
        });
      }
      for (int k = 0; k < productDataList.length; k++) {
        for (int p = 0; p < cartDataList.length; p++) {
          if (productDataList[k]['product_id'] ==
              cartDataList[p]['product_id']) {
            setState(() {
              counter[k] = int.parse(cartDataList[p]['qty'].toString());
            });
          }
        }
      }
    } else {
      // WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }
   
  }

  void addCart(String proID, String qty) async {
    setState(() {
      //load = true;
    });
    var enc = await encryptData({
      "user_id": userId,
      "product_id": proID,
      "qty": qty,
    });

    var dataSignUp = await addToCartAPI(enc);
    
    if (dataSignUp["RETURN_FLAG"] == true) {
      cartList();
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    } else {
      cartList();
      for (int u = 0; u < cartDataList.length; u++) {
        if (cartDataList[u]['product_id'] == proID) {
          cartDelete(cartDataList[u]['id']);
        }
      }
      cartList();

      //WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }
  }
  void out() async {
    setState(() {
       load = true;
    });
    var enc = await encryptData({
      "email": userEmail,
    });

    var dataSignUp = await outstandingGetAPI(enc);
   
    if (dataSignUp["RETURN_FLAG"] == true) {
      setState(() {
        amt = double.parse(dataSignUp["RETURN_DATA"]['outstanding'].toString()).toStringAsFixed(2);
      });
    } else {


    }
  }

  void cartDelete(String cartId) async {
    setState(() {
      // load = true;
    });
   
    var enc = await encryptData({
      "user_id": userId,
      "cart_id": cartId,
    });
    var dataSignUp = await deleteCartAPI(enc);
   
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }
    cartList();
  }

  void updateCart(String cartID, String qty) async {
    setState(() {
      //load = true;
    });
    var enc = await encryptData({
      "cart_id": cartID,
      "qty": qty,
    });
    var dataSignUp = await updateToCartAPI(enc);
    
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }
    else {
      //   WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }
  }

  Future<void> cartList() async {
    setState(() {
      itemCount = 0;
      priceCount = 0.0;

      // load = true;
    });
    
    var enc = await encryptData({
      "user_id": userId,
    });
    var dataSignUp = await cartListAPI(enc);
   

    if (dataSignUp["RETURN_FLAG"] == true) {
      itemCount = 0;
      priceCount = 0.0;
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        cartDataList = dataSignUp["RETURN_DATA"];
        for (int i = 0; i < cartDataList.length; i++) {
          itemCount = itemCount + int.parse(cartDataList[i]['qty'].toString());
          priceCount = priceCount +
              (
//    int.parse(cartDataList[i]['qty'].toString())*
                  double.parse(cartDataList[i]['amount'].toString()));
        }

        productCount = cartDataList.length;
        cartCount = itemCount;
      });
    }
    else {
      // WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }
    setState(() {
    //  load = false;
    });
  }

  void _toggle(int index) {
    for (int i = 0; i < showData.length; i++) {
      setState(() {
        if (i == index) {
          if(showData[i] == false) {
            showData[i] = !showData[i];
          }
        } else {
          showData[i] = false;
        }
      });
    }
  }

  Widget subCategoryWidget(List<dynamic> listData,List<dynamic> list,index,final mediaQueryWidth){
    return  Container(
      width: mediaQueryWidth,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.only(
            topLeft: Radius
                .circular(selectIndex == 0 || selectIndex == 3 || selectIndex == 6 ? 0 : 10),
            topRight:
            Radius.circular(
                selectIndex == 2  || selectIndex == 5 || selectIndex == 8 ? 0 :  10),
            bottomLeft:
            Radius.circular(
                10),
            bottomRight:
            Radius.circular(
                10)),
        //   border: Border.all(color: showData[index] ? Color(0xff50a700) : Color(0x19898a8d), width: 1, ),
        border: Border(
          left: BorderSide(
            color: showData[selectIndex] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
          ),

          top: BorderSide(
            color: showData[selectIndex] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
          ),
          right: BorderSide(

            color: showData[selectIndex] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
          ),
          bottom: BorderSide(
            color: showData[selectIndex] ? Color(0xff50a700) : Color(0x19898a8d), width: 1,
          ),
        ),
          boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
      blurRadius: 4,
      offset: Offset(0, 5),
    ),],
        color: Colors.white,
      ),
    margin: EdgeInsets.symmetric(horizontal: 1,),
      child: Wrap(

        children: List.generate(list.length, (i) {
          return InkWell(
            onTap: () {
              if(listData[index]['data_type'] == "subcategory") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Products(listData[selectIndex]['ID_NO'],
                              list[i][listData[index]['data_type'] ==
                                  "subcategory"
                                  ? list[i]['ID_NO']
                                  : list[i]['product_id']]),
                    ));
              }
              else
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ProductDetails(list[i],i),
                      ));
                }

            },
            child:  Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
              width: 95,
              //height: 100,
              decoration: BoxDecoration(
             boxShadow: [
            BoxShadow(
              color: Constants.greySliderColor,
                blurRadius: 4,
                offset: Offset(0, 0),
            ),],


                  borderRadius:
                  BorderRadius.circular(10),
                  //   border: Border.all(color: showData[index] ? Color(0xff50a700) : Color(0x19898a8d), width: 1, ),
                  border: Border.all(  color:  Color(0x19898a8d), width: 1,),

                  color: Colors.white,
                ),
                padding:
                const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize:
                  MainAxisSize.max,
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius
                              .circular(8),
                          image:
                          DecorationImage(
                            image: NetworkImage(WebApis
                                .SERVER_URL +
                                list[i][listData[index]['data_type'] == "subcategory" ?
                                'IMAGE_PATH' : 'product_app_img']),
                          )),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 50,
                      child: Text(
                        "${list[i][listData[index]['data_type'] == "subcategory" ? 'NAME' : 'product_name']}",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                          Color(0xcc181b19),
                          overflow: TextOverflow
                              .ellipsis,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
class SizeReportingWidget extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeChange;

  const SizeReportingWidget({
    Key key,
    @required this.child,
    @required this.onSizeChange,
  }) : super(key: key);

  @override
  _SizeReportingWidgetState createState() => _SizeReportingWidgetState();
}

class _SizeReportingWidgetState extends State<SizeReportingWidget> {
  Size _oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    return widget.child;
  }

  void _notifySize() {
    final size = context?.size;
    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeChange(size);
    }
  }
}