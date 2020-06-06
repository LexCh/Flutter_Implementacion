import 'package:flutter/material.dart';


class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.pets ),
              iconSize: 150.0,
              onPressed: () {}),
          Text('UNIVERSIDAD DE LAS AMERICAS',style: new TextStyle(fontSize: 24.0),),
           Text('Seminario de Sistemas',style: new TextStyle(fontSize: 24.0),),
            Text('',style: new TextStyle(fontSize: 24.0),),
             Text('CORREO ',style: new TextStyle(fontSize: 24.0),),
             Text(' alex.chsql@gmail.com',style: new TextStyle(fontSize: 24.0),),
             Text('alex.chicaiza@udla.edu.ec',style: new TextStyle(fontSize: 24.0),)
        ],
      )
    );
  }
}