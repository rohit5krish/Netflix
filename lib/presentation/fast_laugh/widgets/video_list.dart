import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class VideoListItems extends StatelessWidget {
  final int index;
  const VideoListItems({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // BackGround Main Content
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Side Mute
              CircleAvatar(
                radius: 27,
                backgroundColor: bgcolor.withOpacity(0.3),
                child: const Icon(
                  Icons.volume_off,
                  color: whiteclr,
                  size: 30,
                ),
              ),
              // Right Side
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              'https://www.themoviedb.org/t/p/w220_and_h330_face/6JjfSchsU6daXk2AKX8EEBjO3Fm.jpg'))),
                  ReelActionButtons(icon: Icons.emoji_emotions, title: 'LOL'),
                  ReelActionButtons(icon: Icons.add, title: 'My List'),
                  ReelActionButtons(icon: Icons.share, title: 'Share'),
                  ReelActionButtons(icon: Icons.play_arrow, title: 'Play'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class ReelActionButtons extends StatelessWidget {
  final IconData icon;
  final String title;
  const ReelActionButtons({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 7),
      child: Column(
        children: [
          Icon(
            icon,
            color: whiteclr,
            size: 27,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
