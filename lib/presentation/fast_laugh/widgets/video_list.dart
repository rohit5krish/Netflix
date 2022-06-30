import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/Application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/url.dart';
import 'package:netflix_app/domain/downloads/model/downloads.dart';
import 'package:netflix_app/presentation/fast_laugh/widgets/reel_buttons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItems extends StatelessWidget {
  final int index;
  const VideoListItems({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterImg =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoLink = videoUrls[index % videoUrls.length];
    return Stack(
      children: [
        // BackGround Main Content
        FastLaughVideoPlayer(
          videoUrl: videoLink,
          onStateChanged: (bool) {},
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
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: posterImg == null
                            ? null
                            : NetworkImage(
                                '$imgBaseUrl$posterImg',
                              ),
                      )),
                  ValueListenableBuilder(
                      valueListenable: likedVideoNotifier,
                      builder: (BuildContext context, Set<int> newLikedList,
                          Widget? child) {
                        final _index = index;
                        if (newLikedList.contains(_index)) {
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<FastLaughBloc>(context)
                                  .add(UnLikeVideo(id: _index));
                              // likedVideoNotifier.value.remove(_index);
                              // likedVideoNotifier.notifyListeners();
                            },
                            child: const ReelActionButtons(
                                icon: Icons.favorite_outline, title: 'Liked'),
                          );
                        }
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<FastLaughBloc>(context)
                                .add(LikeVideo(id: _index));
                            // likedVideoNotifier.value.add(_index);
                            // likedVideoNotifier.notifyListeners();
                          },
                          child: const ReelActionButtons(
                              icon: Icons.emoji_emotions, title: 'LOL'),
                        );
                      }),
                  const ReelActionButtons(icon: Icons.add, title: 'My List'),
                  InkWell(
                    onTap: () {
                      final movieDat =
                          VideoListItemInheritedWidget.of(context)?.movieData;
                      final movieName = movieDat!.title ?? movieDat.title2;
                      Share.share(movieName.toString());
                    },
                    child: const ReelActionButtons(
                        icon: Icons.share, title: 'Share'),
                  ),
                  const ReelActionButtons(
                      icon: Icons.play_arrow, title: 'Play'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;

  const FastLaughVideoPlayer(
      {Key? key, required this.videoUrl, required this.onStateChanged})
      : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
