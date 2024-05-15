// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps
import 'package:kalaam/src/services/Library.dart';



class  SplashLoad extends StatefulWidget {
  @override
  SplashLoadState createState() => SplashLoadState();
}

class  SplashLoadState extends State< SplashLoad>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation heartbeatAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    heartbeatAnimation =
        Tween<double>(begin: 100.0, end: 300.0).animate(controller);
    //controller.forward();
    controller.forward().whenComplete(() {
      controller.reverse();
    });


  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: heartbeatAnimation,
      builder: (context, widget) {
        return Scaffold(
          backgroundColor: Constants.greenColor,
          body:  Center(
            child: Image.asset("images/logoW.png", width: heartbeatAnimation.value, height: heartbeatAnimation.value,),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

}
