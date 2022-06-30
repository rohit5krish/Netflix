import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/new_and_hot_resp/model/new_and_hot_resp.dart';
import 'package:netflix_app/domain/new_and_hot_resp/new_and_hot_service.dart';

part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';
part 'new_and_hot_bloc.freezed.dart';

@injectable
class NewAndHotBloc extends Bloc<NewAndHotEvent, NewAndHotState> {
  final NewAndHotService _newAndHotService;
  NewAndHotBloc(this._newAndHotService) : super(NewAndHotState.initial()) {
    on<ComingSoonLoadData>((event, emit) async {
      if (state.comingSoonList.isNotEmpty) {
        emit(state);
        return;
      }

      emit(NewAndHotState(
        comingSoonList: [],
        everyoneWatchingList: [],
        isLoading: true,
        hasError: false,
      ));

      final _result = await _newAndHotService.getHotAndNewMovieData();
      final newState = _result.fold((MainFailure f) {
        return NewAndHotState(
          comingSoonList: [],
          everyoneWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (NewAndHotResp resp) {
        return NewAndHotState(
          comingSoonList: resp.results,
          everyoneWatchingList: state.everyoneWatchingList,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });

    on<EveryoneWatchingLoadData>((event, emit) async {
      if (state.everyoneWatchingList.isNotEmpty) {
        emit(state);
        return;
      }

      emit(NewAndHotState(
        comingSoonList: [],
        everyoneWatchingList: [],
        isLoading: true,
        hasError: false,
      ));

      final _result = await _newAndHotService.getHotAndNewTvData();
      final newState = _result.fold((MainFailure f) {
        return NewAndHotState(
          comingSoonList: [],
          everyoneWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (NewAndHotResp resp) {
        return NewAndHotState(
          comingSoonList: state.comingSoonList,
          everyoneWatchingList: resp.results,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });
  }
}
