import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/api_endpoints.dart';
import 'package:netflix_app/domain/new_and_hot_resp/model/new_and_hot_resp.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/new_and_hot_resp/new_and_hot_service.dart';

@LazySingleton(as: NewAndHotService)
class NewAndHotImpl implements NewAndHotService {
  @override
  Future<Either<MainFailure, NewAndHotResp>> getHotAndNewMovieData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.newAndHotMovie);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = NewAndHotResp.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, NewAndHotResp>> getHotAndNewTvData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.newAndHotTv);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = NewAndHotResp.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
