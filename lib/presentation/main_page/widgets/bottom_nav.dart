import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';

ValueNotifier<int> indexchange = ValueNotifier(0);

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexchange,
      builder: (BuildContext context, int newIndex, Widget? child) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            onTap: (index) {
              indexchange.value = index;
            },
            backgroundColor: bgcolor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(color: Colors.white),
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            selectedFontSize: 12,
            unselectedFontSize: 10,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_collection_outlined),
                  label: 'New & Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_rounded), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_circle_down), label: 'Downloads')
            ]);
      },
    );
  }
}
