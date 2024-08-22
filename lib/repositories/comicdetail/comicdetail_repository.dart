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

    List<Future<List<Imagen>>> imageFetchFutures = [
      fetchImages(parsedData.results?.characterCredits ?? []),
      fetchImages(parsedData.results?.locationCredits ?? []),
      fetchImages(parsedData.results?.teamCredits ?? []),
      fetchImages(parsedData.results?.personCredits ?? []),
      fetchImages(parsedData.results?.conceptCredits ?? []),
      fetchImages(parsedData.results?.objectCredits ?? []),
      fetchImages(parsedData.results?.storyArcCredits ?? []),
    ];

    List<List<Imagen>> imageLists = await Future.wait(imageFetchFutures);

    final result = ImagenComic(
      detail: parsedData.results,
      chacarter: imageLists[0],
      credits: imageLists[1],
      location: imageLists[2],
      creatorCredits: imageLists[3],
      concepts: imageLists[4],
      objects: imageLists[5],
      storyArcs: imageLists[6],
    );

    return result;
  }

  Future<List<Imagen>> fetchImages(List<Volume> items) async {
    List<Imagen> listImagen = <Imagen>[];
    List<Future<Imagen>> futures = [];

    for (var item in items) {
      futures.add(_fetchImage(item));
    }

    List<Imagen> results = await Future.wait(futures);
    listImagen.addAll(results);

    return listImagen;
  }

  Future<Imagen> _fetchImage(Volume item) async {
    final response = await _httpDio.dio.get(item.apiDetailUrl ?? '');
    final parsedData = _parseResponse.parseResponse<ImagenDetail>(
        response, (elemento) => ImagenDetail.fromJson(elemento));

    return parsedData.results ?? Imagen();
  }
}
