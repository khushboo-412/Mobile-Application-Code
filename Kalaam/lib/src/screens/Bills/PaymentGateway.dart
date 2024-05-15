// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks
import 'package:kalaam/src/services/Library.dart';

import 'package:kalaam/src/screens/Bills/Bills.dart';





class PaymentGateway extends StatefulWidget {
  var url;
  PaymentGateway(this.url);
  @override
  State<PaymentGateway> createState() => _PaymentGatewayState(this.url);
}

class _PaymentGatewayState extends State<PaymentGateway> {
  String message;
  var url;
  _PaymentGatewayState(this.url);
  bool _enabled = true;
  String status="";

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  bool load = false;
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

    return  WillPopScope(
      onWillPop: () {
          showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title:  Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "Are you sure?",
                
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
            content: Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "Want to go back",
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xcc1c201d),
                  fontSize: 14,
                  fontFamily: "Bliss Pro",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.72,
                ),
              ),
            ),

            actions: <Widget>[


              Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);

                  },
                  child: Container(
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
                    child: Center(
                      child: Text(
                        "Continue Entering Details",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfffafafa),
                          fontSize: 16,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Bills(),
                        ));
                  },
                  child: Container(
                    width: 250,
                    height: 40,


                    child:
                    Text(
                      "Back To Invoices",
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.greenColor,
                        fontSize: 16,
                        fontFamily: "Bliss Pro",
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  ),
                ),
              ),
            ],



          ),
        );
          return;
      },
      child: Scaffold(
        backgroundColor: Constants.greenColor,
        appBar: AppBar(        backgroundColor: Constants.greenColor,
          leading: GestureDetector(
              onTap: (){
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title:  Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Are you sure?",
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
                    content: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Want to go back",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xcc1c201d),
                          fontSize: 14,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.72,
                        ),
                      ),
                    ),

                    actions: <Widget>[


                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);

                          },
                          child: Container(
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
                            child: Center(
                              child: Text(
                                "Continue Entering Details",
                                textScaleFactor: 1.0,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xfffafafa),
                                  fontSize: 16,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Bills(),
                                ));
                          },
                          child: Container(
                            width: 250,
                            height: 40,


                            child:
                                Text(
                                  "Back to Invoices",
                                  textScaleFactor: 1.0,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Constants.greenColor,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                                    ),
                        ),
                      ),
                    ],



                  ),
                );
              },
              child: Icon(Icons.arrow_back_ios, color: Constants.whiteText,)),

          // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
          actions: <Widget>[


          ],
        ),

        bottomNavigationBar:  Container(
          height: status==""? 1:100,
          color: Constants.whiteText,
          child: status == "error"? GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PaymentGateway(url),
                  ));
            },
            child: Container(
              height: 66,
              width:
              MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Container(
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
                    child: Center(
                      child: Text(
                        "Try Again",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfffafafa),
                          fontSize: 16,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
              : status == "success"? GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Bills(),
                  ));
            },
            child:  Container(
              height: 66,
              width:
              MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Container(
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
                    child: Center(
                      child: Text(
                        "Back  To Invoices",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfffafafa),
                          fontSize: 16,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ):Container(
            height: 1, color: Colors.transparent,
          ),
        ),
        body:
    Container(
      height: MediaQuery.of(context).size.height,
    color: Constants.backgroundWhiteColor,
    child: Stack(
      children: [
        WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
           
            setState(() {
              if(progress==100){
                load = false;
              }
              else{
                load =true;
              }
            });
          },

          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
             
              return NavigationDecision.prevent;
            }
           
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
           
          },
          onPageFinished: (url) {
           
            setState(() {
              if(url.toString().contains("payment/error") || url.toString().contains("credimax/error")
              || url.toString().contains("payment/declined")
              )
              {
                status = "error";
              }
              else if(url.toString().contains("payment/response") || url.toString().contains("credimax/approved")
              ||  url.toString().contains("payment/approved"))
              {
                status = "success";

              }
              else{
                status = "";

              }

            });
          },


        ),
        load==true?LoadingHome():SizedBox()

      ],
    ),
    ),


      ),
    );
  }
}

