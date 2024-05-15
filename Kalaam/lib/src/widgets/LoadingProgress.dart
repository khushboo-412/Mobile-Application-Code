// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps
import 'package:kalaam/src/services/Library.dart';

class LoadingProgress extends StatefulWidget {
  String message;

  LoadingProgress(this.message);

  @override
  State<LoadingProgress> createState() => _LoadingProgressState();
}

class _LoadingProgressState extends State<LoadingProgress>
    with SingleTickerProviderStateMixin {
  bool _enabled = true;
  Animation<double> fadeAnimation;
  AnimationController fadeAnimationController;
  @override
  void initState() {
    super.initState();
    // fadeAnimationController =
    //     AnimationController(vsync: this, duration: Duration(seconds: 2));
    // fadeAnimation = Tween<double>(begin: 100.0, end: 150.0)
    //     .animate(fadeAnimationController);
    // fadeAnimationController.forward().whenComplete(() {
    //   fadeAnimationController.reverse();
    // });
  }

  @override
  void dispose() {
   // fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthCon = MediaQuery.of(context).size.width;
    final heightCon = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 3,
      color: Constants.whiteText,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            0, height * 0.1, 0, 0),
        child: Center(
          child: Image.asset(
            "images/load.gif",
          ),
          // child: AnimatedBuilder(
          //   animation: fadeAnimation,
          //   builder: (context, widget) {
          //     return Center(
          //       child: Image.asset(
          //         "images/logo.png",
          //         width: fadeAnimation.value,
          //         height: fadeAnimation.value,
          //       ),
          //     );
          //   },
          // ),
          // child: SpinKitFadingGrid(
          //   color: Constants.greenColor,
          //   size: 80,
          // ),

          // Container(
          //   height: width * 0.3,
          //   width: width * 0.3,
          //   child: /*CircularProgressIndicator(
          //     backgroundColor: Constants.backgroundWhiteColor,
          //     color: Constants.greenColor,
          //   ),*/
          //       Image.asset(
          //     'images/splash.gif',
          //   ),
          // ),
        ),
      ),
      /* child: Lottie.asset(
        'assets/gif/chipnloader.json',
      ),*/
    );
  }
}

class LoadingTransProgress extends StatefulWidget {
  String message;

  LoadingTransProgress(this.message);

  @override
  State<LoadingTransProgress> createState() => _LoadingTransProgressState();
}

class _LoadingTransProgressState extends State<LoadingTransProgress>
    with SingleTickerProviderStateMixin {
  bool _enabled = true;
  Animation<double> fadeAnimation;
  AnimationController fadeAnimationController;
  @override
  void initState() {
    super.initState();
    // fadeAnimationController =
    //     AnimationController(vsync: this, duration: Duration(seconds: 2));
    // fadeAnimation = Tween<double>(begin: 100.0, end: 150.0)
    //     .animate(fadeAnimationController);
    // fadeAnimationController.forward().whenComplete(() {
    //   fadeAnimationController.reverse();
    // });
  }

  @override
  void dispose() {
    //fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthCon = MediaQuery.of(context).size.width;
    final heightCon = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 3,
      color: Colors.transparent,
      //    color: Constants.whiteText,
      child: Center(
        child:Image.asset(
          "images/load.gif",
        ),

        /*AnimatedBuilder(
          animation: fadeAnimation,
          builder: (context, widget) {
            return Center(
              child: Image.asset(
                "images/logo.png",
                width: fadeAnimation.value,
                height: fadeAnimation.value,
              ),
            );
          },
        ),*/
        // child: SpinKitFadingGrid(
        //   color: Constants.greenColor,
        //   size: 80,
        // ),

        // Container(
        //   height: width * 0.3,
        //   width: width * 0.3,
        //   child: /*CircularProgressIndicator(
        //     backgroundColor: Constants.backgroundWhiteColor,
        //     color: Constants.greenColor,
        //   ),*/
        //       Image.asset(
        //     'images/splash.gif',
        //   ),
        // ),
      ),
      /* child: Lottie.asset(
        'assets/gif/chipnloader.json',
      ),*/
    );
  }
}

class LoadingSmall extends StatefulWidget {
  @override
  State<LoadingSmall> createState() => _LoadingSmallState();
}

