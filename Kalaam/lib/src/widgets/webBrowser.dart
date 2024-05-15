// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:kalaam/src/services/Library.dart';

class WebBrowser extends StatefulWidget {
  var url;
  WebBrowser(this.url);
  @override
  State<WebBrowser> createState() => _WebBrowserState(this.url);
}

class _WebBrowserState extends State<WebBrowser> {
  String message;
  var url;
  _WebBrowserState(this.url);
  bool _enabled = true;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    log("url:"+url.toString());
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    final widthCon = MediaQuery.of(context).size.width;
    final heightCon = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Constants.greenColor,
      appBar: AppBar(
        backgroundColor: Constants.greenColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Constants.whiteText,
            )),

        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[],
      ),
      body: WebView(
        gestureNavigationEnabled: true,
        debuggingEnabled: true,
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {},
      ),
/*
      body: SizedBox(
        width: width,
        height: height,
        child: ListView(
          children: [
            SizedBox(
              //width: width,
              //height: height * 4,
              child: WebView(
                gestureNavigationEnabled: true,
                debuggingEnabled: true,
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                onProgress: (int progress) {},
              ),
            ),
          ],
        ),
      ),
*/
    );
  }
}


class WebBrowserLong extends StatefulWidget {
  var url;
  WebBrowserLong(this.url);
  @override
  State<WebBrowserLong> createState() => WebBrowserLongState(this.url);
}

class WebBrowserLongState extends State<WebBrowserLong> {
  String message;
  var url;
  WebBrowserLongState(this.url);
  bool _enabled = true;

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    final widthCon = MediaQuery.of(context).size.width;
    final heightCon = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Constants.greenColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Constants.greenColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Constants.whiteText,
            )),

        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[],
      ),
      body: WebView(
        gestureNavigationEnabled: true,
        debuggingEnabled: true,
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        gestureRecognizers: Set()
          ..add(Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer())),
        onProgress: (int progress) {},
      ),
/*
      body: SizedBox(
        width: width,
        height: height,
        child: ListView(
          children: [
            SizedBox(
              //width: width,
              //height: height * 4,
              child: WebView(
                gestureNavigationEnabled: true,
                debuggingEnabled: true,
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                onProgress: (int progress) {},
              ),
            ),
          ],
        ),
      ),
*/
    );
  }
}
