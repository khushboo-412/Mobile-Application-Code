import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';

class CreateCatalog extends StatefulWidget {
  @override
  _CreateCatalogState createState() => _CreateCatalogState();
}

class _CreateCatalogState extends State<CreateCatalog> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeColors.appbarColor,
      appBar: AppBarWidget.centerTitleAppbar(context, "Create Catalogue"),
      // Page Name Here
      body: MainContainerWidget(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      child: ListTile(
                        title: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              hintText: 'Search',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              )),
                          validator: (val) => val.length < 1 ? '' : null,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                        ),
                      ),
                    ),
                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white,
                              width: 0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                      elevation: 10,
                      child: Text(
                        'Create Offer',
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              CustomWidgets.sizedBox(height: 5.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        'Catalogues',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      shape: new RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white,
                              width: 0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.add, size: 15, color: Colors.white),
                          // icon
                          CustomWidgets.sizedBox(width: 10.0),
                          Text(
                            'Create Catalogue',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      color: Colors.amber[400],
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              CustomWidgets.sizedBox(height: 15.0),
              cardListItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardListItem(){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(15),
      elevation: 20,
      color: Colors.white,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomWidgets.sizedBox(height: 20.0),
                Text("Gold Watch",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                Text("Total Product: 07",
                    style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline)),
                CustomWidgets.sizedBox(height: 20.0),
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('images/goldWatch.jpg'),
                ),
                CustomWidgets.sizedBox(height: 20.0),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Switch.adaptive(
                    value: true,
                    onChanged: (newValue) {},
                    activeColor: Colors.greenAccent,
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  elevation: 2.0,
                  color: Colors.white,
                  child: Icon(
                    Icons.add_link,
                    size: 15.0,
                  ),
                  shape: CircleBorder(),
                ),
                RaisedButton(
                  onPressed: () {},
                  elevation: 2.0,
                  color: Colors.white,
                  child: Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                  shape: CircleBorder(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
