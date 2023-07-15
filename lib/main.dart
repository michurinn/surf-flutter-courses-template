import 'package:flutter/material.dart';
import 'package:collection/collection.dart'; // импорт для UnmodifiableListView

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    collectionsExample();
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}


void collectionsExample() {
  final originalIterable = [1, 2, 3];
  final unmodifiable = UnmodifiableListView(originalIterable);

  print(unmodifiable); // [1, 2, 3]

  originalIterable.removeAt(0);

  print(unmodifiable); // [2, 3]
}