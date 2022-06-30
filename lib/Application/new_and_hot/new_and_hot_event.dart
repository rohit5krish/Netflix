part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotEvent with _$NewAndHotEvent {
  const factory NewAndHotEvent.comingSoonLoadData() = ComingSoonLoadData;
  const factory NewAndHotEvent.everyoneWatchingLoadData() =
      EveryoneWatchingLoadData;
}
