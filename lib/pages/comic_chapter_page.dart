import 'package:flutter/material.dart';

class ComicChapterPage extends StatelessWidget {
  // The comic title and chapter number passed from the previous page
  final String comicTitle;
  final int chapterNumber;

  const ComicChapterPage(
      {Key? key, required this.comicTitle, required this.chapterNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$comicTitle - Chapter $chapterNumber'),
      ),
      body: PageView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            // A dummy image for the comic page, you can replace it with your own data from Firebase
            child: Image.asset('assets/images/page${index + 1}.jpg'),
          );
        },
      ),
    );
  }
}
