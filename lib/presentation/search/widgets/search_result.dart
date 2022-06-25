import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/Widgets/main_card.dart';
import 'package:netflix_app/Presentation/Widgets/main_title.dart';
import 'package:netflix_app/core/constants/constants.dart';

const imgurl =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/6JjfSchsU6daXk2AKX8EEBjO3Fm.jpg';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const mainTitle(title: 'Movies & TV'),
        SbHeight10,
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.5,
          children: List.generate(20, (index) {
            return const MainCard();
          }),
        ))
      ],
    );
  }
}
