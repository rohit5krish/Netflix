import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/new_and_hot_resp/model/new_and_hot_resp.dart';
import 'package:netflix_app/domain/new_and_hot_resp/new_and_hot_service.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NewAndHotService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    on<GetHomeScreenData>((event, emit) async {
      if (state.pastYearList.isNotEmpty) {
        emit(state);
        return;
      }

      // Send Loading to UI
      emit(state.copyWith(
        isLoading: true,
        hasError: false,
      ));

      // Get Data
      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      // Transform Data
      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return HomeState(
            pastYearList: [],
            trendingMovieList: [],
            tenseDramaList: [],
            southIndianList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          );
        },
        (NewAndHotResp resp) {
          final pastYear = resp.results;
          final trendingMovie = resp.results;
          final tenseDrama = resp.results;
          final southIndian = resp.results;
          pastYear.shuffle();
          trendingMovie.shuffle();
          tenseDrama.shuffle();
          southIndian.shuffle();
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearList: pastYear.sublist(0, 10),
            trendingMovieList: trendingMovie.sublist(0, 10),
            tenseDramaList: tenseDrama.sublist(0, 10),
            southIndianList: southIndian.sublist(0, 10),
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_state1);

      final _state2 = _tvResult.fold(
        (MainFailure failure) {
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearList: [],
            trendingMovieList: [],
            tenseDramaList: [],
            southIndianList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (NewAndHotResp resp) {
          final top10List = resp.results;
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearList: state.pastYearList,
            trendingMovieList: state.trendingMovieList,
            tenseDramaList: state.tenseDramaList,
            southIndianList: state.southIndianList,
            trendingTvList: top10List.sublist(0, 10),
            isLoading: false,
            hasError: false,
          );
        },
      );

      // Send to UI

      emit(_state2);
    });
  }
}
