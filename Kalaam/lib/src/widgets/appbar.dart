// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps, unused_element

import 'package:kalaam/src/services/Library.dart';
import 'package:kalaam/src/screens/Bills/Bills.dart';

class AppBarWidget {
  // Logo App Bar

  // Center App Bar
  static AppBar centerTitleAppbar(BuildContext buildContext, String title) {
    /* return PreferredSize(
      preferredSize: Size(double.infinity, 60.0), // 40 is the height
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState){
          return
        },
      ),
    );*/
    return AppBar(
      title: Center(child: Text('$title',textScaleFactor: 1.0,)),
      elevation: 0.0,
      actions: [],
    );
  }

  static Container bottomBar(BuildContext buildContext, String title) {
    return Container(
      width: MediaQuery.of(buildContext).size.width,
      height: 75,
      color: Constants.whiteText,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(buildContext).size.width * 0.25,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.greenColor,
                    width: 1,
                  ),
                  color: Color(0xffd9d9d9),
                ),
              ),
              Container(
                width: MediaQuery.of(buildContext).size.width * 0.75,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.whiteText,
                    width: 1,
                  ),
                  color: Color(0xffd9d9d9),
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Home(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.22,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset("images/home.png"),
                        ),
                        SizedBox(height: 7),
                        SizedBox(
                          height: 15,
                          child: Text(
                            "Home",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: Color(0xff00a817),
                              fontFamily: "Bliss Pro",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
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
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Bills(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.25,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset("images/bill.png"),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Bill & Payments",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Color(0xff898a8d),
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MyServices(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.22,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset("images/mySer1.svg"),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "My Services",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Color(0xff898a8d),
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Help(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.25,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.only(
                            top: 3,
                            bottom: 2,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset("images/help.png"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Help & Support",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Color(0xff898a8d),
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Container bottomBarHelp(BuildContext buildContext, String title) {
    return Container(
      width: MediaQuery.of(buildContext).size.width,
      height: 75,
      color: Constants.whiteText,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(buildContext).size.width * 0.73,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.whiteText,
                    width: 1,
                  ),
                  color: Color(0xffd9d9d9),
                ),
              ),
              Container(
                width: MediaQuery.of(buildContext).size.width * 0.27,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.greenColor,
                    width: 1,
                  ),
                  color: Color(0xffd9d9d9),
                ),
              ),
            ],
          ),          SizedBox(height: 5,),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Home(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.22,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset("images/homeG.png"),
                        ),
                        SizedBox(height: 7),
                        SizedBox(
                          height: 15,
                          child: Text(
                            "Home",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: Color(0xff898a8d),
                              fontFamily: "Bliss Pro",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
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
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Bills(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.25,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset("images/bill.png"),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Bill & Payments",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Color(0xff898a8d),
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MyServices(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.22,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset("images/mySer1.svg"),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "My Services",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Color(0xff898a8d),
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Help(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.25,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.only(
                            top: 3,
                            bottom: 2,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset("images/helpG.png"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Help & Support",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: Constants.greenColor,
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Container bottomBarBill(BuildContext buildContext, String title) {
    return Container(
      width: MediaQuery.of(buildContext).size.width,
      height: 75,
      color: Constants.whiteText,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(buildContext).size.width * 0.25,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.whiteText,
                    width: 1,
                  ),
                  color: Color(0xffd9d9d9),
                ),
              ),
              Container(
                width: MediaQuery.of(buildContext).size.width * 0.26,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.greenColor,
                    width: 1,
                  ),
                  color: Color(0xffd9d9d9),
                ),
              ),
              Container(
                width: MediaQuery.of(buildContext).size.width * 0.49,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.whiteText,
                    width: 1,
                  ),
                  color: Color(0xffd9d9d9),
                ),
              ),
            ],
          ),          SizedBox(height: 5,),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Home(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.22,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset("images/homeG.png"),
                        ),
                        SizedBox(height: 7),
                        SizedBox(
                          height: 15,
                          child: Text(
                            "Home",
                            style: TextStyle(
                              color: Color(0xff898a8d),
                              fontFamily: "Bliss Pro",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
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
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Bills(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.25,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset("images/billG.png"),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Bill & Payments",
                          style: TextStyle(
                            color: Constants.greenColor,
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MyServices(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.22,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset("images/mySer1.svg"),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "My Services",
                          style: TextStyle(
                            color: Color(0xff898a8d),
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Help(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.25,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.only(
                            top: 3,
                            bottom: 2,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset("images/help.png"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Help & Support",
                          style: TextStyle(
                            color: Color(0xff898a8d),
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Container bottomBarProduct(BuildContext buildContext, String title) {
    return Container(
      width: MediaQuery.of(buildContext).size.width,
      height: 75,
      color: Constants.whiteText,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(buildContext).size.width * 0.5,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.whiteText,
                    width: 1,
                  ),
                  color: Color(0xffd9d9d9),
                ),
              ),
              Container(
                width: MediaQuery.of(buildContext).size.width * 0.23,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.greenColor,
                    width: 1,
                  ),
                  color: Color(0xffd9d9d9),
                ),
              ),
              Container(
                width: MediaQuery.of(buildContext).size.width * 0.27,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.whiteText,
                    width: 1,
                  ),
                  color: Color(0xffd9d9d9),
                ),
              ),
            ],
          ),          SizedBox(height: 5,),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Home(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.22,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset("images/homeG.png"),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          height: 15,
                          child: Text(
                            "Home",
                            style: TextStyle(
                              color: Color(0xff898a8d),
                              fontFamily: "Bliss Pro",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
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
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Bills(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.25,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset("images/bill.png"),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Bill & Payments",
                          style: TextStyle(
                            color: Color(0xff898a8d),
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MyServices(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.22,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset("images/mySer.svg"),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "My Services",
                          style: TextStyle(
                            color: Constants.greenColor,
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Help(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(buildContext).size.width * 0.25,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.only(
                            top: 3,
                            bottom: 2,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset("images/help.png"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Help & Support",
                          style: TextStyle(
                            color: Color(0xff898a8d),
                            fontFamily: "Bliss Pro",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> _shoPageInfo(BuildContext context, String title) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Page Info'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$title'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
