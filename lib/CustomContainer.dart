
import 'package:flutter/material.dart';
import 'dart:math';

class CustomConatiner extends StatefulWidget {
  @override
  _CustomConatineState createState() => _CustomConatineState();
}

class _CustomConatineState extends State<CustomConatiner> {
  
  List<Color>randomColor = [
    Colors.red,
    Colors.blue,
    Colors.black87,
    Colors.cyan,
    Colors.orange,
  ];

  int index = 0;
  Color colorrightNow;
  
  void changeBackgrounColor(){
    setState(() {
      index = Random().nextInt(randomColor.length);
      colorrightNow = randomColor[index];
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorrightNow,
        shape: BoxShape.rectangle
      ),
      width: double.infinity,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
         Padding(
           padding: EdgeInsets.only(top: 20,bottom: 20),
           child: Text(
             "My App cloum",
             style: TextStyle(
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
             ),
             textAlign: TextAlign.center,
           ),
         ),
          Padding(
            padding: EdgeInsets.only(top: 20,bottom: 20),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text("  Login  ", style: TextStyle(fontSize: 20.0)),
                splashColor: Colors.cyan,
                elevation: 10.0,
                onPressed: () {},
              ),
              RaisedButton(
                child: Text("  signup ", style: TextStyle(fontSize: 20.0)),
                splashColor: Colors.cyan,
                elevation: 10.0,
                onPressed: () {},
              )
            ],
          ),

          ),
          RaisedButton(
            child: Text("Change color", style: TextStyle(fontSize: 20.0)),
            splashColor: Colors.cyan,
            elevation: 10.0,
            onPressed: changeBackgrounColor,
          ),

        ],
      ),
    );
  }
}
