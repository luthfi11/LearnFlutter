import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/data/model/movie.dart';
import 'package:movie_app/data/model/movie_response.dart';
import 'package:movie_app/data/repo/movie_repository.dart';
import 'package:movie_app/ui/movie_detail_screen.dart';

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreen createState() => _MovieScreen();
}

class _MovieScreen extends State<MovieScreen> {
  MovieRepository repo = MovieRepository();

  Future<MovieResponse> movies;
  String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  void initState() {
    movies = repo.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Catalogue'),
      ),
      body: FutureBuilder(
        future: movies,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height-80),
              ),
              itemCount: snapshot.data.results.length,
              itemBuilder: (BuildContext context, int index) {
                return moviesItem(
                    movie: snapshot.data.results[index],
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetailScreen(
                                movie: snapshot.data.results[index],
                              )));
                    });
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error : ${snapshot.error} ${snapshot.hasData}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget moviesItem({Movie movie, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(child: Image.network(imageBaseUrl + movie.posterPath)),
              Container(
                margin: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    movie.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
