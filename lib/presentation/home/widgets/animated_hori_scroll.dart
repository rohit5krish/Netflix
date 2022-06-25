import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/Widgets/main_title.dart';
import 'package:netflix_app/Presentation/home/widgets/animated_num_card.dart';
import 'package:netflix_app/core/constants/constants.dart';

class AnimatedHorizontalScroll extends StatelessWidget {
  const AnimatedHorizontalScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mainTitle(
            title: 'Top 10 TV Shows In India Today',
          ),
          SbHeight10,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10, (index) => AnimatedNumberCard(index: index)),
            ),
          )
        ],
      ),
    );
  }
}
