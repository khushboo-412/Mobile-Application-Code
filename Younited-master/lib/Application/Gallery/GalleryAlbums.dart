import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Application/Gallery/FullScreenImage.dart';
import 'package:younited_application/Models/GalleryAlbumModel.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:younited_application/main.dart';

import 'package:http/http.dart' as http;

class GalleryAlbum extends StatefulWidget {
  @override
  _GalleryAlbumState createState() => _GalleryAlbumState();
}

class _GalleryAlbumState extends State<GalleryAlbum> {
  String _error = 'Error Uploading Image';
  String _apiStatus = "Loading...";

  //Future<File> file;
  List<Asset> images = List<Asset>();
  List<String> imagePath;
  Dio dio = Dio();
  TextEditingController albumName = TextEditingController();
  Future<GalleryAlbumModelList> albumList;

  @override
  void initState() {
    super.initState();
    imagePath = new List();
    albumList = getAlbumList();
  }

  Future<void> _showChooseDialogBox(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Upload",
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // showImage();
                      loadAssets();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Image',
                      textScaleFactor: 1.0,
                    ),
                  ),
                  //SizedBox(height: 30),
                  /* GestureDetector(
                    onTap: () {
                      showVideo();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Video',
                      textScaleFactor: 1.0,
                    ),
                  ),*/
                ],
              ),
            ),
          );
        });
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 15,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Choose Picture",
          allViewTitle: "All Photos",
          useDetailsView: true,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    for (int i = 0; i < resultList.length; i++) {
      imagePath.add(
          await FlutterAbsolutePath.getAbsolutePath(resultList[i].identifier));
      // print("Image Path:- ${imagePath[i]}");
    }
    setState(() {
      images = resultList;
      uploadMultipleImage(imagePath);
      _error = error;
    });
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
          padding: const EdgeInsets.fromLTRB(20, 15, 15, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomWidgets.sizedBox(width: 10),
                  Container(
                      child: MaterialButton(
                    onPressed: () {
                      _showMyDialog();

                      //_showChooseDialogBox(context);
                    },
                    color: Colors.white,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.all(15),
                    shape: CircleBorder(),
                    elevation: 20,
                  )),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Container(
                    child: FutureBuilder<GalleryAlbumModelList>(
                      future: albumList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot != null) {
                          return GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: snapshot.data.galleryAlbumList.length,
                              itemBuilder: (BuildContext context, int index) {
                                String placeHolder = snapshot
                                    .data.galleryAlbumList[index].images
                                    .split(',')[0];
                                return GestureDetector(
                                  onTap: () {
                                    Map<String, dynamic> args = {
                                      "imageLink" : snapshot.data.galleryAlbumList[index].images,
                                      "albumName" : snapshot.data.galleryAlbumList[index].albumName
                                    };
                                    Navigator.pushNamed(context, '/openAlbum', arguments: args);
                                  },
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 200,
                                            color: Colors.grey,
                                            child: CachedNetworkImage(
                                              imageUrl: placeHolder,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  new CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      new Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          color: ThemeColors.appbarColor,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              snapshot
                                                  .data
                                                  .galleryAlbumList[index]
                                                  .albumName,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return Center(child: Text("$_apiStatus"));
                        }
                      },
                    ),
                  ),

                  //buildGridView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future uploadMultipleImage(List<String> imagePath) async {
    if (imagePath.isNotEmpty) {
      try {
        // Adding Url and other stuff with files
        var formData = FormData();
       /* formData.fields.addAll([
          MapEntry("userID", userIDMain),
          MapEntry("AssociationID", associationIdMain),
          MapEntry("AlbumName", albumName.text),
        ]);*/

        // Adding Images In Form
        List<MultipartFile> imageFiles = new List();

        for (var file in imagePath) {
          imageFiles.add(await MultipartFile.fromFile(file));
        }

        formData = FormData.fromMap({
          "userID": userIDMain,
          "AssociationID": associationIdMain,
          "AlbumName": albumName.text,
          "fileToUpload": imageFiles
        });

        final response = await dio.post(WebApis.GALLERY_ALBUM, data: formData);

        if (response.statusCode == 200) {
          print(response.data['RETURN_MESSAGE']);
          WebResponseExtractor.showToast(response.data['RETURN_MESSAGE']);
          albumList = getAlbumList();
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      WebResponseExtractor.showToast("Please Select Image");
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Album'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: albumName,
                  decoration: InputDecoration(hintText: "Enter Album Name"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Create"),
              onPressed: () {
                if (albumName.text.isNotEmpty) {
                  Navigator.of(context).pop();
                  _showChooseDialogBox(context);
                }
              },
            ),
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<GalleryAlbumModelList> getAlbumList() async {
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
      List<dynamic> imagesData = data['data']; //GalleryA
      // lbumModelList.fromJson(data['data']);

      /* List<Map<String, String>> imagesLinkList = new List();

      for (int i = 0; i < imagesData.length; i++) {
        List<dynamic> innerImages = imagesData[i]['Images'].split(',');
        innerImages.removeLast();
        for (int j = 0; j < innerImages.length; j++) {
          // print(innerImages[j].trim());
          Map<String, String> image = {"image": innerImages[j].trim()};
          imagesLinkList.add(image);
        }
      }*/

      return GalleryAlbumModelList.fromJson(data['data']);
    } else {
      throw Exception('failed to load');
    }
  }
}

// ignore: must_be_immutable
class ShowAlbumImages extends StatefulWidget {
  var data;
  ShowAlbumImages(this.data);

  @override
  _ShowAlbumImagesState createState() => _ShowAlbumImagesState();
}

class _ShowAlbumImagesState extends State<ShowAlbumImages> {

  String images;
  List<dynamic> getImages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages = widget.data['imageLink'].split(',');
    getImages.removeLast();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeColors.appbarColor,
      appBar: AppBarWidget.centerTitleAppbar(context, '${widget.data['albumName']}'),
      // Page Name Here
      body: MainContainerWidget(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
          child: Container(
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: getImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return getGalleryImages(getImages[index]);
                }),
          ),
        ),
      ),
    );
  }

  Widget getGalleryImages(String imageLink) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return FullScreenImage(
                  imageUrl: imageLink,
                  tag: "generate_a_unique_tag",
                );
              }));
            },
            child: CachedNetworkImage(
              imageUrl: imageLink,
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}








