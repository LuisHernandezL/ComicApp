import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool home;

  const CustomAppBar({super.key, this.home = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        //center widget
        alignment: home ? Alignment.center : null,

        child: Text(
          'ComicVine',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}
