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
}
