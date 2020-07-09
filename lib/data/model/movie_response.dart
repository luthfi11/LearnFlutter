
import 'package:movie_app/data/model/movie.dart';

class MovieResponse {
  final List<Movie> results;

  MovieResponse({
    this.results
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Movie> movieList = list.map((i) => Movie.fromJson(i)).toList();
    return MovieResponse(
      results: movieList
    );
  }
}
