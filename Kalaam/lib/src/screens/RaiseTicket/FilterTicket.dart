// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps
import 'package:kalaam/src/services/Library.dart';

class FilterTicket extends StatefulWidget {
  @override
  FilterTicketState createState() => FilterTicketState();
}
class FilterTicketState extends State<FilterTicket> {
int sortTime = 0;
List checkBox= [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
  @override
  void initState() {
    super.initState();
    if(filters.contains("Open")){
      checkBox[0]=true;
    }
    if(filters.contains("Hold")){
      checkBox[1]=true;
    }
    if(filters.contains("Closed")){
      checkBox[2]=true;
    }
    if(filters.contains("Oldest to Latest")){
      sortTime=1;
    }
    if(filters.contains("Latest to Oldest")){
      sortTime=0;
    }
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


        appBar: AppBar(
          backgroundColor: Constants.backgroundWhiteColor,
          iconTheme: IconThemeData(color: Colors.black),
          leading: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MyTicket(),
                    ));
              },
              child: Icon(Icons.arrow_back_ios, color: Constants.headingBlackColor,)),
          title: Text(
            "Filter My Ticket",
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
        body: SingleChildScrollView(
          child: Container(
            color: Constants.backgroundWhiteColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Text(
                    "Filter By Status",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Constants.headingBlackColor,
                      fontSize: 18,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    //height: cartDataList.length*150.0,

                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // This next line does the trick.

                        itemCount: ticketStatus.length,
                        itemBuilder: (context, index) {
                          return status(ticketStatus[index], index, ticketStatus);
                        }),
                  ),
                 /* Row(
                    children: [
                      Container(
                        height: 20,width: 20,
                        child: Theme(
                          data: ThemeData(unselectedWidgetColor: Constants.greySliderColor),

                          child: Checkbox(value: checkBox[1],
                            activeColor: Constants.greenColor,
                            onChanged: (bool value) {
                              setState(() {
                                checkBox[1] = !checkBox[1];
                                if(checkBox[1]){
    if(filters.contains("Hold")){}else{
    filters.add("Hold");}
    }
                              });
                            },

                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "Hold",
                        style: TextStyle(
                          fontFamily: "Bliss Pro",
                          color: Constants.greyHelpColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        height: 20,width: 20,
                        child: Theme(
                          data: ThemeData(unselectedWidgetColor: Constants.greySliderColor),

                          child: Checkbox(value: checkBox[2],
                            activeColor: Constants.greenColor,
                            onChanged: (bool value) {
                              setState(() {
                                checkBox[2] = !checkBox[2];
                                if(checkBox[2]){
    if(filters.contains("Closed")){}else{
    filters.add("Closed");}
    }                                }
                          );
                            },

                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "Closed",
                        style: TextStyle(
                          fontFamily: "Bliss Pro",
                          color: Constants.greyHelpColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
*/
                  Container(
                    width: mediaQueryWidth,
                    height: 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Constants.greySliderColor, width: 2, ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Sort By Time",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Constants.headingBlackColor,
                      fontSize: 18,
                      fontFamily: "Bliss Pro",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        sortTime =0;

                      });
                    },
                    child: Container(
                      width: mediaQueryWidth,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            height: 20,width: 20,
                            child: Theme(
                              data: ThemeData(unselectedWidgetColor: Constants.greySliderColor),

                              child: Radio(value: 0,

                                activeColor: Constants.greenColor,

                                groupValue: sortTime, onChanged: (int value) {
                                  setState(() {
                                    sortTime =0;

                                  });                            },

                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            "Latest to Oldest",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontFamily: "Bliss Pro",
                              color: Constants.greyHelpColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        sortTime = 1;

                      });
                    },
                    child: Container(
                      width: mediaQueryWidth,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            height: 20,width: 20,
                            child: Theme(
                              data: ThemeData(unselectedWidgetColor: Constants.greySliderColor),

                              child:Radio(value: 1,

activeColor: Constants.greenColor,
                                groupValue: sortTime, onChanged: (int value) {
                                setState(() {
                                  sortTime =1;

                                });
                                },

                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            "Oldest to Latest",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontFamily: "Bliss Pro",
                              color: Constants.greyHelpColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),



                ],
              ),
            ),

          ),
        ),
        bottomNavigationBar:Container(
          color: Constants.backgroundWhiteColor,
          height: 130,
          child:  Padding(
            padding: EdgeInsets.all(mediaQueryWidth*0.04),
            child:  Column(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      filters.clear();
                      selectTicketStatus.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MyTicket(),
                          ));
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: mediaQueryWidth,

                    child: Center(
                      child: SizedBox(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                "Clear Filter",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Bliss Pro",
                                  color: Constants.greenColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  color: Constants.backgroundWhiteColor,
                  child:  Padding(
                    padding: EdgeInsets.all(mediaQueryWidth*0.04),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          if(sortTime==0){
                            if(filters.contains("Latest to Oldest")){}else{
                              filters.add("Latest to Oldest");

                            }
                            selectTicketName.add({
                              "name": "Latest to Oldest",
                              "value": "desc"
                            });
                          }
                          else if (sortTime==1)
                          {
                            if(filters.contains("Oldest to Latest")){}else{
                              if(filters.contains("Latest to Oldest")){
                                filters.remove("Latest to Oldest");
                              }
                              filters.add("Oldest to Latest");
                              selectTicketName.add({
                                "name":"Oldest to Latest",
                                "value": "asc"
                              });
                            }
                          }
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MyTicket(),
                            ));

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
                                "Apply Filter",
                                textScaleFactor: 1.0,
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
                ),],
            ),
          ),
        ),


      ),
    );
  }
