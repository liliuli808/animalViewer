import 'package:flutter/material.dart';

import 'package:animal_a/pages/comic_chapter_page.dart';

class ComicDetailPage extends StatelessWidget {
  // The comic data passed from the previous page
  final Map<String, String> comic;

  const ComicDetailPage({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comic['title']!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The comic cover image
            Container(
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(comic['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // The comic title and author
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    comic['title']!,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'by ${comic['author']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            // The comic description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                comic['description']!,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            // The comic rating
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star_half, color: Colors.yellow),
                  SizedBox(width: 8.0),
                  Text('4.5 / 5'),
                ],
              ),
            ),
            // The comic chapters list
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Chapters',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text('Chapter ${index + 1}'),
                  subtitle:
                  Text('Published on ${DateTime.now().subtract(Duration(days: index)).toLocal()}'),
                  trailing:
                  Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
                  onTap: () {
                    // Navigate to the comic chapter page when tapping on a chapter item
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComicChapterPage(comicTitle : comic['title']!, chapterNumber : index + 1),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
