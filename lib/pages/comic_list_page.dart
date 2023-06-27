import 'package:flutter/material.dart';

import 'comic_detail_page.dart';

class ComicListPage extends StatefulWidget {
  const ComicListPage({Key? key}) : super(key: key);

  @override
  _ComicListPageState createState() => _ComicListPageState();
}

class _ComicListPageState extends State<ComicListPage> {
  // A list of comic categories and images, you can replace them with your own data from Firebase
  final List<Map<String, String>> comics = [
    {'category': 'Action', 'image': 'assets/images/action.jpg'},
    {'category': 'Adventure', 'image': 'assets/images/adventure.jpg'},
    {'category': 'Comedy', 'image': 'assets/images/comedy.jpg'},
    {'category': 'Drama', 'image': 'assets/images/drama.jpg'},
    {'category': 'Fantasy', 'image': 'assets/images/fantasy.jpg'},
    {'category': 'Horror', 'image': 'assets/images/horror.jpg'},
    {'category': 'Romance', 'image': 'assets/images/romance.jpg'},
    {'category': 'Sci-Fi', 'image': 'assets/images/scifi.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comic List'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: comics.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Navigate to the comic detail page when tapping on a comic item
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ComicDetailPage(comic: comics[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(comics[index]['image']!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  comics[index]['category']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
