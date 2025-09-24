import 'package:flutter/material.dart';
import 'package:flutter_data/pages/album_home_page.dart';

class FlutterData extends StatelessWidget {
  const FlutterData({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Data',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AlbumHomePage(),
    );
  }
}
