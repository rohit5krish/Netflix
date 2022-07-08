import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Widgets/main_title.dart';
import 'package:netflix_app/presentation/home/widgets/animated_num_card.dart';

class AnimatedHorizontalScroll extends StatelessWidget {
  final List<String> postersList;
  const AnimatedHorizontalScroll({
    Key? key,
    required this.postersList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const mainTitle(
            title: 'Top 10 in India Today',
          ),
          SbHeight10,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  postersList.length,
                  (index) => AnimatedNumberCard(
                        index: index,
                        imgurl: postersList[index],
                      )),
            ),
          )
        ],
      ),
    );
  }
}
