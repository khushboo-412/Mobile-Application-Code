// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps
import 'package:kalaam/src/services/Library.dart';

class AlertBox extends StatelessWidget {
  String heading;
  String description;
  String image;
  String detail;
  String buttonText;
  String otherText;

  bool _enabled = true;
  AlertBox(this.heading, this.description, this.image, this.detail, this.buttonText, this.otherText);
  @override
  Widget build(BuildContext context) {
    final widthCon = MediaQuery.of(context).size.width;
    final heightCon = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: widthCon,
      height: heightCon,
      color: Colors.black.withOpacity(0.8),
      child: Center(

          child:Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: width,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0x19898a8d), width: 1, ),


                color: Colors.white,
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    SizedBox(height: 20,),
                    Text(
                      "Alert",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                    SizedBox(height: 24),
                    Icon(Icons.error_outline, size:75,color: Color(0xffD88B10),),
                    SizedBox(height: 24),
                    Container(
                      width: width,
                      padding: const EdgeInsets.symmetric(horizontal: 12, ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              SizedBox(
                                width: width,
                                child: Text(
                                description,
                                textScaleFactor: 1.0,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff1d201e),
                                    fontSize: 18,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              SizedBox(
                                width: width,
                                child: Text(
                                 detail,
                                 textScaleFactor: 1.0,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xcc1c201d),
                                    fontSize: 12,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.72,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Constants.greySliderColor,
                          ),
                          SizedBox(height: 20),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                width: 311,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x2600a817),
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                  color: Constants.greenColor,
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 8, ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[
                                    Text(
                                      buttonText,
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
                              otherText==""?SizedBox():  SizedBox(height: 12),
                              otherText==""?SizedBox():  Text(
                                otherText,
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: Color(0xffef3d3d),
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
          ),

      ),

    );
  }
}
