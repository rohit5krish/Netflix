import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/Widgets/app_bar_widget.dart';
import 'package:netflix_app/Presentation/Widgets/video_widget.dart';
import 'package:netflix_app/Presentation/home/screen_home.dart';
import 'package:netflix_app/Presentation/new_and_hot/widgets/coming_soon_content.dart';
import 'package:netflix_app/Presentation/new_and_hot/widgets/everyones_watching_content.dart';
import 'package:netflix_app/Presentation/search/widgets/search_result.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New & Hot',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
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
          bottom: TabBar(
              isScrollable: true,
              labelColor: bgcolor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: whiteclr,
              indicator: BoxDecoration(
                color: whiteclr,
                borderRadius: borderRad30,
              ),
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(text: "👀 Everyone's Watching ")
              ]),
        ),
        body: TabBarView(children: [
          _comingSoonPage(context),
          _everyonesWatchingPage(context),
        ]),
      ),
    );
  }

  Widget _comingSoonPage(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.only(top: 10),
          child: ComingSoonContent(),
        );
      },
    );
  }

  Widget _everyonesWatchingPage(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return EveryonesWatchingContent();
        });
  }
}
