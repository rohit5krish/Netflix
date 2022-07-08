part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<NewAndHotData> pastYearList,
    required List<NewAndHotData> trendingMovieList,
    required List<NewAndHotData> tenseDramaList,
    required List<NewAndHotData> southIndianList,
    required List<NewAndHotData> trendingTvList,
    required bool isLoading,
    required bool hasError,
    required String stateId,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
        pastYearList: [],
        trendingMovieList: [],
        tenseDramaList: [],
        southIndianList: [],
        trendingTvList: [],
        isLoading: false,
        hasError: false,
        stateId: '0',
      );
}
