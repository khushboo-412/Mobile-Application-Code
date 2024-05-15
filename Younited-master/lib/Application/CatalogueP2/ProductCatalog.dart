import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Utils/AppAssets.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';

class ProductCatalog extends StatefulWidget {
  @override
  _ProductCatalogState createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeColors.appbarColor,
      appBar: AppBarWidget.centerTitleAppbar(context, "Product Catalogue"),
      drawer: Drawer(
      child: SideDrawer.sideDrawer(context),
    ),
      body: MainContainerWidget(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: mediaQueryWidth * 0.6,
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
                    Container(
                      height: mediaQueryHeight * 0.04,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.white,
                                width: 0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50)),
                        elevation: 10,
                        child: Text(
                          'Create Offer',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pushNamed("/createTradeOffers");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              CustomWidgets.sizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        'Camera Lens',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    Container(
                      height: mediaQueryHeight * 0.04,
                      child: RaisedButton(
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
                              'Add Product',
                              style: TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                        color: ThemeColors.buttonYellow,
                        onPressed: () {
                          Navigator.of(context).pushNamed("/createCatalog");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              CustomWidgets.sizedBox(height: 15.0),
              catalogList(mediaQueryWidth, mediaQueryHeight ),
              catalogList(mediaQueryWidth, mediaQueryHeight ),
              catalogList(mediaQueryWidth, mediaQueryHeight ),
            ],
          ),
        ),
      ),
    );
  }

  Widget catalogList(final mediaQueryWidth, final mediaQueryHeight ){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(15),
      elevation: 10,
      color: Colors.white,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Product Name: ",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                      Text("Description: ",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                      Text("Rate: ",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                      CustomWidgets.sizedBox(height: 15.0),
                      Text("Media: ",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sony SELP18105G Lens",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                      Text("1 Lens, Hood, Cap",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                      Text("Rs. 39,999/- ",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                      CustomWidgets.sizedBox(height: 4.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 50,
                            child:
                            Image.asset(AppAssets.productCatalogCamera),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            elevation: 2.0,
                            color: Colors.white,
                            child: Icon(
                              Icons.arrow_right,
                              size: 20.0,
                            ),
                            shape: CircleBorder(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomWidgets.sizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  elevation: 5,
                  child: Text(
                    'Create Offer',
                    style:
                    TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  color: Colors.amber[400],
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Switch.adaptive(
                      value: true,
                      onChanged: (newValue) {},
                      activeColor: Colors.greenAccent,
                    ),
                    Icon(
                      Icons.add_link,
                      size: 20.0,
                    ),
                    CustomWidgets.sizedBox(width: 15.0),
                    Icon(
                      Icons.settings,
                      size: 20.0,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
