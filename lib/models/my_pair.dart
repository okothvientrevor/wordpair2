import 'package:english_words/english_words.dart';

class MyPair {
  final String pair;
  final bool favourite;

  MyPair(this.pair, this.favourite);

  factory MyPair.fromWordPair(WordPair pair) {
    return MyPair(pair.asPascalCase, false);
  }
}
