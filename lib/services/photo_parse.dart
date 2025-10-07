import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_data/model/photo.dart';
import 'package:http/http.dart' as http;

class PhotoParse {
  static List<Photo> parsePhotos(String responseBody) {
    final parsed = (jsonDecode(responseBody) as List<Object?>)
        .cast<Map<String, Object?>>();

    return parsed.map<Photo>(Photo.fromJson).toList();
  }

  static Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response = await client.get(
      Uri.parse("https://jsonplaceholder.typicode.com/photos"),
    );

    return compute(parsePhotos, response.body);
  }
}
