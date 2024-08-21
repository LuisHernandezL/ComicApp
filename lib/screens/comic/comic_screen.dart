import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_vine_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comic_vine_app/blocs/blocs.dart';
import 'package:comic_vine_app/widget/comicdetail_card.dart';
import 'package:comic_vine_app/widget/custom_appbar.dart';
import 'package:intl/intl.dart';
import '/models/models.dart';

class ComicScreen extends StatelessWidget {
  static const String routeName = '/comic';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ComicScreen(),
    );
  }

  const ComicScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          home: false,
        ),
      ),
      body: BlocBuilder<ComicDetailBloc, ComicDetailState>(
          builder: (context, state) {
        if (state is ComicDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ComicDetailLoaded) {
          return LayoutBuilder(builder: (context, boxcontainer) {
            bool hasDescription =
                state.comicDetail?.detail?.description != null;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (hasDescription)
                      Text(
                        getCleanString(
                            state.comicDetail?.detail?.description ?? ''),
                      ),
                    if (hasDescription)
                      const SizedBox(
                        height: 20,
                      ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Creators(
                                    volumes: state
                                        .comicDetail?.detail?.personCredits,
                                    title: 'Creators',
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  BuildGridView(
                                    volumes: state
                                        .comicDetail?.detail?.characterCredits,
                                    title: 'Characters',
                                    volumesImage: state.comicDetail?.chacarter,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  BuildGridView(
                                    volumes:
                                        state.comicDetail?.detail?.teamCredits,
                                    title: 'Teams',
                                    volumesImage: state.comicDetail?.credits,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  BuildGridView(
                                    volumes: state
                                        .comicDetail?.detail?.locationCredits,
                                    title: 'Locations',
                                    volumesImage: state.comicDetail?.location,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        if (state.comicDetail?.detail?.image?.originalUrl !=
                            null)
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: state
                                  .comicDetail!.detail!.image!.originalUrl!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(92, 158, 158, 158),
                            width: 2,
                          ),
                        ),
                        child: IssueDetailsSquare(
                          coverDate: state.comicDetail?.detail?.coverDate,
                          storeDate: state.comicDetail?.detail?.storeDate,
                          issueNumber: state.comicDetail?.detail?.issueNumber,
                          name: state.comicDetail?.detail?.name,
                          volume: state.comicDetail?.detail?.volume?.name,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        }

        if (state is ComicDetailError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        return const Center(child: Text('Opps! Please restart the app.'));
      }),
    );
  }
}

class IssueDetailsSquare extends StatelessWidget {
  const IssueDetailsSquare({
    super.key,
    this.name,
    this.volume,
    this.issueNumber,
    this.coverDate,
    this.storeDate,
  });

  final String? name;
  final String? volume;
  final String? issueNumber;
  final DateTime? coverDate;
  final DateTime? storeDate;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMMM d y');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Issue Details',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.black),
          ),
        ),
        const Divider(
          color: Color.fromARGB(92, 158, 158, 158),
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Name: ${name ?? ''}'),
        ),
        const Divider(
          color: Color.fromARGB(92, 158, 158, 158),
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Volume: ${volume ?? ''}'),
        ),
        const Divider(
          color: Color.fromARGB(92, 158, 158, 158),
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Issue Number: ${issueNumber ?? ''}'),
        ),
        const Divider(
          color: Color.fromARGB(92, 158, 158, 158),
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              'Cover Date: ${formatter.format(coverDate ?? DateTime.now())}'),
        ),
        const Divider(
          color: Color.fromARGB(92, 158, 158, 158),
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              'Store Date: ${formatter.format(storeDate ?? DateTime.now())}'),
        ),
      ],
    );
  }
}

class Creators extends StatelessWidget {
  const Creators({
    super.key,
    this.volumes,
    required this.title,
  });

  final List<Volume?>? volumes;

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black),
        ),
        const Divider(
          color: Color.fromARGB(92, 158, 158, 158),
          thickness: 2,
        ),
        if (volumes?.isNotEmpty == true)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: volumes?.length,
            itemBuilder: (context, index) {
              final volume = volumes?[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  '${volume?.name ?? ''} - ${volume?.role ?? ''}',
                  maxLines: 4,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              );
            },
          ),
      ],
    );
  }
}

class BuildGridView extends StatelessWidget {
  const BuildGridView({
    super.key,
    required this.volumes,
    required this.title,
    required this.volumesImage,
  });
  final List<Volume?>? volumes;
  final List<Imagen>? volumesImage;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black),
        ),
        const Divider(
          color: Color.fromARGB(92, 158, 158, 158),
          thickness: 2,
        ),
        if (volumes?.isNotEmpty == true && volumesImage != null)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: volumes?.length,
            itemBuilder: (context, index) {
              final volume = volumes?[index];
              return ComicDetailCard(
                volume: volume ?? Volume(),
                volumesImage: volumesImage ?? [],
              );
            },
          ),
      ],
    );
  }
}
