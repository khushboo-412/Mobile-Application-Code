// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use
import 'package:kalaam/src/services/Library.dart';

class NewsDetails extends StatefulWidget {
  @override
  NewsDetailsState createState() => NewsDetailsState();
}
class NewsDetailsState extends State<NewsDetails> {
  String name;
  PageController pageBannerController = PageController();
  int sliderBannerIndex = 0;
  List show = [false,false,false,false,false,false,false,false,false,false,false];
  PageController pageNewsController = PageController();
  int sliderNewsIndex = 0;

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
  List showText = [false];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
       top: false,
        bottom: false,
      child: new Scaffold(
        appBar: AppBar(

          backgroundColor: Constants.backgroundWhiteColor,
          iconTheme: IconThemeData(color: Colors.black),
          leading: GestureDetector(
              onTap: (){

              },
              child: Icon(Icons.arrow_back_ios, color: Constants.headingBlackColor,)),
          title:
//Align(      alignment: Alignment(-12, 0),

          Text(
            "Kalam Telecom awarded global ISO 27001 for information security management.",
           textScaleFactor: 1.0,
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
          child: Container(
            color: Constants.backgroundWhiteColor,
            child: Padding(
              padding: EdgeInsets.all(mediaQueryWidth*0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    width: mediaQueryWidth,
                    child: Text(
                      "Kalam Telecom awarded global ISO 27001 for information security management.",
                     textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Color(0xe51c201d),
                        fontSize: 20,
                        fontFamily:  "Bliss Pro",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: mediaQueryWidth,
                    child: Text(
                      "Feb 22, 2022 - Bahrain",
                     textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Color(0x991c201d),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                      width: mediaQueryWidth,
                      height: mediaQueryWidth*0.7,
                      /* decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0c000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),*/
                      child: Image.asset("images/new2.png")
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: mediaQueryWidth,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum maecenas quis risus massa consectetur aliquet feugiat diam. Ultrices ut tempus at facilisi ac vivamus nunc amet, egestas.\n\nUllamcorper purus interdum sit vitae massa. Lorem justo enim feugiat massa massa ultricies enim maecenas. Proin porttitor dui mus sagittis mattis egestas. Quis arcu ultricies varius mattis diam egestas. Parturient dui donec diam laoreet massa. Turpis sagittis vestibulum faucibus suspendisse proin ut. Sed pulvinar ante fermentum neque, eget.\n\nAugue orci, malesuada nec eget sed. Dignissim viverra hac enim accumsan. Molestie congue ac blandit ullamcorper cras. Malesuada diam diam et etiam id lectus. Id commodo nisl vitae eu nisl tortor, vitae facilisis dui.",
                     textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Color(0xb21c201d),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                      width: mediaQueryWidth,
                      height: mediaQueryWidth*0.7,
                     /* decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0c000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),*/
                      child: Image.asset("images/new2.png")
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: mediaQueryWidth,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum maecenas quis risus massa consectetur aliquet feugiat diam. Ultrices ut tempus at facilisi ac vivamus nunc amet, egestas.\n\nUllamcorper purus interdum sit vitae massa. Lorem justo enim feugiat massa massa ultricies enim maecenas. Proin porttitor dui mus sagittis mattis egestas. Quis arcu ultricies varius mattis diam egestas. Parturient dui donec diam laoreet massa. Turpis sagittis vestibulum faucibus suspendisse proin ut. Sed pulvinar ante fermentum neque, eget.\n\nAugue orci, malesuada nec eget sed. Dignissim viverra hac enim accumsan. Molestie congue ac blandit ullamcorper cras. Malesuada diam diam et etiam id lectus. Id commodo nisl vitae eu nisl tortor, vitae facilisis dui.",
                     textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Color(0xb21c201d),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }









}

