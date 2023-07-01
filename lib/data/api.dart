import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:search_image_app/model/photo.dart';

class PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '38001680-adbabb5770114b86869c39d22';

  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(
      Uri.parse("$baseUrl?key=$key&q=$query&image_type=photo"),
    );

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse["hits"];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
