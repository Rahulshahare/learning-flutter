import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}




class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      itemBuilder: /*1 */(context,i){
        if(i.isOdd) return Divider();  /**2 */

        final index = i ~/ 2; /**3 */
        if (index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10)); /**4 */
        }
        return _buildRow(_suggestions[index]);

      });
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

}

/**
 * The Second Part 
 * -Implement interactivity by adding a clickable heart icon to save favorite pairings.
 * -Implement navigation to a new route by adding a new screen containing the saved favorites.
 * -Modify the theme color, making an all-white app.
 */