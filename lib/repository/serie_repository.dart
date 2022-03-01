import 'package:appflix/models/series.dart';
import 'package:appflix/repository/resource.dart';
import 'package:dio/dio.dart';

class SerieRepository {
  late final Dio _client;

  SerieRepository(Resource r) {
    _client = r.dio;
  }

  Future<List<Serie>> getAll(int page, String endpoint) async {
    var params = {
      'language': 'pt-br',
      'api_key': 'de0279ac33da1f3ef47fa098401b0a99',
      'page': page,
    };
    try {
      final Response response =
          await _client.get(endpoint, queryParameters: params);
      if (response.statusCode == 200) {
        return Serie.jsonToList(response.data['results']);
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
