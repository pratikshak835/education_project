import 'package:dartz/dartz.dart';
import 'package:education_project/core/common/features/course/domain/entities/course.dart';
import 'package:education_project/core/common/features/course/domain/repos/course_repo.dart';
import 'package:education_project/core/common/features/course/domain/usecases/add_course.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'course_repo.mock.dart';

void main() {
  late CourseRepo repo;
  late AddCourse usecase;

  final tCourse = Course.empty();

  setUp(() {
    repo = MockCourseRepo();
    usecase = AddCourse(repo);
    registerFallbackValue(tCourse);
  });

  test(
    'should call [CourseRepo.addCourse]',
    () async {
      // arrange
      when(() => repo.addCourse(any()))
          .thenAnswer((_) async => const Right(null));
      // act
      await usecase.call(tCourse);
      // assert
      verify(() => repo.addCourse(tCourse)).called(1);
      verifyNoMoreInteractions(repo);
    },
  );
}
