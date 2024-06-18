import 'package:education_project/core/utils/typdefs.dart';

abstract class UsecaseWithParams<Type, Params> {
  UsecaseWithParams();

  ResultFuture<Type> call(Params param);
}

abstract class UsecaseWithOutParams<Type> {
  UsecaseWithOutParams();

  ResultFuture<Type> call();
}
