// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:wordpair/models/my_pair.dart';

class RandomWords extends StatefulWidget {
  final Function(String) addToFavs;
  final Function(String) removeFromFavs;
  const RandomWords(
      {Key? key, required this.addToFavs, required this.removeFromFavs})
      : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  List<String> favouritedWords = [];
  List<MyPair> allWords = [];

  @override
  void initState() {
    super.initState();
    allWords = generateWordPairs()
        .take(20)
        .map((WordPair p) => MyPair.fromWordPair(p))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // final _randomWordPairs = <WordPair>[];
    // final _savedWordPairs = Set<WordPair>();
    return ListView.builder(
      itemCount: allWords.length,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, index) {
        // if (item.isOdd) return Divider();
        // final index = item ~/ 2;

        // if (index >= _randomWordPairs.length) {
        //   _randomWordPairs.addAll(generateWordPairs().take(10));
        // }
        // final pair = _randomWordPairs[index];
        // final alredySaved = _savedWordPairs.contains(pair);

        MyPair thisPair = allWords[index];
        bool favourited = thisPair.favourite;
        return ListTile(
          title: Text(
            thisPair.pair,
            style: TextStyle(fontSize: 18.0),
          ),
          trailing: Icon(
            // alredySaved ? Icons.favorite : Icons.favorite_border,
            favourited ? Icons.favorite : Icons.favorite_border,
            color: favourited ? Colors.red : null,
          ),
          onTap: () {
            setState(() {
              favourited = !favourited;
              MyPair newPair = MyPair(thisPair.pair, favourited);
              allWords.insert(index, newPair);
              allWords.remove(thisPair);

              if (favourited) {
                widget.addToFavs(thisPair.pair);
              } else {
                widget.removeFromFavs(thisPair.pair);
              }
            });

            // setState(() {
            //   if (alredySaved) {
            //     _savedWordPairs.remove(pair);
            //   } else {
            //     _savedWordPairs.add(pair);
            //   }
            // });
          },
        );
      },
    );
  }
}
