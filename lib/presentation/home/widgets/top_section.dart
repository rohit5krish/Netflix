import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/home/screen_home.dart';
import 'package:netflix_app/core/colors/colors.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w220_and_h330_face/6JjfSchsU6daXk2AKX8EEBjO3Fm.jpg'))),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonHome(
                  icon: Icons.add,
                  icontxt: 'My List',
                ),
                _playButtonHome(),
                CustomButtonHome(
                  icon: Icons.info_outline,
                  icontxt: 'Info',
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  ElevatedButton _playButtonHome() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(primary: whiteclr),
      onPressed: () {},
      icon: Icon(
        Icons.play_arrow_rounded,
        color: bgcolor,
        size: 30,
      ),
      label: Text('Play',
          style: TextStyle(
            color: bgcolor,
            fontSize: 16,
          )),
    );
  }
}
