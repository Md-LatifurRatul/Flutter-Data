import 'package:flutter/material.dart';
import 'package:flutter_data/data/counter_storage.dart';
import 'package:flutter_data/pages/local_storage_demo.dart';

class FlutterData extends StatelessWidget {
  const FlutterData({super.key});
  @override
  Widget build(BuildContext context) {
    final storage = CounterStorage();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Data',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const AlbumHomePage(),
      // home: WebSocketPage(),
      // home: PhotoAlbumGallery(),
      home: LocalStorageDemo(storage: storage),
    );
  }
}
