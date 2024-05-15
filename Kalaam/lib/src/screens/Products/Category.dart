// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations
import 'package:kalaam/src/services/Library.dart';

class CategoryList extends StatefulWidget {
  @override
  CategoryListState createState() => CategoryListState();
}
class CategoryListState extends State<CategoryList> {
  String name;
  bool loadtrans = false;

  String catId = "";
  String subCatId = "";
  PageController pageBannerController = PageController();
  int sliderBannerIndex = 0;
  List show = [];
  PageController pageNewsController = PageController();
  int sliderNewsIndex = 0;
  List counter = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
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

  List newsList = [];
  List offersList = [];
  List subCatList = [];
  bool load = false;

  @override
  void initState() {
    super.initState();

    for(int i = 0;i<1000;i++){
      show.add(false);
      subCatList.add([]);
    }
imageList();



  }
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
       top: false,
        bottom: false,

      child:  WillPopScope(
        onWillPop: () {
          return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    Home(),
              ));
        },
        child: new Scaffold(
          bottomNavigationBar: AppBarWidget.bottomBarProduct(context, "1"),


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
              "Categories",
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
            child: Stack(
              children:[
                Container(
                  color: Constants.backgroundWhiteColor,
                  child: Padding(
                    padding: EdgeInsets.all(mediaQueryWidth*0.04),
                    child:  Container(
                      //height: catList.length*200.0,

                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          // This next line does the trick.

                          itemCount: catList.length,
                          itemBuilder: (context, index) {
                            return category(catList[index], index, catList);
                          }),
                    ),
                  ),

                ),


                load == true?LoadingProgress(""):SizedBox(),
                loadtrans == true?LoadingTransProgress(""):SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> imageList () async {
    setState(() {
      load =true;
    });


    catList = await categoryGet();
    for(int k =0;k<catList.length;k++) {
      setState(() {
        show.add(false);
       

       
        subCatList[k]= (catList[k]['sub_category']);
        
      });
    }
    setState(() {
      load =false;
    });
  }


  Widget categoryList(Map data, int index, List subList)
  {    final mediaQueryWidth = MediaQuery.of(context).size.width;

  return


      GestureDetector(
        onTap: (){
          setState(() {
            subCatId = data["ID_NO"];

          });
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    Products(catId, subCatId),
              ));
        },


        child: Container(
          width:mediaQueryWidth ,
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


                      child: Image.network(WebApis.SERVER_URL + data["IMAGE_PATH"]),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      data["NAME"],
                      textScaleFactor: 1.0,
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
              Container(height: 1, color: Constants.greyButtonColor,),




            ],
          ),
        ),
      );
  }

  Widget category(Map data, int index, List catlist)

  {

    List sub = [];
    sub = subCatList[index];
   
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Column(
      children:[

        GestureDetector(
          onTap: (){
            setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Products(catId, ""),
                  ));
              show[index] = !show[index];
              catId = data["ID_NO"];

              for(int i = 0;i<show.length;i++){
                if (i==index){

                }
                else{
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
                        child: Image.network(WebApis.SERVER_URL+ data['IMAGE_PATH']),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: mediaQueryWidth*0.6,
                            child: Text(
                              data["NAME"],
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Constants.headingBlackColor,
                                fontSize: 16,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            width: mediaQueryWidth*0.6,
                            child: Text(
                              data["DESCRIPTION"],
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Constants.greyTextColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                  SizedBox(width: 15,)
                  /*    show[index] == false? Icon(Icons.keyboard_arrow_right,  color: Constants.greenColor, size: 18,):
                      Icon(Icons.keyboard_arrow_down_rounded,  color: Constants.greenColor, size: 18,)*/
                    ],
                  ),
                  SizedBox(height: 10,),

                  show[index] == true? SizedBox():  Container(height: 1, color: Constants.greyButtonColor,),


                ],
              ),
            ),
          ),
        ),

        show[index] == true && sub.length != 0? Container(
          //height: subCatList.length*60.0,
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              // This next line does the trick.

              itemCount: sub.length,
              itemBuilder: (context, index) {
                return categoryList(sub[index], index, sub);
              }),
        ): SizedBox(),

      ],
    );
  }

/*
  Widget category(Map data, int index, List catlist)

  {
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Column(
      children:[

        GestureDetector(
          onTap: (){
            setState(() {
              show[index] = !show[index];
              catId = data["ID_NO"];
              if( show[index]==true){
                subCatList.clear();

                //showSubList = subCatList.length;
                subCategory(data["ID_NO"]);}
              else{
                //
              }
              for(int i = 0;i<show.length;i++){
                if (i==index){

                }
                else{
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
                        child: Image.network(WebApis.SERVER_URL+ data['IMAGE_PATH']),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: mediaQueryWidth*0.6,
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
                          SizedBox(height: 10,),
                          SizedBox(
                            width: mediaQueryWidth*0.6,
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
                      show[index] == false? Icon(Icons.keyboard_arrow_right,  color: Constants.greenColor, size: 18,):
                      Icon(Icons.keyboard_arrow_down_rounded,  color: Constants.greenColor, size: 18,)
                    ],
                  ),
                  SizedBox(height: 10,),

                  show[index] == true? SizedBox():  Container(height: 1, color: Constants.greyButtonColor,),


                ],
              ),
            ),
          ),
        ),

        show[index] == true? Container(
          //height: subCatList.length*60.0,
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              // This next line does the trick.

              itemCount: subCatList.length,
              itemBuilder: (context, index) {
                return categoryList(subCatList[index], index, subCatList);
              }),
        ): SizedBox(),

      ],
    );
  }*/

  void subCategory(String id) async{


    setState(() {
      loadtrans = true;
    });
    var enc = await encryptData({

      "category_id": id,



    });
    var dataSignUp = await subCat(enc);
   
    if(dataSignUp["RETURN_FLAG"]==true){

      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        subCatList = dataSignUp["RETURN_DATA"];

      });
    }
    else{
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);

    }

    setState(() {
      loadtrans = false;
    });
  }



}

