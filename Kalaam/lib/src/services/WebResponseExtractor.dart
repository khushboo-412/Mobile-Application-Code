// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps
import 'package:kalaam/src/services/Library.dart';
import 'package:intl/intl.dart';

class WebResponseExtractor{
  static dynamic filterWebData(response, {String dataObject = "", bool isSubmit = false, String innerDataObject = ""}){

    final jsonData = jsonDecode(response.body) as Map;
    var returnCode = jsonData['RETURN_CODE'];
   
    if(returnCode == 1){
      if(isSubmit){
        //showToast('${jsonData['RETURN_MESSAGE']}');
        Map dataField = {
          "code" : returnCode,
          "data" : null,
          "message" : jsonData['RETURN_MESSAGE']
        };
        return dataField;
      }else{
        //WebResponseExtractor.showToast('${jsonData['RETURN_MESSAGE']}');
        var data = jsonData['$dataObject'];
        Map dataField = {
          "code" : returnCode,
          "data" : data,
          "message" : jsonData['RETURN_MESSAGE']
        };
        return dataField;
      }
    }else{
      //WebResponseExtractor.showToast('${jsonData['RETURN_MESSAGE']}');
      Map dataField = {
        "data" : null,
        "message" : jsonData['RETURN_MESSAGE']
      };
      return dataField;
    }
  }

  static Map<String, dynamic> filterListWebData(response, {String dataObject, bool isSubmit = false}){

    final jsonData = jsonDecode(response.body) as Map;
    var returnCode = jsonData['RETURN_CODE'];
   
    if(returnCode == 1){
      if(isSubmit){
       // showToast('${jsonData['RETURN_MESSAGE']}');
        Map<dynamic, dynamic> dataField = {
          "code" : 1,
          "data" : null,
          "message" : jsonData['RETURN_MESSAGE']
        };
        return dataField;
      }else{
        //Utils.showToast('${jsonData['RETURN_MESSAGE']}');
       // WebResponseExtractor.showToast('${jsonData['RETURN_MESSAGE']}');
        Map<dynamic, dynamic> data = jsonData['$dataObject'];
        Map<dynamic, dynamic> dataField = {
          "code" : 1,
          "data" : data,
          "message" : jsonData['RETURN_MESSAGE']
        };
        return dataField;
      }
    }else{
      //  Utils.showToast('${jsonData['RETURN_MESSAGE']}');
      return null;
    }

  }

 static String dateFormat(String d){

    if(d==""){return d;}else{
   List<String> dateList =d.split("/");
  


   if(int.parse(dateList[0].toString())<10 ){
     dateList[0] = "0"+dateList[0];
   }

   if(int.parse(dateList[1].toString())<10){
     dateList[1] = "0"+dateList[1];
   }
   // d = dateList[0]+"/"+dateList[1]+"/"+dateList[2];
  
   var inputFormat = DateFormat('dd/MM/yyyy');
   var date1 = inputFormat.parse(d);

   var outputFormat = DateFormat('dd MMM yyyy');
   var date2 = outputFormat.format(date1); // 2019-08-18
   return (date2);}
 }

  static void showToast(String message) {
    message==""||message==null||message.toString()=="null"?SizedBox():  Fluttertoast.showToast(
        msg: message,
        
        textColor: Colors.black,
        backgroundColor: Colors.grey[200],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2
    );
  }
}