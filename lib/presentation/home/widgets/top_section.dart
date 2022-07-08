import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/home/screen_home.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';

class HomeTopSection extends StatelessWidget {
  final List<String> imgUrls;
  const HomeTopSection({
    Key? key,
    required this.imgUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imgUrls[2]))),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonHome(
                  icon: Icons.add,
                  icontxt: 'My List',
                ),
                _playButtonHome(),
                const CustomButtonHome(
                  icon: Icons.info_outline,
                  icontxt: 'Info',
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  ElevatedButton _playButtonHome() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(primary: whiteclr),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow_rounded,
        color: bgcolor,
        size: 30,
      ),
      label: const Text('Play',
          style: TextStyle(
            color: bgcolor,
            fontSize: 16,
          )),
    );
  }
}

OverlayEntry getEntry(context) {
  OverlayEntry? entry;
  final List<String> Categories = [
    'Home',
    'My List',
    'Available for Download',
    'Hindi',
    'Punjabi',
    'Telugu',
    'Malayalam',
    'Marathi',
    'Bengali',
    'English',
    'Action',
    'Anime',
    'Award Winners',
    'Bollywood',
    'Blockbusters',
    'Biographical'
        'Comedies',
    'Documentaries',
    'Fantasy',
    'Horror',
    'Indian',
    'International',
    'Romance',
    'Sci-Fi',
    'Tamil',
    'Thrillers',
  ];

  entry = OverlayEntry(
    opaque: false,
    maintainState: true,
    builder: (_) => BackdropFilter(
      filter: ui.ImageFilter.blur(
        sigmaX: 20,
        sigmaY: 20,
      ),
      child: Material(
        color: Colors.black.withOpacity(0.5),
        child: Column(
          children: [
            SbHeight30,
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                    Categories.length,
                    (index) => Column(
                          children: [
                            Text(Categories[index],
                                style: TextStyle(
                                    color: Colors.grey[350],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            SbHeight30
                          ],
                        )),
              ),
            ),
            InkWell(
              onTap: () {
                entry!.remove();
              },
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: whiteclr,
                child: Icon(
                  Icons.close,
                  size: 35,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
  return entry;
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
