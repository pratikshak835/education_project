import 'package:dartz/dartz.dart';
import 'package:education_project/core/error/exception.dart';
import 'package:education_project/core/error/failures.dart';
import 'package:education_project/core/utils/typdefs.dart';
import 'package:education_project/scr/on_bording/dada/datasources/on_boding_local_data_socure.dart';
import 'package:education_project/scr/on_bording/domain/repos/on_bording_repo.dart';

class OnBoardingRepoImpl extends OnBoardingRepo {
  const OnBoardingRepoImpl(this._localDataSource);

  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async {
    try {
      final result = await _localDataSource.checkIfUserIsFirstTimer();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
