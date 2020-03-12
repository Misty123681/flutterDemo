

import 'package:flutter/material.dart';

final stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
      ],
    );


final ratings = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      stars,
      Text(
        '170 Reviews',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    ],
  );

final item = Container(
    padding: EdgeInsets.all(20),
    child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
              children: <Widget>[
                Text("camera"),
                Icon(Icons.camera, color: Colors.green[500]),
                Text("Tag 1"),
              ]
          ),
          Column(
              children: <Widget>[
                Text("search"),
                Icon(Icons.search, color: Colors.green[500]),
                Text("Tag 2"),
              ]
          ),
          Column(
              children: <Widget>[
                Text("add"),
                Icon(Icons.add, color: Colors.green[500]),
                Text("Tag 3"),
              ]
          ),
        ]
    )
);



class CustomViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
          child:  Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Click me!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  constraints: BoxConstraints(
                    maxHeight: 60,
                  ),
                  child: Text(
                    "123",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    maxLines: 3,
                  ),
                ),
                ratings,
                item
              ],
            ),
          )

      ),
    );
  }
}






