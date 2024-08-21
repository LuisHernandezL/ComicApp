import 'package:comic_vine_app/dio/httpdio.dart';
import 'package:comic_vine_app/dio/parseresponse.dart';
import 'package:comic_vine_app/models/models.dart';
import 'package:comic_vine_app/repositories/comics/base_comics_repository.dart';

class ComicsRepository extends BaseComicsRepository {
  final HttpDio _httpDio;
  final ParseResponse _parseResponse;

  ComicsRepository({ParseResponse? parseResponse, HttpDio? httpDio})
      : _httpDio = httpDio ?? HttpDio.getInstance(null),
        _parseResponse = parseResponse ?? ParseResponse.instance;

  @override
  Future<Comics> getAllComics() async {
    final response = await _httpDio.dio.get('issues/');
    final parsedData = _parseResponse.parseResponse<Comics>(
        response, (elemento) => Comics.fromJson(elemento));
    return parsedData;
  }
}
