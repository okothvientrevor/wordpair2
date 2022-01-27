// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final _randomWordPairs = <WordPair>[];
    final _savedWordPairs = Set<WordPair>();
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, item) {
        if (item.isOdd) return Divider();
        final index = item ~/ 2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }
        final pair = _randomWordPairs[index];
        final alredySaved = _savedWordPairs.contains(pair);
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: TextStyle(fontSize: 18.0),
          ),
          trailing: Icon(
            alredySaved ? Icons.favorite : Icons.favorite_border,
            color: alredySaved ? Colors.red : null,
          ),
          onTap: () {
            setState(() {
              if (alredySaved) {
                _savedWordPairs.remove(pair);
              } else {
                _savedWordPairs.add(pair);
              }
            });
          },
        );
      },
    );
  }
}
