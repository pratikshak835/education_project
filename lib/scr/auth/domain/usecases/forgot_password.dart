import 'package:education_project/core/usecases/usecases.dart';
import 'package:education_project/core/utils/typdefs.dart';
import 'package:education_project/scr/auth/domain/repo/auth_repo.dart';

class ForgotPassword extends UsecaseWithParams<void, String> {
  ForgotPassword(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(String param) => _repo.forgotPassword(param);
}
