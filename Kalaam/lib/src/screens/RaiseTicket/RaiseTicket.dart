// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps
import 'package:kalaam/src/services/Library.dart';

class RaiseTicket extends StatefulWidget {
  @override
  RaiseTicketState createState() => RaiseTicketState();
}

class RaiseTicketState extends State<RaiseTicket> {
  TextEditingController ticketDate = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController issueText = new TextEditingController();

  Dropdown servicesCategoryDropDown;
  List<Dropdown> servicesCategoryList = [];
  String servicesCategory = "";
  String servicesCategoryID = "";

  bool colorChange = false;

  Dropdown issueCategoryDropDown;
  List<Dropdown> issueCategoryList = [];
  String issueCategory = "";
  String dateTicket;
  bool load = false;
  String issueCategoryID = "";
  bool showTextIssue = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isNewTicket = false;
    });
    getservicesCategoryFromWeb();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
       top: false,
        bottom: false,

      child: WillPopScope(
        onWillPop: () {
          return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Help(),
              ));
        },
        child: new Scaffold(
/*
          bottomNavigationBar: Container(
            color: Constants.backgroundWhiteColor,
            child:  Padding(
              padding: EdgeInsets.all(mediaQueryWidth*0.04),
              child: GestureDetector(
                onTap: (){ createTicket();

                },
                child: Container(
                  width: mediaQueryWidth,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Constants.greenColor,
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
                          "Submit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Bliss Pro",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
*/
          appBar: AppBar(
            backgroundColor: Constants.backgroundWhiteColor,
            iconTheme: IconThemeData(color: Colors.black),
            leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Help(),
                      ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Constants.headingBlackColor,
                )),
            title: Text(
              "Raise Your Ticket",
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
            height: mediaQueryHeight,
            color: Constants.backgroundWhiteColor,
            child: Padding(
              padding: EdgeInsets.all(mediaQueryWidth * 0.04),
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Problem Type",
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      color: Constants.greyTextColor,
                                      fontSize: 14,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0x33898a8d),
                                        width: 1,
                                      ),
                                      color: Color(0xfffafafa),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: mediaQueryWidth * 0.85,
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<Dropdown>(
                                                //  icon: Icon(Icons.arrow_drop_down),
                                                hint: Text("Select",
                                                textScaleFactor: 1.0,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "Bliss Pro")),
                                                value: servicesCategoryDropDown,
                                                isDense: true,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                                onChanged: (Dropdown _value) {
                                                  setState(() {
                                                    servicesCategoryDropDown =
                                                        _value;
                                                    servicesCategory =
                                                        servicesCategoryDropDown
                                                            .name;
                                                    servicesCategoryID =
                                                        servicesCategoryDropDown
                                                            .id;
                                                    checkColor();
                                                    issueCategoryDropDown =
                                                        null;
                                                    issueCategoryList = [];

                                                    getissueCategoryFromWeb();
                                                  });
                                                },
                                                items: servicesCategoryList
                                                    .map((Dropdown category) {
                                                  return DropdownMenuItem<
                                                      Dropdown>(
                                                    value: category,
                                                    child: SizedBox(
                                                        child: Text(category
                                                            .name
                                                            .toString(),textScaleFactor: 1.0,)),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),

                                          //    Icon(Icons.keyboard_arrow_down_outlined, color: Constants.greyTextColor, ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  /*
                                    
                            servicesCategoryID==""?SizedBox():      Text(
                              "Issue Type",
                              style: TextStyle(color: Constants.greyTextColor,                          fontSize: 14,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            servicesCategoryID==""?SizedBox(): SizedBox(height: 20,),
                                    
                            servicesCategoryID==""?SizedBox():  Container(
                              width: mediaQueryWidth,
                              height: 43,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0x33898a8d), width: 1, ),
                                color: Color(0xfffafafa),
                              ),
                                    
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:  Container(
                                  width: mediaQueryWidth*0.85,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<Dropdown>(
                                      //  icon: Icon(Icons.arrow_drop_down),
                                      hint: Text("Select",
                                          style:
                                          TextStyle(color: Colors.black,fontFamily: "Bliss Pro")),
                                      value: issueCategoryDropDown,
                                      isDense: true,
                                    
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                      onChanged: (Dropdown _value) {
                                        setState(() {
                                          issueCategoryDropDown = _value;
                                          issueCategory =
                                              issueCategoryDropDown.name;
                                          issueCategoryID =
                                              issueCategoryDropDown.id;
                                          checkColor();
                                          if(issueCategory.contains("Other")){
                                            showTextIssue =true;
                                          }
                                          else{
                                            showTextIssue =false;
                                    
                                          }
                                        });
                                      },
                                      items: issueCategoryList
                                          .map((Dropdown category) {
                                        return DropdownMenuItem<Dropdown>(
                                          value: category,
                                          child: SizedBox(
                                    
                                             width: mediaQueryWidth*0.8,
                                              height: 30,
                                              child: Text(category.name)),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                                    
                            servicesCategoryID==""?SizedBox(): SizedBox(height: 30,),
                                    
                                    
                            showTextIssue==false?SizedBox():   Container(
                              width: mediaQueryWidth,
                              height: 43,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0x33898a8d), width: 1, ),
                                color: Color(0xfffafafa),
                              ),
                              child: TextFormField(
                                    
                                onChanged: (text){
                                  checkColor();
                                },
                                    
                                    
                                style: TextStyle(
                                  color: Constants.headingBlackColor,
                                  fontSize: 18,
                                  fontFamily: "Bliss Pro",
                                  fontWeight: FontWeight.w500,
                                ),
                                controller: issueText,
                                    
                                decoration: InputDecoration(border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10),
                                  labelStyle: TextStyle(
                                    color: Constants.labelTextColor,
                                    fontSize: 16,
                                    fontFamily: "Bliss Pro",
                                    fontWeight: FontWeight.w500,
                                  ),
                                    
                                  hintText:  "Enter Your Issue...",
                                    
                                    
                                  hintStyle: TextStyle(
                                    color: Color(0xcc181b19),
                                    fontSize: 14,
                                  ),
                                    
                                    
                                ),
                              ),
                            ),
                                    
                            showTextIssue==false?SizedBox(): SizedBox(height: 30,),
                                    
                                    */

                                  servicesCategory
                                          .toString()
                                          .contains("Service")
                                      ? Row(
                                          children: [
                                            Text(
                                              "Suitable time to visit",
                                              textScaleFactor: 1.0,
                                              style: TextStyle(
                                                color: Constants.greyTextColor,
                                                fontSize: 14,
                                                fontFamily: "Bliss Pro",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              "  (optional)",
                                              textScaleFactor: 1.0,
                                              style: TextStyle(
                                                color: Constants.greyTextColor,
                                                fontSize: 12,
                                                fontFamily: "Bliss Pro",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                  servicesCategory
                                          .toString()
                                          .contains("Service")
                                      ? SizedBox(
                                          height: 20,
                                        )
                                      : SizedBox(),
                                  servicesCategory
                                          .toString()
                                          .contains("Service")
                                      ? Container(
                                          width: mediaQueryWidth,
                                          height: 43,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Color(0x33898a8d),
                                              width: 1,
                                            ),
                                            color: Color(0xfffafafa),
                                          ),
                                          child: TextFormField(
                                            onTap: () async {
                                              DatePicker.showDateTimePicker(
                                                  context,
                                                  showTitleActions: true,
                                                  onChanged: (date) {
                                                ticketDate.text = date.day
                                                        .toString() +
                                                    "/" +
                                                    date.month.toString() +
                                                    "/" +
                                                    date.year.toString() +
                                                    " (" +
                                                    date.hour.toString() +
                                                    ":" +
                                                    date.minute
                                                        .toString() /*+":"+  date.second.toString()*/ +
                                                    ")";
                                                dateTicket =
                                                    date.toIso8601String();

                                               
                                              }, onConfirm: (date) {
                                               
                                              }, currentTime: DateTime.now());
                                            },
                                            style: TextStyle(
                                              color:
                                                  Constants.headingBlackColor,
                                              fontSize: 18,
                                              fontFamily: "Bliss Pro",
                                              fontWeight: FontWeight.w500,
                                            ),
                                            controller: ticketDate,
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.all(10),
                                              labelStyle: TextStyle(
                                                color: Constants.labelTextColor,
                                                fontSize: 16,
                                                fontFamily: "Bliss Pro",
                                                fontWeight: FontWeight.w500,
                                              ),
                                              suffixIcon: Icon(Icons
                                                  .calendar_today_outlined),
                                              hintText: "dd/mm/yyyy (hh:mm)",
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  servicesCategory
                                          .toString()
                                          .contains("Service")
                                      ? SizedBox(
                                          height: 30,
                                        )
                                      : SizedBox(),
                                  Text(
                                    "Description",
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      color: Constants.greyTextColor,
                                      fontSize: 14,
                                      fontFamily: "Bliss Pro",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: mediaQueryWidth,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0x33898a8d),
                                        width: 1,
                                      ),
                                      color: Color(0xfffafafa),
                                    ),
                                    child: TextFormField(
                                      onChanged: (text) {
                                        checkColor();
                                      },
                                      style: TextStyle(
                                        color: Constants.headingBlackColor,
                                        fontSize: 18,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                      controller: description,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(10),
                                        labelStyle: TextStyle(
                                          color: Constants.labelTextColor,
                                          fontSize: 16,
                                          fontFamily: "Bliss Pro",
                                          fontWeight: FontWeight.w500,
                                        ),
                                        hintText: "Write your description...",
                                        hintStyle: TextStyle(
                                          color: Color(0xcc181b19),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              createTicket();
                            },
                            child: Container(
                              width: mediaQueryWidth,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: colorChange == true
                                    ? Constants.greenColor
                                    : Constants.greyButtonColor,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 62,
                                vertical: 14,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Opacity(
                                    opacity: 0.90,
                                    child: Text(
                                      "Submit",
                                      textScaleFactor: 1.0,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: colorChange == true
                                            ? Constants.whiteText
                                            : Constants.greyButtonTextColor,
                                        fontSize: 16,
                                        fontFamily: "Bliss Pro",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  load == true ? LoadingHome() : SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> getservicesCategoryFromWeb() async {
    // test nowsole
    var jsonData = await ticketServiceGet();
    setState(() {
      // what is happening >
      for (Map category in jsonData) {
        servicesCategoryList
            .add(new Dropdown(category["id"], category["name"]));
      }
    });
  }

  Future<Null> getissueCategoryFromWeb() async {
    var enc = await encryptData({
      "service_id": servicesCategoryID,
    });

    // test nowsole
    var jsonData = await ticketIssueGet(enc);
   
    setState(() {
      // what is happening >

      for (Map category in jsonData) {
        issueCategoryList.add(new Dropdown(category["id"], category["name"]));
      }
     
    });
  }

  void createTicket() async {
    setState(() {
      load = true;
    });

    var enc = await encryptData({
      "user_id": userId,
      "service": servicesCategoryID,
      // "issue_type": issueCategory.contains("Other") ? issueText.text: issueCategory,
      "time": dateTicket,
      "message": description.text
    });

  
    var dataAPI = await createTicketAPI(enc);
   

    if (dataAPI["RETURN_FLAG"] == true) {
      setState(() {
        isNewTicket = true;
      });
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              dataAPI["RETURN_MSG"],
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
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MyTicket(),
                      ));
                },
                child: Container(
                  width: 250,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 62,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ok",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfffafafa),
                          fontSize: 16,
                          fontFamily: "Bliss Pro",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      WebResponseExtractor.showToast(dataAPI["RETURN_MSG"]);
    }
    setState(() {
      load = false;
    });
  }

  void checkColor() {
    if (servicesCategoryID == "") {
      setState(() {
        colorChange = false;
      });
    } else {
      if (description.text == "") {
        setState(() {
          colorChange = false;
        });
      } else {
        if (issueText.text == "" && showTextIssue == true) {
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
}

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime currentTime, LocaleType locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex())
        : DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex());
  }
}

class Dropdown {
  String id;
  String name;
  Dropdown(this.id, this.name);
  String get Name => name;
  String get Id => id;
}
