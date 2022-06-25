import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/Presentation/home/widgets/animated_hori_scroll.dart';
import 'package:netflix_app/Presentation/home/widgets/horizontal_scroll.dart';
import 'package:netflix_app/Presentation/home/widgets/top_section.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, value, Widget? child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    HomeTopSection(),
                    HorizontalScroll(title: 'Released in the past year'),
                    SbHeight20,
                    HorizontalScroll(title: 'Trending Now'),
                    SbHeight20,
                    AnimatedHorizontalScroll(),
                    SbHeight20,
                    HorizontalScroll(title: 'Tense Dramas'),
                    SbHeight20,
                    HorizontalScroll(title: 'South Indian Cinemas'),
                  ],
                ),
                scrollNotifier.value
                    ? AnimatedContainer(
                        duration: Duration(milliseconds: 3000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqyDckNxdnVn01yNXKk_BzIAgJFtAynYGkcA&usqp=CAU',
                                  width: 50,
                                  height: 50,
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                SbWidth10,
                                Container(
                                  color: Colors.grey.withOpacity(0.5),
                                  height: 30,
                                  width: 30,
                                ),
                                SbWidth10
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'TV Shows',
                                  style: homeTitle,
                                ),
                                Text(
                                  'Movies',
                                  style: homeTitle,
                                ),
                                Text(
                                  'Categories',
                                  style: homeTitle,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : SbHeight10
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomButtonHome extends StatelessWidget {
  const CustomButtonHome({
    Key? key,
    required this.icon,
    required this.icontxt,
    this.iconSize = 24,
    this.textSize = 14,
  }) : super(key: key);

  final IconData icon;
  final String icontxt;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: whiteclr,
          size: iconSize,
        ),
        Text(icontxt,
            style: TextStyle(
              fontSize: textSize,
            )),
      ],
    );
  }
}
