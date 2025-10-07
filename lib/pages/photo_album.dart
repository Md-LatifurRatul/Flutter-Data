import 'package:flutter/material.dart';
import 'package:flutter_data/model/photo.dart';
import 'package:flutter_data/pages/photo_list.dart';
import 'package:flutter_data/services/photo_parse.dart';
import 'package:http/http.dart' as http;

class PhotoAlbumGallery extends StatefulWidget {
  const PhotoAlbumGallery({super.key});

  @override
  State<PhotoAlbumGallery> createState() => _PhotoAlbumGalleryState();
}

class _PhotoAlbumGalleryState extends State<PhotoAlbumGallery> {
  late Future<List<Photo>> futurePhotos;

  @override
  void initState() {
    super.initState();
    futurePhotos = PhotoParse.fetchPhotos(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo Album')),
      body: FutureBuilder<List<Photo>>(
        future: futurePhotos,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: const Text("An error has occured"));
          } else if (snapshot.hasData) {
            return PhotoList(photos: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
