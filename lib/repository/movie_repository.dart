import 'package:appflix/models/movie.dart';
import 'package:appflix/repository/resource.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  late final Dio _client;

  MovieRepository(Resource r) {
    _client = r.dio;
  }

  Future<List<Movie>> getAll(int page, String endpoint) async {
    var params = {
      'language': 'pt-br',
      'api_key': 'de0279ac33da1f3ef47fa098401b0a99',
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
      'api_key': 'de0279ac33da1f3ef47fa098401b0a99',
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
