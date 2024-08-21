import 'package:comic_vine_app/dio/httpdio.dart';
import 'package:comic_vine_app/dio/parseresponse.dart';
import 'package:comic_vine_app/models/models.dart';
import 'package:comic_vine_app/repositories/comicdetail/base_comicdetail_repository.dart';

class ComicDetailRepository extends BaseComicDetailRepository {
  final HttpDio _httpDio;
  final ParseResponse _parseResponse;

  ComicDetailRepository({ParseResponse? parseResponse, HttpDio? httpDio})
      : _httpDio = httpDio ?? HttpDio.getInstance(null),
        _parseResponse = parseResponse ?? ParseResponse.instance;

  @override
  Future<ImagenComic> getComicDetail(String? url) async {
    final response = await _httpDio.dio.get(url ?? '');
    final parsedData = _parseResponse.parseResponse<ComicDetail>(
        response, (elemento) => ComicDetail.fromJson(elemento));

    List<Imagen> listImagenCharater =
        await fetchImages(parsedData.results?.characterCredits ?? []);
    List<Imagen> listImagenLocation =
        await fetchImages(parsedData.results?.locationCredits ?? []);
    List<Imagen> listImagenCredit =
        await fetchImages(parsedData.results?.teamCredits ?? []);

    final result = ImagenComic(
        detail: parsedData.results,
        chacarter: listImagenCharater,
        credits: listImagenCredit,
        location: listImagenLocation);
    return result;
  }

  Future<List<Imagen>> fetchImages(List<Volume> items) async {
    List<Imagen> listImagen = <Imagen>[];
    for (var item in items) {
      final response = await _httpDio.dio.get(item.apiDetailUrl ?? '');
      final parsedData = _parseResponse.parseResponse<ImagenDetail>(
          response, (elemento) => ImagenDetail.fromJson(elemento));

      listImagen.add(parsedData.results ?? Imagen());
    }
    return listImagen;
  }
}
