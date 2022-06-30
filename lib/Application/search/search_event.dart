part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.initialize() = Initialize;
  const factory SearchEvent.searchMovies({
    required String movieQuery,
  }) = SearchMovies;
}
