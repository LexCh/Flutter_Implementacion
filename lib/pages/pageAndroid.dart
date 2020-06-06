import 'package:flutter/material.dart';


class PageAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              color: Colors.green,
              icon: Icon(Icons.android ),
              iconSize: 150.0,
              onPressed: () {}),
          Text('ANDROID',style: new TextStyle(fontSize: 24.0),)
        ],
      )
    );
  }
}