import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/Application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/presentation/fast_laugh/widgets/video_list.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              return Center(child: Text('Error Occured'));
            } else if (state.videosList.isEmpty) {
              return Center(child: Text('Video List Empty'));
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(state.videosList.length, (index) {
                  return VideoListItemInheritedWidget(
                    widget: VideoListItems(index: index),
                    movieData: state.videosList[index],
                  );
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
