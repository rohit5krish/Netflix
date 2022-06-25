import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/Widgets/video_widget.dart';
import 'package:netflix_app/Presentation/home/screen_home.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';

class EveryonesWatchingContent extends StatelessWidget {
  const EveryonesWatchingContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SbHeight10,
        const Text('Friends',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        SbHeight10,
        const Text(
          'This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.',
          style: TextStyle(color: greyclr),
        ),
        SbHeight50,
        const VideoWidget(),
        SbHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonHome(
              icon: Icons.share,
              icontxt: 'Share',
              iconSize: 35,
              textSize: 12,
            ),
            SbWidth20,
            CustomButtonHome(
              icon: Icons.add,
              icontxt: 'My List',
              iconSize: 35,
              textSize: 12,
            ),
            SbWidth20,
            CustomButtonHome(
              icon: Icons.play_arrow_rounded,
              icontxt: 'Play',
              iconSize: 35,
              textSize: 12,
            ),
            SbWidth10
          ],
        )
      ],
    );
  }
}
