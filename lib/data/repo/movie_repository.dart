import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/data/model/movie_response.dart';

class MovieRepository {

  http.Client client = http.Client();
  final endpoint = 'https://api.themoviedb.org/3/movie/now_playing?api_key=60bf79a20ebb1e7e480ffe0d5c1bb2eb';
  List data;

  Future<MovieResponse> getMovies() async {
    final res = await client.get(endpoint);

    if (res.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(res.body));
    } else {
      throw Exception("Can't get data ${res.statusCode}");
    }
  }
}