import 'package:education_project/core/common/features/course/domain/entities/course.dart';
import 'package:education_project/core/common/features/course/domain/repos/course_repo.dart';
import 'package:education_project/core/usecases/usecases.dart';
import 'package:education_project/core/utils/typdefs.dart';

class GetCourses extends UsecaseWithOutParams<List<Course>> {
  GetCourses(this._repo);

  final CourseRepo _repo;

  @override
  ResultFuture<List<Course>> call() async => _repo.getCourses();
}
