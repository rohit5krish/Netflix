import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';

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
