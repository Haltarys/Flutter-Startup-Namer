import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: ((context, index) {
        if (index.isOdd) return const Divider();

        final wordIndex = index ~/ 2; // integer division
        if (wordIndex >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return ListTile(
          title: Text(
            _suggestions[wordIndex].asPascalCase,
            style: _biggerFont,
          ),
        );
      }),
    );
  }
}
