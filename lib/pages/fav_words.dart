import 'package:flutter/material.dart';

class FavWords extends StatefulWidget {
  final List<String> favourites;
  const FavWords({
    Key? key,
    required this.favourites,
  }) : super(key: key);

  @override
  State<FavWords> createState() => _FavWordsState();
}

class _FavWordsState extends State<FavWords> {
  List<String> favouritesList = [];

  @override
  void initState() {
    super.initState();
    favouritesList.addAll(widget.favourites);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: favouritesList.length,
          itemBuilder: (context, index) {
            String pair = favouritesList[index];
            return ListTile(
              title: Text(pair),
            );
          }),
    );
  }
}