/*Future uploadMultipleImage1(List images) async {
    try {
      // Url To upload Files
      var uri = Uri.parse(WebApis.GALLERY_ALBUM);

      // Adding Url and other stuff with files
      http.MultipartRequest request = new http.MultipartRequest('POST', uri);
      request.fields['userID'] = '1';
      request.fields['AssociationID'] = '6';
      request.fields['AlbumName'] = 'my';

      // Adding File and Posting data
      List<MultipartFile> newList = new List<MultipartFile>();

      for (int i = 0; i < images.length; i++) {
        File imageFile = File(images[i].toString());
        var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
        var length = imageFile.toString().length;
        print("length:" + length.toString());
        var multipartFile = new http.MultipartFile("Images", stream, length, filename: basename(imageFile.path));
        newList.add(multipartFile);
      }
      request.files.addAll(newList);
      var response = await request.send();
      if (response.statusCode == 200) {
        print("Image Uploaded");
      } else {
        print("Upload Failed");
      }
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
    } catch (e) {
      print(e.toString());
    }
  }*/
// select photos and upload
/* Future<void> uploadMultipleImage() async {

    // Adding Url and other stuff with files
    var formData = FormData();

    // Other parameters of the back-end interface
    //Map<String, dynamic> params = Map();

    formData.fields.addAll([
      MapEntry("userID", "1"),
      MapEntry("AssociationID", "6"),
      MapEntry("AlbumName", "First Post"),
    ]);

    // Upload photos one by one when uploading
    for(int i = 0; i < images.length; i++) {
      // Get ByteData
      ByteData byteData = await images[i].getByteData();
      List<int> imageData = byteData.buffer.asUint8List();

      MultipartFile multipartFile = MultipartFile.fromBytes(
        imageData,
        // file type
        contentType: MediaType("image", "jpg"),
      );
      formData = FormData.fromMap({
        // Parameter name of the back-end interface
        "fileToUpload": multipartFile
      });

    }
    // Use dio to upload pictures
    var response = await dio.post(WebApis.GALLERY_ALBUM, data: formData);
    if (response.statusCode == 200) {
      print(response.data['RETURN_MESSAGE']);
      WebResponseExtractor.showToast(response.data['RETURN_MESSAGE']);
    }}*/

/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:file_picker/file_picker.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path/path.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Services/WebApis.dart';
import 'package:younited_application/Services/WebResponseExtractor.dart';
import 'package:younited_application/Utils/CustomWidgets.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';
import 'package:async/async.dart';
String errorMessage = "";
class GalleryAlbum extends StatefulWidget {
  @override
  _GalleryAlbumState createState() => _GalleryAlbumState();
}

