

import 'package:flutter/material.dart';
import 'package:flutter_widget1/Album/Album.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget1/Album/AlbumCell.dart';
import 'package:flutter_widget1/Album/AlbumDetails.dart';
import 'package:flutter_widget1/Album/Services.dart';





Widget GridViewWith(AsyncSnapshot<List<Album>> temp,BuildContext context) {

  return Padding(
    padding: EdgeInsets.all(10),
    child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 1.0,

        children: List.generate(temp.data.length, (index) {
          return GestureDetector(
            child: GridTile(
              child: AlbumCell(temp.data[index]),
            ),
            onTap: (){goToDetailsPage(context,temp.data[index]);},
          );
        })
    ),
  );
}

goToDetailsPage(BuildContext context, Album album) {
  Navigator.push(
    context,
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (BuildContext context) => AlbumDetails(
        newAlbum: album,
      ),
    ),
  );
}


class GridUiCustom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: FutureBuilder<List<Album>>(
              future: Manager.getPhotos(),
              builder:
                  (BuildContext context, snapshot) {
                if ((snapshot.hasData)) {
                  return GridViewWith(snapshot,context);
                }
                else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
