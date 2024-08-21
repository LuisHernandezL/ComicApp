import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comic_vine_app/widget/comic_card.dart';
import 'package:comic_vine_app/widget/custom_appbar.dart';
import '/blocs/blocs.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight / 2),
        child: CustomAppBar(),
      ),
      body: LayoutBuilder(builder: (context, boxcontainer) {
        return BlocBuilder<ComicBloc, ComicState>(builder: (context, state) {
          if (state is ComicLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ComicLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Latest Issues',
                        maxLines: 4,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(92, 158, 158, 158),
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: state.comic?.length,
                    itemBuilder: (context, index) {
                      final comic = state.comic?[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 5.0, top: 10),
                        child: Column(
                          children: [
                            ComicCard(comic: comic!),
                            const Divider(
                              color: Color.fromARGB(92, 158, 158, 158),
                              thickness: 2,
                              indent: 20,
                              endIndent: 20,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
          if (state is ComicError) {
            return const Center(
              child: Text(
                'Something went wrong.',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          return const Center(child: Text('Opps! Please restart the app.'));
        });
      }),
    );
  }
}
