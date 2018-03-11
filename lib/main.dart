import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        final wordPair = new WordPair.random();
        return new MaterialApp(
            title: 'Welcome to Flutter App',
            home: new Scaffold(
                appBar: new AppBar(
                    title: new Text('Welcome to Flutter Application')
                ),
                body: new Center(
                    /*
                    child: new Text(
                        'Hello World',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                                fontWeight: FontWeight.bold
                        )
                    )
                    */
                    child: new Text(wordPair.asPascalCase)
                ),
            ),
        );
    }
}
