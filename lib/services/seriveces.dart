import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Character.dart';

class Services {

  static Future<List<Character>> getValue() async {
    String url = "https://rickandmortyapi.com/api/character";
    List<Character> character = [];
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode <= 300) {
        dynamic characterList  = jsonDecode(response.body);
        List<dynamic> resultList=characterList["results"];
        resultList.forEach((json) => character.add(Character.fromJson(json)));
      }
      return character;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
