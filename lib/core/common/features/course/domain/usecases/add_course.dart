import 'package:education_project/core/common/features/course/domain/entities/course.dart';
import 'package:education_project/core/common/features/course/domain/repos/course_repo.dart';
import 'package:education_project/core/usecases/usecases.dart';
import 'package:education_project/core/utils/typdefs.dart';

class AddCourse extends UsecaseWithParams<void, Course> {
  AddCourse(this._repo);

  final CourseRepo _repo;

  @override
  ResultFuture<void> call(Course params) async => _repo.addCourse(params);
}
