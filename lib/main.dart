import 'package:flutter/material.dart';
import 'package:animal_a/pages/comic_list_page.dart';

void main() {
  runApp(ComicApp());
}

class ComicApp extends StatelessWidget {
  const ComicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comic App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ComicHomePage(),
    );
  }
}

class ComicHomePage extends StatelessWidget {
  const ComicHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComicListPage();
  }
}
