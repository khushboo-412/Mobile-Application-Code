// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps, missing_return
import 'package:kalaam/src/services/Library.dart';

class Common {
  static Future<bool> canGoBack() async {
    //  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //  sharedPreferences.setString(
    //             "appStatus", "detached");
    SystemNavigator.pop();
    return false;
  }

  static Future<bool> canGoBackApp(BuildContext context) async {
    //  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //  sharedPreferences.setString(
    //             "appStatus", "detached");
    CustomWidgets.showAppDialog(context);
  }
}
