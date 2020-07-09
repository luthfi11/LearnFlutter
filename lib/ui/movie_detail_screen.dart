import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/data/model/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  final Movie movie;

  MovieDetailScreen({@required this.movie});

  @override
  Widget build(BuildContext context) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(movie.releaseDate);
    DateFormat formatter = new DateFormat('dd MMMM yyyy');
    String releaseDate = formatter.format(tempDate);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(imageBaseUrl + movie.posterPath),
                ],
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 6),
                child: Text("Release Date", style: TextStyle(fontSize: 16)),
              ),
              Container(
                margin: EdgeInsets.only(left: 22, right: 16, bottom: 16),
                child: Text(releaseDate),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 6),
                child: Text("Vote Average", style: TextStyle(fontSize: 16)),
              ),
              Container(
                margin: EdgeInsets.only(left: 22, right: 16, bottom: 16),
                child: Text(movie.voteAverage),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 6),
                child: Text("Vote Count", style: TextStyle(fontSize: 16)),
              ),
              Container(
                margin: EdgeInsets.only(left: 22, right: 16, bottom: 16),
                child: Text(movie.voteCount),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 6),
                child: Text("Popularity", style: TextStyle(fontSize: 16)),
              ),
              Container(
                margin: EdgeInsets.only(left: 22, right: 16, bottom: 16),
                child: Text(movie.popularity),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 6),
                child: Text("Overview", style: TextStyle(fontSize: 16)),
              ),
              Container(
                margin: EdgeInsets.only(left: 22, right: 16, bottom: 16),
                child: Text(movie.overview),
              )
            ]),
      ),
    );
  }
}
