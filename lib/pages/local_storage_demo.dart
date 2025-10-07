import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_data/data/counter_storage.dart';

class LocalStorageDemo extends StatefulWidget {
  const LocalStorageDemo({super.key, required this.storage});
  final CounterStorage storage;

  @override
  State<LocalStorageDemo> createState() => _LocalStorageDemoState();
}

class _LocalStorageDemoState extends State<LocalStorageDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reading and Writing Files")),
      body: Center(
        child: Text("Button tapped $_counter time${_counter == 1 ? '' : 's'}."),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}
