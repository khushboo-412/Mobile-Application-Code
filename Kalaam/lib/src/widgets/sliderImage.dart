// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps, prefer_const_constructors_in_immutables
import 'package:kalaam/src/services/Library.dart';

class IntroScreen extends StatelessWidget {
  final String image;
  final String heading;
  final String description;
  final String description1;
  final String description2;
  final String description3;
  final String type;
  IntroScreen(
      {this.image,
        this.heading,
        this.description,
        this.description1,
        this.description2,
        this.description3,
        this.type});

  Widget build(context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          type == "svg"
              ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            child: SvgPicture.asset('assets/gif/$image'),
          )
              : type == "png"
              ? Container(
            // height: MediaQuery.of(context).size.height * 0.35,
            child: Image(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width,
              image: AssetImage('images/$image'),
            ),
          )
              : Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Lottie.asset(
              'assets/gif/$image',
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 50, right: 50, bottom: 10),
                  alignment: Alignment.center,
                  child: Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Constants.headingBlackColor,
                      fontSize: 28,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),




                SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
