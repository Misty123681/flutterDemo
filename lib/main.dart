import 'package:flutter/material.dart';
import 'package:flutter_widget1/Calculator.dart';
import 'package:flutter_widget1/HomeScreen.dart';
import 'package:flutter_widget1/StreamBuilder/ContactStream.dart';
import 'package:flutter_widget1/CustomScrollViewDemo.dart';
import 'package:flutter_widget1/Neostore/NeoLoginView.dart';
import 'Album/GridUiCustom.dart';
import 'ListDemo/ProductListView.dart';
import 'Database/NoteList.dart';

final routes =
  <String, WidgetBuilder>{
    '/CustomScrollViewDemo': (BuildContext context) =>
    new CustomScrollViewDemo(),
    '/IncrementData': (BuildContext context) => new ContactStream(),
    '/Calculator': (BuildContext context) => new Calculator(),
    '/GridUiCustom':(BuildContext context) => new GridUiCustom(),
    '/ProductListView' :(BuildContext context) => new ProductListView(),
    '/NeoLoginView' :(BuildContext context)=> new NeostoreView(),
    '/NoteList' : (BuildContext context) => new NoteList(),
};

void main() => runApp(MaterialApp(
      title: "My app",
      home: HomeScreen(),
      routes: routes,
      theme: ThemeData(primarySwatch: Colors.cyan),
    ));

