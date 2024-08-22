import 'package:comic_vine_app/models/models.dart';

class ImagenComic {
  final Results? detail;
  final List<Imagen> chacarter;
  final List<Imagen> location;
  final List<Imagen> credits;
  final List<Imagen> creatorCredits;
  final List<Imagen> concepts;
  final List<Imagen> objects;
  final List<Imagen> storyArcs;
  ImagenComic({
    required this.detail,
    required this.chacarter,
    required this.location,
    required this.credits,
    required this.creatorCredits,
    required this.concepts,
    required this.objects,
    required this.storyArcs,
  });
}
