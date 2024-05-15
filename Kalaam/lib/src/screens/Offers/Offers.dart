// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use
import 'package:kalaam/src/services/Library.dart';

class Offers extends StatefulWidget {
  const Offers({Key key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  bool load = false;
  List<dynamic> offerList = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
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
              "Offers",
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
            child: Container(
              color: Constants.backgroundWhiteColor,
              child: Padding(
                  padding: EdgeInsets.all(mediaQueryWidth * 0.04),
                  child: Stack(
                    children: [
                      Container(
                        //height: newsList.length*mediaQueryHeight*0.4,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            // This next line does the trick.

                            itemCount: offerList.length,
                            itemBuilder: (context, index) {
                              return offerCard(
                                  offerList[index], index, offerList);
                            }),
                      ),
                      load == true ? LoadingHome() : SizedBox(),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget offerCard(var offerList, int index, List offerList2) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
if(
            offerList["LINK"].toString() =="" ||
            offerList["LINK"].toString() =="null" ||
            offerList["LINK"].toString() == null ){}
else{
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            WebBrowserLong(offerList["LINK"].toString()),
      ));
}






          },
          child: Container(
            color: Colors.transparent,
            width: mediaQueryWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: 84,
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
                        WebApis.SERVER_URL + offerList["ImageForMobile"],
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          color: Constants.greySliderColor,
          width: mediaQueryWidth,
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  void fetchData() async {
    setState(() {
      load = true;
    });

    var dataSignUp = await offerGet();

    
    if (dataSignUp["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
      setState(() {
        print("Offers");
        print(dataSignUp['RETURN_DATA']);
        offerList = dataSignUp['RETURN_DATA'];
      });
    } else {
      WebResponseExtractor.showToast(dataSignUp["RETURN_MSG"]);
    }

    setState(() {
      load = false;
    });
  }
}
