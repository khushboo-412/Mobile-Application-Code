// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations
import 'package:kalaam/src/services/Library.dart';

class OrderStatus extends StatefulWidget {
  @override
  OrderStatusState createState() => OrderStatusState();
}
class OrderStatusState extends State<OrderStatus> {
  String name;
  PageController pageBannerController = PageController();
  int sliderBannerIndex = 0;

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
            "Order Status",
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
          color: Constants.backgroundWhiteColor,
          height: mediaQueryHeight,
          child: Padding(
            padding:  EdgeInsets.fromLTRB(mediaQueryWidth*0.04,mediaQueryWidth*0.35,mediaQueryWidth*0.04,mediaQueryWidth*0.04),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset("images/ok.png"),
                ),
                SizedBox(height: 16),
                Text(
                  "Thank You",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Constants.greenColor,
                    fontSize: 37,
                    fontFamily: "Bliss Pro",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 18),
                Container(
                  width: mediaQueryWidth,
                  color: Constants.greySliderColor,
                  height: 1,
                ),
                SizedBox(height: 18),
                Text(
                  "Order placed successfully",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Constants.headingBlackColor,
                    fontSize: 18,
                    fontFamily: "Bliss Pro",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "YOUR ORDER ID - ORD12345",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Constants.greyTextColor,
                    fontSize: 12,
                    fontFamily: "Bliss Pro",
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.72,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Click here for more details!",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Constants.greenColor,
                    fontSize: 14,
                    fontFamily: "Bliss Pro",
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }





}

