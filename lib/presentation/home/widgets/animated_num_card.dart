import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';

class AnimatedNumberCard extends StatelessWidget {
  final int index;
  final String imgurl;
  const AnimatedNumberCard(
      {Key? key, required this.index, required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(width: 30, height: 150),
            Container(
              width: 120,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: borderRad10,
                image: DecorationImage(
                  image: NetworkImage(imgurl),
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
                  style: const TextStyle(
                      color: bgcolor,
                      fontSize: 110,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ))),
      ],
    );
  }
}
