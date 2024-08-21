import 'package:comic_vine_app/models/imagencomic.dart';

import '/models/models.dart';

abstract class BaseComicDetailRepository {
  Future<ImagenComic> getComicDetail(String? url);
}
