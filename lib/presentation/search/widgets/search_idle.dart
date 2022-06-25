import 'package:flutter/cupertino.dart';
import 'package:netflix_app/Presentation/Widgets/main_title.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';

final searchImg =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/8H64YmIYxpRJgSTuLUGRUSyi2kN.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mainTitle(
          title: 'Top Searches',
        ),
        SbHeight10,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => TopSearch(),
              separatorBuilder: (context, index) => SbHeight20,
              itemCount: 15),
        )
      ],
    );
  }
}

class TopSearch extends StatelessWidget {
  const TopSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.3,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(searchImg),
          )),
        ),
        Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Icon(
          CupertinoIcons.play_circle,
          size: 50,
          color: whiteclr,
        )
      ],
    );
  }
}
