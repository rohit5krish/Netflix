import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/new_and_hot_resp/model/new_and_hot_resp.dart';

abstract class NewAndHotService {
  Future<Either<MainFailure, NewAndHotResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, NewAndHotResp>> getHotAndNewTvData();
}
