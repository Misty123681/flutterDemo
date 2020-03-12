
import 'package:flutter/material.dart';
import 'package:flutter_widget1/Album/Album.dart';
import 'Album.dart';
import 'package:url_launcher/url_launcher.dart';



class AlbumDetails extends StatefulWidget {

  const AlbumDetails({@required this.newAlbum});
  final Album newAlbum;

  @override
  _AlbumDetailsState createState() => _AlbumDetailsState();

}


class _AlbumDetailsState extends State<AlbumDetails> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/1.png",
                image:widget.newAlbum.url,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(widget.newAlbum.title),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                  child: new Text(widget.newAlbum.thumbnailUrl, style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                  onTap: () => launch(
                      widget.newAlbum.thumbnailUrl,
                  ),
              )
              ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Album Details"
        ),
    ),

    );
  }
}
