import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/Application/new_and_hot/new_and_hot_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/core/url.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_content.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everyones_watching_content.dart';

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
          ComingSoonPage(
            key: Key('coming_soon'),
          ),
          EveryoneWatchingPage(
            key: Key('everyone_watching'),
          ),
        ]),
      ),
    );
  }
}

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context).add(ComingSoonLoadData());
    });
    return RefreshIndicator(
      color: Colors.black,
      onRefresh: () async {
        BlocProvider.of<NewAndHotBloc>(context).add(ComingSoonLoadData());
      },
      child:
          BlocBuilder<NewAndHotBloc, NewAndHotState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return Center(child: Text('Error while Loading coming soon list'));
        } else if (state.comingSoonList.isEmpty) {
          return Center(child: Text('Coming soon List is empty'));
        } else {
          return ListView.builder(
            itemCount: state.comingSoonList.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              String month = '';
              try {
                final _date = DateTime.tryParse(movie.releaseDate.toString());
                final formattedDate = DateFormat.yMMMMd('en_US').format(_date!);
                month = formattedDate.split(' ').first.substring(0, 3);
              } catch (_) {
                month = '';
              }

              return Padding(
                padding: EdgeInsets.only(top: 10),
                child: ComingSoonContent(
                  id: movie.id.toString(),
                  month: month,
                  day: movie.releaseDate!.split('-')[1],
                  posterPath: '$imgBaseUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No Title',
                  description: movie.overview ?? 'No Description',
                ),
              );
            },
          );
        }
      }),
    );
  }
}

class EveryoneWatchingPage extends StatelessWidget {
  const EveryoneWatchingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context).add(EveryoneWatchingLoadData());
    });
    return RefreshIndicator(
      color: Colors.black,
      onRefresh: () async {
        BlocProvider.of<NewAndHotBloc>(context).add(EveryoneWatchingLoadData());
      },
      child:
          BlocBuilder<NewAndHotBloc, NewAndHotState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return Center(child: Text('Error while Loading coming soon list'));
        } else if (state.everyoneWatchingList.isEmpty) {
          return Center(child: Text('List is empty'));
        } else {
          return ListView.builder(
            itemCount: state.everyoneWatchingList.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = state.everyoneWatchingList[index];
              if (movie.id == null) {
                return const SizedBox();
              }

              return Padding(
                padding: EdgeInsets.only(top: 10),
                child: EveryonesWatchingContent(
                  posterPath: '$imgBaseUrl${movie.posterPath}',
                  movieName: movie.originalName ?? 'No Title',
                  description: movie.overview ?? 'No Description',
                ),
              );
            },
          );
        }
      }),
    );
  }
}
