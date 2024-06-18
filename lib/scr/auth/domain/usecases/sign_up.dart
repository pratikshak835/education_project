import 'package:education_project/core/usecases/usecases.dart';
import 'package:education_project/core/utils/typdefs.dart';
import 'package:education_project/scr/auth/domain/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';

class SignUp extends UsecaseWithParams<void, SignUpParams> {
  SignUp(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(SignUpParams param) => _repo.signUp(
        email: param.email,
        password: param.password,
        fullName: param.fullName,
      );
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.password,
    required this.fullName,
  });

  const SignUpParams.empty()
      : this(
          email: '',
          password: '',
          fullName: '',
        );

  final String email;
  final String password;
  final String fullName;

  @override
  List<Object?> get props => [email, password, fullName];
}
