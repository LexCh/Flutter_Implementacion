import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutterimplement/pages/home.dart';
import 'package:flutterimplement/pages/pageAndroid.dart';
import 'package:flutterimplement/pages/pageCrud.dart';
import 'package:flutterimplement/pages/pageGmap.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  final PageAndroid _android = PageAndroid();
  final PageCrud _name = PageCrud();
  final PageGooglemap _mapa = PageGooglemap();
  final PageHome _home = PageHome();

  Widget _showPage = new PageHome();

  Widget _pageChooser(int page){
    switch (page) {
      case 0:
      return _android;        
        break;

      case 1:
      return _home;        
        break;

      case 2:
      return _name;        
        break;

      case 3:
      return _mapa;        
        break;

      case 4:
      return _android;        
        break;
      default:
      return new Container(
        child: new Center(
          child: new Text(
            'NO PAGE FOUND',
            style: new TextStyle(fontSize: 30),
          ))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          //initialIndex: pageIndex,          
          items: <Widget>[
            Icon(Icons.android, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.group_add, size: 30),
            Icon(Icons.pin_drop, size: 30),            
            Icon(Icons.android, size: 30),
          ],
          color: Colors.yellow,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.green,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),    
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage,              
            ),
        ));
  }
}