class _LoadingSmallState extends State<LoadingSmall>
    with SingleTickerProviderStateMixin {
  String message;

  bool _enabled = true;
  Animation<double> fadeAnimation;
  AnimationController fadeAnimationController;
  @override
  void initState() {
    super.initState();
    // fadeAnimationController =
    //     AnimationController(vsync: this, duration: Duration(seconds: 2));
    // fadeAnimation = Tween<double>(begin: 100.0, end: 150.0)
    //     .animate(fadeAnimationController);
    // fadeAnimationController.forward().whenComplete(() {
    //   fadeAnimationController.reverse();
    // });
  }

  @override
  void dispose() {
  //  fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthCon = MediaQuery.of(context).size.width;
    final heightCon = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      color: Constants.whiteText,
      child: Center(
        child:Image.asset(
          "images/load.gif",
        ),
        // child: AnimatedBuilder(
        //   animation: fadeAnimation,
        //   builder: (context, widget) {
        //     return Center(
        //       child: Image.asset(
        //         "images/logo.png",
        //         width: fadeAnimation.value,
        //         height: fadeAnimation.value,
        //       ),
        //     );
        //   },
        // ),
        // child: SpinKitFadingGrid(
        //   color: Constants.greenColor,
        //   size: 80,
        // ),

        //  Container(
        //   height: width * 0.3,
        //   width: width * 0.3,
        //   child: /*CircularProgressIndicator(
        //     backgroundColor: Constants.backgroundWhiteColor,
        //     color: Constants.greenColor,
        //   ),*/
        //       Image.asset(
        //     'images/splash.gif',
        //   ),
        // ),
      ),
      /* child: Lottie.asset(
        'assets/gif/chipnloader.json',
      ),*/
    );
  }
}

class LoadingHome extends StatefulWidget {
  @override
  State<LoadingHome> createState() => _LoadingHomeState();
}

class _LoadingHomeState extends State<LoadingHome>
    with SingleTickerProviderStateMixin {
  String message;

  bool _enabled = true;

  Animation<double> fadeAnimation;
  AnimationController fadeAnimationController;
  @override
  void initState() {
    super.initState();
    // fadeAnimationController =
    //     AnimationController(vsync: this, duration: Duration(seconds: 2));
    // fadeAnimation = Tween<double>(begin: 100.0, end: 150.0)
    //     .animate(fadeAnimationController);
    // fadeAnimationController.forward().whenComplete(() {
    //   fadeAnimationController.reverse();
    // });
  }

  @override
  void dispose() {
   // fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthCon = MediaQuery.of(context).size.width;
    final heightCon = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        color: Constants.whiteText,
        child: Center(
          child:Image.asset(
            "images/load.gif",
          ),
          /* AnimatedBuilder(
              animation: fadeAnimation,
              builder: (context, widget) {
                return Center(
                  child: Image.asset(
                    "images/logo.png",
                    width: fadeAnimation.value,
                    height: fadeAnimation.value,
                  ),
                );
              },
            )*/
              

          // AnimatedContainer(
          //     width: fadeAnimationController.value,
          //     height: fadeAnimationController.value,
          //     curve: Curves.easeIn,
          //     duration: const Duration(seconds: 2),
          //     decoration: BoxDecoration(
          //         color: Colors.blue,
          //         image: DecorationImage(
          //           image: AssetImage(
          //             'images/logo.png',
          //           ),
          //         ))),
        )
        /* child: Lottie.asset(
        'assets/gif/chipnloader.json',
      ),*/
        );
  }
}



// class LoadingProgress extends StatelessWidget {
//   String message;
//   bool _enabled = true;
//   LoadingProgress(this.message);
//   @override
//   Widget build(BuildContext context) {
//     final widthCon = MediaQuery.of(context).size.width;
//     final heightCon = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 3,
//       color: Constants.backgroundWhiteColor,
//       child: Padding(
//         padding: EdgeInsets.fromLTRB(
//             width * 0.3, height * 0.1, width * 0.3, height * 2.35),
//         child: Center(
//           child: SpinKitFadingGrid(
//             color: Constants.greenColor,
//             size: 80,
//           ),

//           // Container(
//           //   height: width * 0.3,
//           //   width: width * 0.3,
//           //   child: /*CircularProgressIndicator(
//           //     backgroundColor: Constants.backgroundWhiteColor,
//           //     color: Constants.greenColor,
//           //   ),*/
//           //       Image.asset(
//           //     'images/splash.gif',
//           //   ),
//           // ),
//         ),
//       ),
//       /* child: Lottie.asset(
//         'assets/gif/chipnloader.json',
//       ),*/
//     );
//   }
// }