class _GalleryAlbumState extends State<GalleryAlbum> {
  DateTime pickDate;
  TimeOfDay time;
  String status = '';
  File imageFile;
  String message = "";
  String errMessage = 'Error  Uploading Image';
  String fileName;
  List<Asset> images = List<Asset>();
  List<Asset> videos = List<Asset>();
  List<File> listImages = [];
  String _path;
  Map<String, String> _paths = {};

  String _extension;
  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      primary: false,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    try {
     resultList = await MultiImagePicker.pickImages(
        maxImages: 15,
        enableCamera: true,
        selectedAssets: images,

        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
      _paths = await FilePicker.getMultiFilePath(
          type: FileType.video, allowedExtensions: (_extension?.isNotEmpty ?? false)? _extension?.replaceAll(' ', '')?.split(',') : null);
      _paths.forEach((fileName, filePath) => videos.add(Asset(fileName, filePath, null, null)));

      resultList.addAll(videos);


    } on Exception catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      images = resultList;
      uploadMultipleImage(images);
    });
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
          padding: const EdgeInsets.fromLTRB(20, 15, 15, 0),
          child: Column(
              children: [
                Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomWidgets.sizedBox(width: 10),

              Container(
                  child: MaterialButton(
                    onPressed: () {
                      loadAssets();
                    },
                    color: Colors.white,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.all(15),
                    shape: CircleBorder(),
                    elevation: 20,
                  )),


          ],
          ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: buildGridView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future uploadMultipleImage(List images) async {
    var uri = Uri.parse(WebApis.GALLERY_ALBUM);
    http.MultipartRequest request = new http.MultipartRequest('POST', uri);
    request.fields['userID'] = '1';
    request.fields['AssociationID'] = '1';
    request.fields['AlbumName'] = 'my';

    List<MultipartFile> newList = new List<MultipartFile>();

    for (int i = 0; i < images.length; i++) {
      File imageFile = File(images[i].toString());
      var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      print("ls:" + length.toString());
      var multipartFile = new http.MultipartFile("Images", stream, length,
          filename: basename(imageFile.path));
      newList.add(multipartFile);
    }
    request.files.addAll(newList);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

}


 */

/* Future<void> loadAssets() async {

    try{
      List<Asset> resultList = List<Asset>();
         Map<String,String> filePaths = await FilePicker.getMultiFilePath(type: FileType.any); // to pick multiple image files

     allNames = filePaths.keys; // List of file names
     allPaths = filePaths.values;
    filePaths.forEach(( allNames, allPaths) => resultList.add(Asset(allNames, allPaths, null, null)));


      image
          ? resultList = await MultiImagePicker.pickImages(
        maxImages: 15,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      )
          : SizedBox();

       video
        ? {
            // ignore: unnecessary_statements
            //  List<File> files = await FilePicker.getMultiFile(),
            _videos = await FilePicker.getMultiFilePath(type: FileType.video),
            videos.add(Asset(fileName, filePath, 15, 15)),

            resultList.addAll(videos),
              vid = await picker.getVideo(source: ImageSource.gallery),

       _videoSelected = File(vid.path),

       _videoPlayerController = VideoPlayerController.file(_videoSelected)
         ..initialize().then((_) {
           setState(() {});
           _videoPlayerController.play();
         }),
          }
        : SizedBox();

        _videos = await FilePicker.getMultiFilePath(type : FileType.video),
         videos.add(Asset(fileName, filePath, 15, 15)),


     resultList.addAll(videos),
       if (_videoSelected != null)
      _videoPlayerController.value.initialized
          ? AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: VideoPlayer(_videoPlayerController),
      )
          : Container();

      if (!mounted) return;
      setState(() {
        images = resultList;
        //videoUpload = _videos;
        uploadMultipleImage(images);
        //images.add(vid);
        // _uploadVideo();
      });
    }catch(e){
      print(e.toString());
    }

  }*/

/*void showImage() {
    setState(() {
      image = true;
     // video = false;
    });
  }*/

/*void showVideo() {
    setState(() {
      image = false;
      video = true;
    });
  }*/

/*
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:storage_path/storage_path.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';

import 'image_path_model.dart';

class GalleryAlbum extends StatefulWidget {
  @override
  _GalleryAlbumState createState() => _GalleryAlbumState();
}

class _GalleryAlbumState extends State<GalleryAlbum> {
  List<ImagePathModel> data;
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
        child: FutureBuilder(
          future: StoragePath.imagesPath,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              data = List<ImagePathModel>.from(json
                  .decode(snapshot.data)
                  .map((x) => ImagePathModel.fromJson(x)));

              return _galleryWidget(data);
            }
            return _galleryWidget(data);
           /* return Center(
              child: Text('Loading...'),
            );*/
          },
        ),
      ),
    );
  }

  Widget _galleryWidget(List<ImagePathModel> data) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1,
      shrinkWrap: true,
      children: data
          .map((e) => Stack(
        children: <Widget>[
          Image.file(
            File(
              e.files[0],
            ),
            fit: BoxFit.cover,
            height: 180,
            width: MediaQuery.of(context).size.width/2,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: MediaQuery.of(context).size.width/2,
            child: Text(
              e.folderName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )
        ],
      ))
          .toList(),
    );
  }
}

