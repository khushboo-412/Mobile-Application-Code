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
      child: type == "desk"
          ? Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "How to Register?",
                      style: TextStyle(
                        color: Constants.greenColor,
                        fontSize: 25,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Constants.greenColor,
                        ),
                        child: Center(
                          child: Text(
                            "1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Constants.whiteText,
                                fontSize: 18,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        "  Click “Create an Account”",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constants.greyTextColor,
                            fontSize: 22,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.greenColor,
                          ),
                          child: Center(
                            child: Text(
                              "2",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "  Enter your details",
                        style: TextStyle(
                            color: Constants.greyTextColor,
                            fontSize: 22,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "(if you are an existing Kalaam Customer, use the registered email account with Kalaam)",
                      style: TextStyle(
                          color: Constants.greyTextColor,
                          fontSize: 18,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.greenColor,
                          ),
                          child: Center(
                            child: Text(
                              "3",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "  Verify your account with OTP\n  sent to your registered email",
                        style: TextStyle(
                            color: Constants.greyTextColor,
                            fontSize: 22,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.greenColor,
                          ),
                          child: Center(
                            child: Text(
                              "4",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Constants.whiteText,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "  Once verified, click “Log in”\n  using verified email",
                        style: TextStyle(
                            color: Constants.greyTextColor,
                            fontSize: 22,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Column(
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
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width * 0.8,
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
                      description == ""
                          ? Container()
                          : Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Text(
                                  description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Constants.greyTextColor,
                                      fontSize: 20,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.center,
                        child: Text(
                          heading,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.greenColor,
                            fontSize: 25,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      description1 == ""
                          ? Container()
                          : Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Text(
                                  description1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Constants.greyTextColor,
                                      fontSize: 20,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 5,
                      ),
                      description2 == ""
                          ? Container()
                          : Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Text(
                                  description2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Constants.greyTextColor,
                                      fontSize: 20,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 5,
                      ),
                      description3 == ""
                          ? Container()
                          : Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Text(
                                  description3,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Constants.greyTextColor,
                                      fontSize: 20,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.normal),
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
