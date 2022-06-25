import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/Widgets/main_card.dart';
import 'package:netflix_app/Presentation/Widgets/main_title.dart';

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
              children: List.generate(10, (index) => const MainCard()),
            ),
          )
        ],
      ),
    );
  }
}
