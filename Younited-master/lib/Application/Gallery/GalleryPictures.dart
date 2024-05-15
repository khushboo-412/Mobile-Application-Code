import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Models/GalleryAlbumModel.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';

import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:http/http.dart' as http;
import 'FullScreenImage.dart';

class GalleryPictures extends StatefulWidget {
  @override
  _GalleryPicturesState createState() => _GalleryPicturesState();
}

class _GalleryPicturesState extends State<GalleryPictures> {
  String _apiStatus = "Loading...";

  String images;
  List<String> getImages;
  Future<GalleryImagesModelList> galleryAlbumList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    galleryAlbumList = picturesLinks();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ThemeColors.appbarColor,
      appBar: AppBarWidget.centerTitleAppbar(context, 'Gallery'),
      // Page Name Here
      drawer: Drawer(
        child: SideDrawer.sideDrawer(context),
      ),
      body: MainContainerWidget(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
          child: FutureBuilder<GalleryImagesModelList>(
            future: galleryAlbumList,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot != null) {
                return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: snapshot.data.galleryImagesModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return getGalleryImages(
                          snapshot.data.galleryImagesModel[index]);
                    });
              } else {
                return Center(child: Text("$_apiStatus"));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget getGalleryImages(GalleryImagesModel galleryAlbumModel) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) {
                return FullScreenImage(
                  imageUrl:
                  galleryAlbumModel.imageLink,
                  tag: "generate_a_unique_tag",
                );
              }));
        },
        child: CachedNetworkImage(
          imageUrl: galleryAlbumModel.imageLink,
          placeholder: (context, url) => Container(width: 50, height: 50, child: new CircularProgressIndicator()),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
      ),
    );
  }

  Future<GalleryImagesModelList> picturesLinks() async {
    final response = await http.post(
      WebApis.GET_GALLERY_IMAGES,
      // body: json.encode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      Map data = WebResponseExtractor.filterWebData(response,
          dataObject: 'GET_IMAGES');
      setState(() {
        _apiStatus = data['message'];
        // print("Images:" + data['data'].toString());
      });

      List<dynamic> imagesData =
          data['data']; //GalleryA
    // lbumModelList.fromJson(data['data']);

      List<Map<String, String>> imagesLinkList = new List();

      for (int i = 0; i < imagesData.length; i++) {
        List<dynamic> innerImages = imagesData[i]['Images'].split(',');
        innerImages.removeLast();
        for (int j = 0; j < innerImages.length; j++) {
          // print(innerImages[j].trim());
          Map<String, String> image = {"image": innerImages[j].trim()};
          imagesLinkList.add(image);
        }
      }
      return GalleryImagesModelList.fromJson(imagesLinkList);
    } else {
      throw Exception('failed to load');
    }
  }
}

/*FutureBuilder<GalleryImagesModelList>(
              future: galleryAlbumList,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot != null) {
                  return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data.galleryImagesModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return getGalleryImages(
                            snapshot.data.galleryImagesModel[index]);
                      });

                  /* ListView.builder(
                    itemCount: snapshot.data.galleryAlbumList.length,
                    itemBuilder: (context, index) {
                      return
                       // meetingCardRequest(snapshot.data.meetings[index]);
                    },
                  );*/
                } else {
                  return Center(child: Text("$_apiStatus"));
                }
              },
            ),*/

/*Future<GalleryAlbumModelList> fetchGalleryImages() async {
    final response = await http.post(
      WebApis.GET_GALLERYIMAGES,
      // body: json.encode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      Map data = WebResponseExtractor.filterWebData(response,
          dataObject: 'GET_IMAGES');
      setState(() {
        _apiStatus = data['message'];
       // print("Images:" + data['data'].toString());

      });

      List<dynamic> imagesData = data['data']; //GalleryAlbumModelList.fromJson(data['data']);

      List<String> imagesLinkList = new List();

     for(int i = 0; i < imagesData.length; i++){
       List<dynamic> innerImages = imagesData[i]['Images'].split(',');
       innerImages.removeLast();
       for(int j = 0; j < innerImages.length; j++){
        // print(innerImages[j].trim());
         imagesLinkList.add(innerImages[j].trim());
       }
     }
     print(imagesLinkList.toString());
    } else {
      throw Exception('failed to load');
    }
  }*/
