import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/Widgets/main_title.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/Widgets/main_card.dart';

class HorizontalScroll extends StatelessWidget {
  final String title;
  final List<String> posterList;
  const HorizontalScroll({
    Key? key,
    required this.title,
    required this.posterList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mainTitle(
            title: title,
          ),
          SbHeight10,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(posterList.length,
                  (index) => MainCard(imgUrl: posterList[index])),
            ),
          )
        ],
      ),
    );
  }
}
