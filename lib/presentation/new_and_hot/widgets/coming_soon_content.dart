import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/Widgets/video_widget.dart';
import 'package:netflix_app/Presentation/home/screen_home.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';

class ComingSoonContent extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingSoonContent({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Text(
                month,
                style: const TextStyle(
                  color: greyclr,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(day,
                  style: const TextStyle(
                      letterSpacing: 4,
                      color: whiteclr,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                url: posterPath,
              ),
              SbHeight20,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          // letterSpacing: -3,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const CustomButtonHome(
                    icon: Icons.notifications_outlined,
                    icontxt: 'Remind Me',
                    iconSize: 22,
                    textSize: 10,
                  ),
                  SbWidth20,
                  const CustomButtonHome(
                    icon: Icons.info_outline,
                    icontxt: 'Info',
                    iconSize: 22,
                    textSize: 10,
                  ),
                  SbWidth20,
                ],
              ),
              SbHeight10,
              Text(
                'Coming on $day $month',
                style: const TextStyle(
                  color: greyclr,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SbHeight20,
              SizedBox(
                width: 200,
                child: Text(movieName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SbHeight10,
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(color: greyclr),
              ),
              SbHeight30,
            ],
          ),
        ),
      ],
    );
  }
}
