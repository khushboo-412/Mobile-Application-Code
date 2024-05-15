import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:younited_application/Utils/ThemeColors.dart';

import 'GalleryAlbums.dart';
import 'GalleryPictures.dart';

class GalleryMain extends StatefulWidget {
  @override
  _GalleryMainState createState() => _GalleryMainState();
}

class _GalleryMainState extends State<GalleryMain> {
  int _currentIndex = 0;
  int _selectedIndex = 0;

  final List<Widget> _children = [
    GalleryPictures(),
    GalleryAlbum(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, "/dashboard");
        return;
      },
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add_photo_alternate_outlined, size: 15),
              label: 'Pictures',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_on, size: 15),
              label: 'Album',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ThemeColors.appbarColor,
          onTap: onTabTapped,
        ),
      ),
    );
  }
}
