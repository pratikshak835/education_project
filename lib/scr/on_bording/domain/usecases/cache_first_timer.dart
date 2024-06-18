import 'package:education_project/core/usecases/usecases.dart';
import 'package:education_project/core/utils/typdefs.dart';
import 'package:education_project/scr/on_bording/domain/repos/on_bording_repo.dart';

class CacheFirstTimer extends UsecaseWithOutParams<void> {
  CacheFirstTimer(this._repo);

  final OnBoardingRepo _repo;

  @override
  ResultFuture<void> call() async => _repo.cacheFirstTimer();
}
