// ignore_for_file: prefer_const_constructors

// import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:wordpair/pages/fav_words.dart';
import 'package:wordpair/widgets/random_words.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> favs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Word FPair Generator"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FavWords(
                            favourites: favs,
                          )));
                },
                icon: Icon(Icons.list))
          ],
        ),
        body: RandomWords(
          addToFavs: (String favWord) {
            setState(() {
              favs.add(favWord);
            });
          },
          removeFromFavs: (String favWord) {
            setState(() {
              favs.remove(favWord);
            });
          },
        ));
  }
}
