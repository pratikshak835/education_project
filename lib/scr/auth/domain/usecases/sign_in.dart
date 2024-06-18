import 'package:education_project/core/usecases/usecases.dart';
import 'package:education_project/core/utils/typdefs.dart';
import 'package:education_project/scr/auth/domain/entities/user.dart';
import 'package:education_project/scr/auth/domain/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';

class SignIn extends UsecaseWithParams<LocalUser, SignInParams> {
  SignIn(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<LocalUser> call(SignInParams param) => _repo.signIn(
        email: param.email,
        password: param.password,
      );
}

class SignInParams extends Equatable {
  const SignInParams({required this.email, required this.password});

  const SignInParams.empty()
      : this(
          email: '',
          password: '',
        );

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
