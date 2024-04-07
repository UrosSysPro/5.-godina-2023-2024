import 'dart:convert';

import 'package:flutter_app/deezer/models/artist.dart';

class Track{
  int id;
  String title,preview;
  Artist artist;

  Track({
    required this.id,
    required this.title,
    required this.preview,
    required this.artist,
  });
  static List<Track> fromString(String string){
    var json=jsonDecode(string);
    var data=json['data'] as List<dynamic>?;
    if(data==null)return [];
    return data.map((e) => Track(
      id: e['id'],
      title: e['title'],
      preview: e['preview'],
      artist: Artist(
        id: e['artist']['id'],
        name: e['artist']['name'],
        link: e['artist']['link'],
        picture: e['artist']['picture'],
      )
    )).toList();
  }
}