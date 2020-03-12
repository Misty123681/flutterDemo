
import 'package:flutter/material.dart';

class CustomScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Floating app bar"),
            floating: true,
            flexibleSpace: new Image.asset("assets/images/images.png"),
            expandedHeight: 150.0,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 50,
            ),
          )
        ],
      ),
    );
  }
}