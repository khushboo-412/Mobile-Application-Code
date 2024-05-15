import 'package:flutter/material.dart';
import 'package:younited_application/Utils/AppAssets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';

class AppBarWidget{
  // ignore: non_constant_identifier_names
  // Logo App Bar
  static AppBar logoAppbar(BuildContext buildContext, String title){

   /* return PreferredSize(
      preferredSize: Size(double.infinity, 60.0), // 40 is the height
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState){
          return
        },
      ),
    );*/
   return AppBar(
    // leading: Icon(Icons.menu),
     title: Text('$title'),
     elevation: 0.0,
     actions: [
       Padding(
         padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
         child: Image.asset('${AppAssets.youLogo}',),
       ),
     ],
     backgroundColor: ThemeColors.appbarColor,
   );

  }
  // Center App Bar
  static AppBar centerTitleAppbar(BuildContext buildContext, String title){

    /* return PreferredSize(
      preferredSize: Size(double.infinity, 60.0), // 40 is the height
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState){
          return
        },
      ),
    );*/
    return AppBar(
      title: Center(child: Text('$title')),
      elevation: 0.0,
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              _shoPageInfo(buildContext, title);
            },
          ),
        ),
      ],
      backgroundColor: ThemeColors.appbarColor,
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