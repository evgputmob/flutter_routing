import 'package:flutter/services.dart';
import 'dart:convert';

class Artist {
  String name;
  String link;
  String about;

  Artist({required this.name, required this.link, required this.about});

  factory Artist.fromJson(Map<String, dynamic> parsedJson) {
    return Artist(
        name: parsedJson['name'],
        link: parsedJson['link'],
        about: parsedJson['about']);
  }
}

//Future _sleep(int seconds) {
//  return Future.delayed(Duration(seconds: seconds), () => {});
//}

Future<String> _loadArtistsAsset() async {
  return await rootBundle.loadString('assets/artists.json');
}

Future<List<Artist>> loadArtists() async {
  //await _sleep(3);
  final String jsonString = await _loadArtistsAsset();
  final List<dynamic> list = json.decode(jsonString);
  var artists = <Artist>[];
  for (var artistJson in list) {
    artists.add(Artist.fromJson(artistJson));
  }
  return artists;
}
