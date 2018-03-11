import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp (
            title: 'Startup Name Generator',
            home: new RandomWords(),
        );
    }
}

class RandomWords extends StatefulWidget {
    @override
    createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
    final _suggestions = <WordPair>[];
    final _saved = new Set<WordPair>();
    final _biggerFont = const TextStyle(fontSize: 18.0);

    @override
    Widget build(BuildContext context) {
        // final wordPair = new WordPair.random();
        // return new Text(wordPair.asPascalCase);
        return new Scaffold (
            appBar: new AppBar(
                title: new Text('Startup Name Generator'),
            ),
            body: _buildSuggestions(),
        );
    }

    Widget _buildSuggestions() {
        return new ListView.builder(
            padding: const EdgeInsets.all(8.0),
            // itemBuilderのコールバックはwordParingがsuggestされるたびに一度だけ呼ばれる
            // そしてリストタイルの行にそれぞれを配置する
            // 偶数行ではこの関数は単語行のためにリストタイルを追加する
            // 奇数行ではこの関数はディバイダーを追加して、エントリーを分ける
            // 小さい端末だとディバイダーを見るのは難しいかもしれない
            itemBuilder: (context, i) {
                // 1pxの高さのディバイダーをリストビューの１行ずつに追加
                if (i.isOdd) return new Divider();

                // indexにはiを2で割った商の値がinteger型で入る
                // 例えば：1, 2, 3, 4, 5 は 0, 1, 1, 2, 2になる
                // これがリストビュー内のワードペアの実数を計算する
                // minus the divider widgets.
                final index = i ~/ 2;
                // もしあなたが利用可能なワードペアの最後に到達したら
                if (index >= _suggestions.length) {
                    // 10個生成し、それらをリストに追加する
                    _suggestions.addAll(generateWordPairs().take(10));
                }
                return _buildRow(_suggestions[index]);
            }
        );
    }

    Widget _buildRow(WordPair pair) {
        // pairが_savedに既に追加されていたらtrue
        final alreadySaved = _saved.contains(pair);
        return new ListTile(
            title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
            ),
            trailing: new Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
            ),
            onTap: () {
                setState(() {
                    if (alreadySaved) {
                        _saved.remove(pair);
                    } else {
                        _saved.add(pair);
                    }
                });
            },
        );
    }

}
