// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../Application/downloads/downloads_bloc.dart' as _i9;
import '../../../Application/fast_laugh/fast_laugh_bloc.dart' as _i10;
import '../../../Application/home/home_bloc.dart' as _i11;
import '../../../Application/new_and_hot/new_and_hot_bloc.dart' as _i12;
import '../../../Application/search/search_bloc.dart' as _i13;
import '../../../infrastructure/downloads/downloads_repository.dart' as _i4;
import '../../../infrastructure/new_and_hot/new_and_hot_impl.dart' as _i6;
import '../../../infrastructure/search/search_implement.dart' as _i8;
import '../../downloads/i_downloads_repo.dart' as _i3;
import '../../new_and_hot_resp/new_and_hot_service.dart' as _i5;
import '../../search/search_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IDownloadsRepo>(() => _i4.DownloadsRepository());
  gh.lazySingleton<_i5.NewAndHotService>(() => _i6.NewAndHotImpl());
  gh.lazySingleton<_i7.SearchService>(() => _i8.SearchImplement());
  gh.factory<_i9.DownloadsBloc>(
      () => _i9.DownloadsBloc(get<_i3.IDownloadsRepo>()));
  gh.factory<_i10.FastLaughBloc>(
      () => _i10.FastLaughBloc(get<_i3.IDownloadsRepo>()));
  gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(get<_i5.NewAndHotService>()));
  gh.factory<_i12.NewAndHotBloc>(
      () => _i12.NewAndHotBloc(get<_i5.NewAndHotService>()));
  gh.factory<_i13.SearchBloc>(() =>
      _i13.SearchBloc(get<_i3.IDownloadsRepo>(), get<_i7.SearchService>()));
  return get;
}
