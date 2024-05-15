import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';

class CreateTradeOffers extends StatefulWidget {
  @override
  _CreateTradeOffersState createState() => _CreateTradeOffersState();
}

class _CreateTradeOffersState extends State<CreateTradeOffers> {
  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final product = ["Laptop Blue Bag Color", "Other"];
    String dropdownValue1 = "Laptop Blue Bag Color";
    final discount = ["Amt", "%"];
    String dropdownValue2 = "Amt";

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: ThemeColors.appbarColor,
      appBar: AppBarWidget.centerTitleAppbar(context, 'Create Offer'),
      // Page Name Here
      body: MainContainerWidget(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 60),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Select Product  ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  CustomWidgets.sizedBox(height: 25.0),
                                  Text("Discount ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  CustomWidgets.sizedBox(height: 25.0),
                                  Text("Offer ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  CustomWidgets.sizedBox(height: 25.0),
                                  Text("Valid Till ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  CustomWidgets.sizedBox(height: 25.0),
                                  Text("Keywords ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  CustomWidgets.sizedBox(height: 25.0),
                                  Text("Response To: ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          decoration: TextDecoration.underline)),
                                  CustomWidgets.sizedBox(height: 10.0),
                                  Text("Mobile No.",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  CustomWidgets.sizedBox(height: 20.0),
                                  Text("Email Id. ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: mediaQueryWidth * 0.45,
                                    child: DropdownButtonFormField(
                                      value: dropdownValue1,
                                      icon: Icon(Icons.arrow_drop_down),
                                      decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.fromLTRB(5, 2, 2, 2),
                                        isDense: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(),
                                        ),
                                      ),
                                      items: product.map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(
                                            value,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue) {
                                        dropdownValue1 = newValue;
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Answer Type';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  CustomWidgets.sizedBox(height: 15.0),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 60.0,
                                        child: DropdownButtonFormField(
                                          value: dropdownValue2,
                                          icon: Icon(Icons.arrow_drop_down),
                                          decoration: InputDecoration(
                                            contentPadding:
                                            EdgeInsets.fromLTRB(5, 2, 2, 2),
                                            isDense: true,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.horizontal(),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.horizontal(),
                                            ),
                                          ),
                                          items: discount.map((String value) {
                                            return new DropdownMenuItem<String>(
                                              value: value,
                                              child: new Text(
                                                value,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            dropdownValue2 = newValue;
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return '';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      CustomWidgets.sizedBox(width: 5.0),
                                      Container(
                                        width: mediaQueryWidth * 0.27,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                            EdgeInsets.fromLTRB(5, 2, 2, 2),
                                            isDense: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.horizontal(),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.horizontal(),
                                            ),
                                          ),
                                          // The validator receives the text that the user has entered.
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return '';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomWidgets.sizedBox(height: 15.0),
                                  Container(
                                    width: mediaQueryWidth * 0.45,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.fromLTRB(5, 2, 2, 2),
                                        hintStyle: TextStyle(fontSize: 12),
                                        hintText: "Buy 2 at 30% off",
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(),
                                        ),
                                      ),
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Question';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  CustomWidgets.sizedBox(height: 15.0),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: mediaQueryWidth * 0.30,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                            EdgeInsets.fromLTRB(5, 2, 2, 2),
                                            hintStyle: TextStyle(fontSize: 12),
                                            hintText: "dd/mm/yyyy",
                                            isDense: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.horizontal(),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.horizontal(),
                                            ),
                                          ),
                                          // The validator receives the text that the user has entered.
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter Question';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Icon(Icons.calendar_today),
                                    ],
                                  ),
                                  CustomWidgets.sizedBox(height: 20.0),
                                  Container(
                                    width: mediaQueryWidth * 0.45,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.fromLTRB(5, 2, 2, 2),
                                        hintStyle: TextStyle(fontSize: 12),
                                        hintText: "Keywords",
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(),
                                        ),
                                      ),
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Question';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  CustomWidgets.sizedBox(height: 50.0),
                                  Container(
                                    width: mediaQueryWidth * 0.45,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.fromLTRB(5, 2, 2, 2),
                                        hintStyle: TextStyle(fontSize: 12),
                                        hintText: "##########",
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(),
                                        ),
                                      ),
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Question';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  CustomWidgets.sizedBox(height: 15.0),
                                  Container(
                                    width: mediaQueryWidth * 0.45,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.fromLTRB(5, 2, 2, 2),
                                        hintStyle: TextStyle(fontSize: 12),
                                        hintText: "name@email.com",
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(),
                                        ),
                                      ),
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Question';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomWidgets.sizedBox(height: 50),
                      Container(
                        height: mediaQueryHeight * 0.04,
                        width: mediaQueryWidth * 0.3,
                        child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Post Offer',
                                style: TextStyle(fontSize: 12, color: Colors.white),
                              ),
                              CustomWidgets.sizedBox(width: 10.0),
                              Icon(Icons.arrow_forward,
                                  size: 15, color: Colors.white),
                              // icon
                            ],
                          ),
                          color: Colors.amber[400],
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
