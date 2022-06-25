// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/core/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SbWidth10,
        Expanded(
            child: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.cast,
              color: Colors.white,
              size: 30,
            )),
        SbWidth10,
        Container(
          color: Colors.grey.withOpacity(0.5),
          height: 30,
          width: 30,
        ),
        SbWidth10
      ],
    );
  }
}
