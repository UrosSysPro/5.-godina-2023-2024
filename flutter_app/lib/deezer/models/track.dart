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
}