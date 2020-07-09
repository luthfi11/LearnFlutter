class Movie {
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final String backdropPath;
  final String voteAverage;
  final String voteCount;
  final String popularity;

  Movie({
    this.title,
    this.overview,
    this.releaseDate,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.voteCount,
    this.popularity
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title : json['title'],
      overview : json['overview'],
      releaseDate : json['release_date'],
      posterPath : json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage : json['vote_average'].toString(),
      voteCount : json['vote_count'].toString(),
      popularity: json['popularity'].toString()
    );
  }
}