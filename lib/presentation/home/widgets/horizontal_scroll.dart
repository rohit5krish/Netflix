import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/Widgets/main_title.dart';
import 'package:netflix_app/presentation/Widgets/main_card.dart';

class HorizontalScroll extends StatelessWidget {
  final String title;
  const HorizontalScroll({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mainTitle(
            title: title,
          ),
          // SbHeight10,
          SizedBox(
            height: 5,
          ),
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => MainCard(
                        imgUrl:
                            'https://www.themoviedb.org/t/p/w220_and_h330_face/74kkM7E5IymHl7ZS4XugP6YT3zU.jpg',
                      )),
            ),
          )
        ],
      ),
    );
  }
}
