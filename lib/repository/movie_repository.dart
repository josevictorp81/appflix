import 'package:appflix/models/movie.dart';
import 'package:appflix/repository/resource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieRepository {
  late final Dio _client;

  MovieRepository(Resource r) {
    _client = r.dio;
  }

  Future<List<Movie>> getAll(int page, String endpoint) async {
    var params = {
      'language': 'pt-br',
      'api_key': dotenv.env['API_KEY'],
      'page': page,
    };
    try {
      final Response response =
          await _client.get(endpoint, queryParameters: params);
      if (response.statusCode == 200) {
        return Movie.jsonToList(response.data['results']);
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Movie>> searchMovie(
      int page, String endpoint, String movie) async {
    var params = {
      'language': 'pt-br',
      'api_key': dotenv.env['API_KEY'],
      'page': page,
      'query': movie,
    };
    try {
      final Response response =
          await _client.get(endpoint, queryParameters: params);
      if (response.statusCode == 200) {
        return Movie.jsonToList(response.data['results']);
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
