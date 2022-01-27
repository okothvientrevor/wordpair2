// ignore_for_file: prefer_const_constructors

// import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:wordpair/widgets/random_words.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WordPair Generator"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.list))],
        ),
        body: RandomWords());
  }
}
