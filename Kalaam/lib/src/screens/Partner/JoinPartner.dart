// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations
import 'package:kalaam/src/services/Library.dart';

class JoinPartner extends StatefulWidget {
  @override
  JoinPartnerState createState() => JoinPartnerState();
}

class JoinPartnerState extends State<JoinPartner> {
  bool selectAll = false;
  TextEditingController company = new TextEditingController();
  TextEditingController designation = new TextEditingController();
  TextEditingController description = new TextEditingController();
  bool load = false;
  final _formKey = GlobalKey<FormState>();
  bool colorChange = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
       top: false,
        bottom: false,

      child: new Scaffold(
        /* bottomNavigationBar:isPartner == "Y"?
            Container(height: 70,)
            : GestureDetector(
          onTap: (){
            if (_formKey.currentState.validate()) {
              joinPartner();
            }

          },
          child: Container(
            color: Constants.backgroundWhiteColor,
            height: 80,
            child:  Padding(
              padding: EdgeInsets.all(mediaQueryWidth*0.04),
              child:  ListView(
                children: [   Container(
                  width: mediaQueryWidth,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color:  colorChange == true?Constants.greenColor:Constants.greyButtonColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 14, ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Opacity(
                        opacity: 0.90,
                        child: Text(
                          "Join Us",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colorChange == true?Constants.whiteText:Constants.greyButtonTextColor,
                            fontSize: 16,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),],
              ),
            ),
          ),
        ),*/
        appBar: AppBar(
          backgroundColor: Constants.backgroundWhiteColor,
          iconTheme: IconThemeData(color: Colors.black),
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Home(),
                    ));
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Constants.headingBlackColor,
              )),
          title:
//Align(      alignment: Alignment(-12, 0),

              Text(
            "Partner Program",
            textScaleFactor: 1.0,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.headingBlackColor,
              fontSize: 16,
              fontFamily: "Bliss Pro",
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          elevation: 3,
        ),
        body: Container(
          color: isPartner == "Y"
              ? Constants.whiteText
              : Constants.backgroundWhiteColor,
          child: isPartner == "Y"
              ? Container(
                  height: mediaQueryHeight,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50, bottom: 20),
                        child: Container(
                          width: mediaQueryWidth * 0.5,
                          height: 100,
                          child: Image.asset("images/logoF.png"),
                        ),
                      ),
                      Container(
                        width: mediaQueryWidth,
                        height: 100,
                        color: Constants.greenColor,
                        child: Center(
                          child: Text(
                            "Your request has been sent.\nOur team will contact you shortly.",
                           textScaleFactor: 1.0,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Constants.whiteText,
                              fontSize: 20,
                              fontFamily: "Bliss Pro",
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(mediaQueryWidth * 0.3,
                            mediaQueryHeight * 0.2, 0, 0),
                        child: Image.asset("images/logoT.png"),
                      ),
                    ],
                  )),
                )
              : Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Form(
                        key: _formKey,
                        child: Container(
                          height: mediaQueryHeight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text(
                                    "Join us as a ",
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      color: Constants.greyTextColor,
                                      fontSize: 28,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "Partner",
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      color: Constants.greenColor,
                                      fontSize: 28,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: company,
                                onChanged: (text) {
                                  checkColor();
                                },
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.toString().trim() == "") {
                                    return "Enter Company Name ";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  counterText: "",
                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constants.greySliderColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constants.greySliderColor),
                                  ),
                                  contentPadding: EdgeInsets.all(0.0),
                                  labelStyle: TextStyle(
                                    color: Constants.labelTextColor,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  labelText: "Company Name",
                                  helperStyle: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              //CustomWidgets.textField("Company Name", company),
                              SizedBox(
                                height: 20,
                              ),
                              // CustomWidgets.textField("Designation", designation),
                              TextFormField(
                                controller: designation,
                                onChanged: (text) {
                                  checkColor();
                                },
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.toString().trim() == "") {
                                    return "Enter Designation ";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  counterText: "",
                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constants.greySliderColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constants.greySliderColor),
                                  ),
                                  contentPadding: EdgeInsets.all(0.0),
                                  labelStyle: TextStyle(
                                    color: Constants.labelTextColor,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  labelText: "Designation",
                                  helperStyle: TextStyle(fontSize: 12.0),
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              Text(
                                "Company Description",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: Constants.labelTextColor,
                                  fontSize: 16,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              Container(
                                width: mediaQueryWidth * 0.9,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0x33898a8d),
                                    width: 1,
                                  ),
                                  color: Color(0xfffafafa),
                                ),
                                child: TextFormField(
                                  controller: description,
                                  onChanged: (text) {
                                    checkColor();
                                  },
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Company Description";
                                    }
                                    return null;
                                  },
                                  maxLength: 1000,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    isDense: true,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.all(8),
                                    labelStyle: TextStyle(
                                      color: Constants.labelTextColor,
                                      fontSize: 16,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    hintText:
                                        "Write your company description...",
                                    hintStyle: TextStyle(
                                      color: Color(0xcc181b19),
                                      fontSize: 14,
                                    ),
                                    helperStyle: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_formKey.currentState.validate()) {
                                        joinPartner();
                                      }
                                    },
                                    child: Container(
                                      color: Constants.backgroundWhiteColor,
                                      height: 80,
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            mediaQueryWidth * 0.04),
                                        child: ListView(
                                          children: [
                                            Container(
                                              width: mediaQueryWidth,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: colorChange == true
                                                    ? Constants.greenColor
                                                    : Constants.greyButtonColor,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 62,
                                                vertical: 14,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Opacity(
                                                    opacity: 0.90,
                                                    child: Text(
                                                      "Join Us",
                                                      textScaleFactor: 1.0,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: colorChange ==
                                                                true
                                                            ? Constants
                                                                .whiteText
                                                            : Constants
                                                                .greyButtonTextColor,
                                                        fontSize: 16,
                                                        fontFamily: "Bliss Pro",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    load == true ? LoadingHome() : SizedBox()
                  ],
                ),
        ),
      ),
    );
  }

  void checkColor() {
    if (company.text == "") {
      setState(() {
        colorChange = false;
      });
    } else {
      if (designation.text == "") {
        setState(() {
          colorChange = false;
        });
      } else {
        if (description.text == "") {
          setState(() {
            colorChange = false;
          });
        } else {
          setState(() {
            colorChange = true;
          });
        }
      }
    }
  }

  void joinPartner() async {
    setState(() {
      load = true;
      colorChange = true;
    });

    var enc = await encryptData({
      "user_id": userId,
      "company_name": company.text,
      "designation": designation.text,
      "description": description.text
    });
    print("send data:" +
        {
          "user_id": userId,
          "company_name": company.text,
          "designation": designation.text,
          "description": description.text
        }.toString());
    var dataAPI = await joinPartnerAPI(enc);

    print("response:" + dataAPI.toString());
    if (dataAPI["RETURN_FLAG"] == true) {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        load = false;
        isPartner = "Y";
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ));
    } else {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
      setState(() {
        load = false;
      });
    }
  }
}