Widget status(Map data, int i , List list){
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 20,width: 20,
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Constants.greySliderColor),

                child: Checkbox(value: checkBox[i],
                  activeColor: Constants.greenColor,
                  onChanged: (bool value) {
                    setState(() {
                      checkBox[i] = !checkBox[i];
                      if(checkBox[i]){

                        if(filters.contains(data["name"])){}else{
                          filters.add(data["name"]);}

                        if(selectTicketStatus.contains(data["value"].toString())){}else{
                          selectTicketStatus.add(data["value"].toString());}



                          selectTicketName.add({
                            "name": data["name"].toString(),
                            "value": data["value"].toString()
                          });
                      }
                      else{
                        filters.remove(data["name"]);
  selectTicketStatus.remove(data["value"].toString());}






                    });
                  },

                ),
              ),
            ),
            SizedBox(width: 10,),
            Text(
              data["name"],
              textScaleFactor: 1.0,
              style: TextStyle(
                fontFamily: "Bliss Pro",
                color: Constants.greyHelpColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
      ],
    );
}
  Widget ticket(String status){
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Container(
      width:mediaQueryWidth ,
      decoration: BoxDecoration(
        border: Border.all(color: Constants.backgroundWhiteColor, width: 1, ),


      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            "Title of the issue",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: Color(0xcc1c201d),
                              fontSize: 18,
                              fontFamily: "Bliss Pro",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Sub text",
                            style: TextStyle(
                              color: Color(0xcc1c201d),
                              fontSize: 13,fontFamily: "Bliss Pro"
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0c000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: status == "P" ?Color(0xffd78b10): Constants.greenColor,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8,3,8,3),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Text(
                              status == "P"?"In Progress": "Closed",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: Color(0xfff4f4f4),
                                fontSize: 12,
                                fontFamily: "Bliss Pro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: mediaQueryWidth,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.greyButtonColor, width: 1, ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  "10/05/12",
                  
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Color(0x7f1c201d),
                    fontSize: 12,
                    fontFamily: "Bliss Pro",
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.72,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "TICKET #0132",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Color(0x991c201d),
                    fontSize: 12,
                    fontFamily: "Bliss Pro",
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.72,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: mediaQueryWidth,
            height: 2,
            decoration: BoxDecoration(
              border: Border.all(color: Constants.greyButtonColor, width: 1, ),
            ),
          ),

          SizedBox(height: 10,),

        ],
      ),
    );
  }






}


