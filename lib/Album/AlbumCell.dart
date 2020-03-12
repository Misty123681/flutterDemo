
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Album.dart';


class AlbumCell extends StatelessWidget{

  const AlbumCell(this.album);

 @required
  final Album album;

 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color:Colors.white,
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/1.png",
                image: album.url,
                width: 100,
                height: 100,
              ),
            ),
            Expanded(

              child:Text(
                (album.title).toString(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 3,
                softWrap: true,
                textAlign: TextAlign.center,
              ) ,
            ),

          ],
        ),
      ),
    );
  }
}