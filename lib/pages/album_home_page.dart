import 'package:flutter/material.dart';
import 'package:flutter_data/model/album.dart';
import 'package:flutter_data/services/network_request.dart';

class AlbumHomePage extends StatefulWidget {
  const AlbumHomePage({super.key});

  @override
  State<AlbumHomePage> createState() => _AlbumHomePageState();
}

class _AlbumHomePageState extends State<AlbumHomePage> {
  Future<Album>? futureAlbum;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // futureAlbum = NetworkRequest.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fetch Data Example")),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: (futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
      // Center(
      //   child: FutureBuilder(
      //     future: futureAlbum,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return Text(snapshot.data!.title);
      //       } else if (snapshot.hasError) {
      //         return Text('${snapshot.error}');
      //       }
      //       return const CircularProgressIndicator();
      //     },
      //   ),
      // ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: "Enter title"),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              futureAlbum = NetworkRequest.createAlbum(_controller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
