import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/model/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final videoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp40",
];

ValueNotifier<Set<int>> likedVideoNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsRepo _downloadService)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.videosList.isNotEmpty) {
        emit(state);
        return;
      }

      emit(FastLaughState(
        videosList: [],
        isLoading: true,
        isError: false,
      ));

      // get trending movies
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold(
        (l) {
          return FastLaughState(
            videosList: [],
            isLoading: false,
            isError: true,
          );
        },
        (response) => FastLaughState(
          videosList: response,
          isLoading: false,
          isError: false,
        ),
      );
      // send to ui
      emit(_state);
    });

    on<LikeVideo>((event, emit) async {
      likedVideoNotifier.value.add(event.id);
      likedVideoNotifier.notifyListeners();
    });
    on<UnLikeVideo>((event, emit) async {
      likedVideoNotifier.value.remove(event.id);
      likedVideoNotifier.notifyListeners();
    });
  }
}
