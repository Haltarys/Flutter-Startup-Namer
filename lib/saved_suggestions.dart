import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedSuggestionsRoute extends MaterialPageRoute<void> {
  final Set<WordPair> saved;

  SavedSuggestionsRoute({required this.saved})
      : super(
          builder: (context) {
            final tiles = saved.map(
              (pair) => ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            );

            final List<Widget> divided = tiles.isNotEmpty
                ? ListTile.divideTiles(
                    tiles: tiles,
                    context: context,
                  ).toList()
                : [];

            return Scaffold(
              appBar: AppBar(
                title: const Text('Saved suggestions'),
              ),
              body: ListView(
                children: divided,
              ),
            );
          },
        );
}
