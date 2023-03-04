import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:startup_namer/saved_suggestions.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved suggestions',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: ((context, index) {
          if (index.isOdd) return const Divider();

          final wordIndex = index ~/ 2; // integer division
          if (wordIndex >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved = _saved.contains(_suggestions[wordIndex]);
          return ListTile(
            title: Text(
              _suggestions[wordIndex].asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
              semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(_suggestions[wordIndex]);
                } else {
                  _saved.add(_suggestions[wordIndex]);
                }
              });
            },
          );
        }),
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      SavedSuggestionsRoute(
        saved: _saved,
      ),
    );
  }
}
