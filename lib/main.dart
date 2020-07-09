import 'package:flutter/material.dart';
import 'package:movie_app/ui/movie_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Catalogue',
      theme: ThemeData.dark(),
      home: MovieScreen(),
    );
  }
}