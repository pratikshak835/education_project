import 'package:dartz/dartz.dart';
import 'package:education_project/scr/on_bording/domain/repos/on_bording_repo.dart';
import 'package:education_project/scr/on_bording/domain/usecases/cache_first_timer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'on_bording_repo.mock.dart';

void main() {
  late OnBoardingRepo repo;
  late CacheFirstTimer usecase;

  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CacheFirstTimer(repo);
  });

  test('should get response from the [MockOnBodingRepo]', () async {
    //arrange
    when(() => repo.cacheFirstTimer())
        .thenAnswer((_) async => const Right(true));

    //act
    final result = await usecase();

    //assert
    expect(result, equals(const Right<dynamic, bool>(true)));
    verify(() => repo.cacheFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
