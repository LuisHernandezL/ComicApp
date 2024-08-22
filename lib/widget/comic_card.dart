import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '/blocs/blocs.dart';
import '/models/models.dart';

class ComicCard extends StatelessWidget {
  const ComicCard({
    super.key,
    required this.comic,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 150,
    this.isCatalog = false,
    this.isCart = true,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  });

  final Comic comic;
  final int? quantity;
  final double widthFactor;
  final double height;
  final bool isCatalog;
  final bool isCart;
  final Color iconColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    const double heightVariable = 350;
    final double widthVariable = width / widthFactor;

    return InkWell(
        onTap: () async {
          context
              .read<ComicDetailBloc>()
              .add(LoadComicDetail(comic.apiDetailUrl));
          Navigator.pushNamed(
            context,
            '/comic',
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ComicImage(
              adjWidth: widthVariable,
              height: heightVariable,
              comic: comic,
            ),
            const SizedBox(width: 10),
            ComicInformation(
              comic: comic,
              fontColor: fontColor,
              quantity: quantity,
              isOrderSummary: false,
            ),
          ],
        ));
  }
}

class ComicImage extends StatelessWidget {
  const ComicImage({
    super.key,
    required this.adjWidth,
    required this.height,
    required this.comic,
  });

  final double adjWidth;
  final double height;
  final Comic comic;

  @override
  Widget build(BuildContext context) {
    final string = comic.image?.originalUrl;
    return SizedBox(
      child: CachedNetworkImage(
        width: adjWidth,
        height: height,
        imageUrl: string ?? '',
        fit: BoxFit.cover,
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
    required this.comic,
    required this.fontColor,
    this.isOrderSummary = false,
    this.quantity,
  });

  final Comic comic;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMMM d y');
    DateTime date = DateTime.parse(comic.dateAdded ?? '');
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            '${comic.volume?.name ?? ''} #${comic.issueNumber} - ${comic.name ?? ''}',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleLarge!.copyWith(color: fontColor),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${formatter.format(date)} ',
          style: textTheme.bodySmall!.copyWith(color: fontColor),
        ),
      ],
    );
  }
}
