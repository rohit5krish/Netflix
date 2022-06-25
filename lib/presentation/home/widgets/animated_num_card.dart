import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';

class AnimatedNumberCard extends StatelessWidget {
  final int index;
  const AnimatedNumberCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(width: 30, height: 150),
            Container(
              width: 120,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: borderRad10,
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w220_and_h330_face/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Positioned(
            left: 0,
            bottom: -24,
            child: BorderedText(
                strokeWidth: 3,
                strokeColor: whiteclr,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                      color: bgcolor,
                      fontSize: 110,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ))),
      ],
    );
  }
}
