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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    const double heightFactor = 4;
    const double widthFactor = 2.25;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (state.comicDetail?.detail?.image?.originalUrl !=
                            null)
                          SizedBox(
                            width: width / widthFactor,
                            height: height / heightFactor,
                            child: CachedNetworkImage(
                              imageUrl: state
                                  .comicDetail!.detail!.image!.originalUrl!,
                              fit: BoxFit.contain,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                              issueNumber:
                                  state.comicDetail?.detail?.issueNumber,
                              name: state.comicDetail?.detail?.name,
                              volume: state.comicDetail?.detail?.volume?.name,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (hasDescription)
                      const SizedBox(
                        height: 20,
                      ),
                    if (hasDescription)
                      Text(
                        getCleanString(
                            state.comicDetail?.detail?.description ?? ''),
                      ),
                    Column(
                      children: [
                        BuildGridView(
                          volumes: state.comicDetail?.detail?.personCredits,
                          title: 'Creators',
                          volumesImage: state.comicDetail?.creatorCredits,
                        ),
                        BuildGridView(
                          volumes: state.comicDetail?.detail?.characterCredits,
                          title: 'Characters',
                          volumesImage: state.comicDetail?.chacarter,
                        ),
                        BuildGridView(
                          volumes: state.comicDetail?.detail?.teamCredits,
                          title: 'Teams',
                          volumesImage: state.comicDetail?.credits,
                        ),
                        BuildGridView(
                          volumes: state.comicDetail?.detail?.locationCredits,
                          title: 'Locations',
                          volumesImage: state.comicDetail?.location,
                        ),
                        BuildGridView(
                          volumes: state.comicDetail?.detail?.conceptCredits,
                          title: 'Concepts',
                          volumesImage: state.comicDetail?.concepts,
                        ),
                        BuildGridView(
                          volumes: state.comicDetail?.detail?.objectCredits,
                          title: 'Objects',
                          volumesImage: state.comicDetail?.objects,
                        ),
                        BuildGridView(
                          volumes: state.comicDetail?.detail?.storyArcCredits,
                          title: 'Story Arcs',
                          volumesImage: state.comicDetail?.objects,
                        ),
                      ],
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
        const SizedBox(
          height: 20,
        ),
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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              mainAxisExtent: 100,
            ),
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
