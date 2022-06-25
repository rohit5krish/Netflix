import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/Widgets/video_widget.dart';
import 'package:netflix_app/Presentation/home/screen_home.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';

class ComingSoonContent extends StatelessWidget {
  const ComingSoonContent({
    Key? key,
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
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                  color: greyclr,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('11',
                  style: TextStyle(
                      letterSpacing: 4,
                      color: whiteclr,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 470,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              SbHeight20,
              Row(
                children: const [
                  Text(
                    'TALLGIRL 2',
                    style: TextStyle(
                      letterSpacing: -3,
                      fontSize: 33,
                    ),
                  ),
                  Spacer(),
                  CustomButtonHome(
                    icon: Icons.notifications_outlined,
                    icontxt: 'Remind Me',
                    iconSize: 22,
                    textSize: 10,
                  ),
                  SbWidth20,
                  CustomButtonHome(
                    icon: Icons.info_outline,
                    icontxt: 'Info',
                    iconSize: 22,
                    textSize: 10,
                  ),
                  SbWidth20,
                ],
              ),
              SbHeight10,
              const Text(
                'Coming on Friday',
                style: TextStyle(
                  color: greyclr,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SbHeight20,
              const Text('Tall Girl 2',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              SbHeight10,
              const Text(
                'Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence -- and her relationship -- into a tailspain.',
                style: const TextStyle(color: greyclr),
              )
            ],
          ),
        ),
      ],
    );
  }
}
