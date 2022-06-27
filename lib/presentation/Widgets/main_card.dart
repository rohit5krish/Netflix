import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 120,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: borderRad10,
        image: const DecorationImage(
          image: NetworkImage(
              'https://www.themoviedb.org/t/p/w220_and_h330_face/74kkM7E5IymHl7ZS4XugP6YT3zU.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
