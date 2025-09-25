import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_data/model/album.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static Future<Album> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: {HttpHeaders.authorizationHeader: "token"},
    );

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    log(response.body);
    if (response.statusCode == 200) {
      return Album.fromJson(responseJson);
    } else {
      throw Exception('Failed to laod album');
    }
  }

  static Future<Album> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/albums"),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'title': title}),
    );

    if (response.statusCode == 201) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create album');
    }
  }
}
