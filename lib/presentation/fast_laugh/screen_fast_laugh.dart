import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/fast_laugh/widgets/video_list.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(10, (index) {
            return VideoListItems(
              index: index,
            );
          }),
        ),
      ),
    );
  }
}
