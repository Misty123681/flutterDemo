
import 'dart:async';
import 'dart:convert';
import 'package:flutter_widget1/Album/Album.dart';
import 'package:http/http.dart' as http;


class Manager{

  static final endpoint = "http://jsonplaceholder.typicode.com/photos";

  static Future<List<Album>> getPhotos()async{

      try{
        var response = await http.get(endpoint);
        if(response.statusCode == 200){
          print(response.body);
         List<Album> result = parseRawdData(response.body);
         return result;
        }
      }catch(e){
        print(e);
        throw Exception(e);

      }
  }
}

 List<Album> parseRawdData(String data) {
  final parsed = json.decode(data).cast<Map<String,dynamic>>();

  //return parsed.map<Album>((album) { Album.fromJson(album)}).toList();
  return parsed.map<Album>((json) => Album.fromJson(json)).toList();

}
