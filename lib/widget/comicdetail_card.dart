import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/models/models.dart';
import 'package:collection/collection.dart';

class ComicDetailCard extends StatelessWidget {
  const ComicDetailCard({
    super.key,
    required this.volume,
    required this.volumesImage,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  });

  final Volume volume;
  final List<Imagen> volumesImage;

  final Color iconColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    final img = volumesImage
        .firstWhereOrNull((element) => element.id == volume.id)
        ?.image
        ?.originalUrl;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ComicImage(
            volume: img,
          ),
        ),
        Expanded(
          child: ComicInformation(
            volume: volume,
            fontColor: fontColor,
            isOrderSummary: false,
          ),
        ),
      ],
    );
  }
}

class ComicImage extends StatelessWidget {
  const ComicImage({
    super.key,
    required this.volume,
  });

  final String? volume;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    const double widthFactor = 2.25;
    return SizedBox(
      width: width / widthFactor,
      height: 100,
      child: CachedNetworkImage(
        cacheKey: volume,
        imageUrl: volume ?? '',
        fit: BoxFit.contain,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

class ComicInformation extends StatelessWidget {
  const ComicInformation({
    super.key,
    required this.volume,
    required this.fontColor,
    this.isOrderSummary = false,
    this.quantity,
  });

  final Volume volume;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${volume.name ?? ''} ',
        maxLines: 4,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black),
      ),
    );
  }
}
