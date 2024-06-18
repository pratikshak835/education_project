import 'package:education_project/core/common/features/course/domain/entities/course.dart';
import 'package:education_project/core/utils/typdefs.dart';

abstract class CourseRepo {
  const CourseRepo();

  ResultFuture<List<Course>> getCourses();

  ResultFuture<void> addCourse(Course course);
}
