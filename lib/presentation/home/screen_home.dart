import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/Application/home/home_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/core/url.dart';
import 'package:netflix_app/presentation/home/widgets/animated_hori_scroll.dart';
import 'package:netflix_app/presentation/home/widgets/horizontal_scroll.dart';
import 'package:netflix_app/presentation/home/widgets/top_section.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
      },
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, value, Widget? child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ));
                      } else if (state.hasError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Error while Getting Data',
                              style: TextStyle(color: whiteclr, fontSize: 18),
                            ),
                            TextButton(
                                onPressed: () {
                                  BlocProvider.of<HomeBloc>(context)
                                      .add(const GetHomeScreenData());
                                },
                                child: const Text('Refresh'))
                          ],
                        );
                      } else {
                        // Released Past Year
                        final _releasedPastYear = state.pastYearList.map((m) {
                          return '$imgBaseUrl${m.posterPath}';
                        }).toList();

                        // Trending
                        final _trending = state.trendingMovieList.map((m) {
                          return '$imgBaseUrl${m.posterPath}';
                        }).toList();

                        // Tense Dramas
                        final _tenseDrama = state.tenseDramaList.map((m) {
                          return '$imgBaseUrl${m.posterPath}';
                        }).toList();

                        // South Indian Movies
                        final _southIndian = state.southIndianList.map((m) {
                          return '$imgBaseUrl${m.posterPath}';
                        }).toList();
                        // _releasedPastYear.shuffle();
                        // _trending.shuffle();
                        // _tenseDrama.shuffle();
                        // _southIndian.shuffle();

                        //  Top 10 Tv shows
                        final _top10TvShows = state.trendingTvList.map((t) {
                          return '$imgBaseUrl${t.posterPath}';
                        }).toList();
                        return ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            HomeTopSection(
                              imgUrls: _releasedPastYear,
                            ),
                            SbHeight10,
                            HorizontalScroll(
                              title: 'Popular on Netflix',
                              posterList: _releasedPastYear,
                            ),
                            SbHeight20,
                            HorizontalScroll(
                              title: 'Trending Now',
                              posterList: _trending,
                            ),
                            SbHeight20,
                            HorizontalScroll(
                              title: 'New Releases',
                              posterList: _trending,
                            ),
                            SbHeight20,
                            AnimatedHorizontalScroll(
                              postersList: _top10TvShows,
                            ),
                            SbHeight20,
                            HorizontalScroll(
                              title: 'US Movies',
                              posterList: _tenseDrama,
                            ),
                            SbHeight20,
                            HorizontalScroll(
                              title: 'South Indian Cinemas',
                              posterList: _southIndian,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  scrollNotifier.value
                      ? Stack(
                          children: [
                            Container(
                              height: 90,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    const Color(0xCC000000),
                                    const Color(0xCC000000).withOpacity(0.7),
                                    const Color(0xCC000000).withOpacity(0.5),
                                    const Color(0xCC000000).withOpacity(0.04),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 3000),
                              width: double.infinity,
                              height: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqyDckNxdnVn01yNXKk_BzIAgJFtAynYGkcA&usqp=CAU',
                                        width: 50,
                                        height: 50,
                                      ),
                                      const Spacer(),
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
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'TV Shows',
                                        style: homeTitle,
                                      ),
                                      Text(
                                        'Movies',
                                        style: homeTitle,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Overlay.of(context)!
                                              .insert(getEntry(context));
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              'Categories',
                                              style: homeTitle,
                                            ),
                                            const Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              color: whiteclr,
                                              size: 25,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      : SbHeight10
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomButtonHome extends StatelessWidget {
  const CustomButtonHome({
    Key? key,
    required this.icon,
    required this.icontxt,
    this.iconSize = 24,
    this.textSize = 14,
  }) : super(key: key);

  final IconData icon;
  final String icontxt;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: whiteclr,
          size: iconSize,
        ),
        Text(icontxt,
            style: TextStyle(
              fontSize: textSize,
            )),
      ],
    );
  }
}