*/
/*
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:storage_path/storage_path.dart';
import 'package:younited_application/AppBarWidget/AppBarWidget.dart';
import 'package:younited_application/Application/Drawer/Drawer.dart';
import 'package:younited_application/Utils/ThemeColors.dart';
import 'package:younited_application/Widgets/MainContainerWidget.dart';

import 'image_path_model.dart';

class GalleryAlbum extends StatefulWidget {
  @override
  _GalleryAlbumState createState() => _GalleryAlbumState();
}

class _GalleryAlbumState extends State<GalleryAlbum> {
  List<AssetEntity> assets = [];

  @override
  void initState() {
    _fetchAssets();
    super.initState();
  }

  _fetchAssets() async {
    // Set onlyAll to true, to fetch only the 'Recent' album
    // which contains all the photos/videos in the storage
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final recentAlbum = albums.first;

    // Now that we got the album, fetch all the assets it contains
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );

    // Update the state and notify UI
    setState(() => assets = recentAssets);
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
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // A grid view with 3 items per row
          crossAxisCount: 3,
        ),
        itemCount: assets.length,
        itemBuilder: (_, index) {
          return AssetThumbnail(asset: assets[index]);
        },
      ),
    ),
    );
  }
}


class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({
    Key key,
    @required this.asset,
  }) : super(key: key);

  final AssetEntity asset;

  @override
  Widget build(BuildContext context) {
    // We're using a FutureBuilder since thumbData is a future
    return FutureBuilder<Uint8List>(
      future: asset.thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        // If we have no data, display a spinner
        if (bytes == null) return CircularProgressIndicator();
        // If there's data, display it as an image
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  if (asset.type == AssetType.image) {
                    // If this is an image, navigate to ImageScreen
                    return ImageScreen(imageFile: asset.file);
                  } else {
                    // if it's not, navigate to VideoScreen
                    return VideoScreen(videoFile: asset.file);
                  }
                },
              ),
            );
          },
          child: Stack(
            children: [
              // Wrap the image in a Positioned.fill to fill the space
              Positioned.fill(
                child: Image.memory(bytes, fit: BoxFit.cover),
              ),
              // Display a Play icon if the asset is a video
              if (asset.type == AssetType.video)
                Center(
                  child: Container(
                    color: Colors.blue,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    Key key,
    @required this.imageFile,
  }) : super(key: key);

  final Future<File> imageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: FutureBuilder<File>(
        future: imageFile,
        builder: (_, snapshot) {
          final file = snapshot.data;
          if (file == null) return Container();
          return Image.file(file);
        },
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  const VideoScreen({
    Key key,
    @required this.videoFile,
  }) : super(key: key);

  final Future<File> videoFile;

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _controller;
  bool initialized = false;

  @override
  void initState() {
    _initVideo();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _initVideo() async {
    final video = await widget.videoFile;
    _controller = VideoPlayerController.file(video)
    // Play the video again when it ends
      ..setLooping(true)
    // initialize the controller and notify UI when done
      ..initialize().then((_) => setState(() => initialized = true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initialized
      // If the video is initialized, display it
          ? Scaffold(
        body: Center(
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: VideoPlayer(_controller),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Wrap the play or pause in a call to `setState`. This ensures the
            // correct icon is shown.
            setState(() {
              // If the video is playing, pause it.
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }
            });
          },
          // Display the correct icon depending on the state of the player.
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      )
      // If the video is not yet initialized, display a spinner
          : Center(child: CircularProgressIndicator()),
    );
  }
}
*/
