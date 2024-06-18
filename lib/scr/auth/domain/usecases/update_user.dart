import 'package:education_project/core/common/enums/update_user.dart';
import 'package:education_project/core/usecases/usecases.dart';
import 'package:education_project/core/utils/typdefs.dart';
import 'package:education_project/scr/auth/domain/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';

class UpdateUser extends UsecaseWithParams<void, UpdateUserParams> {
  UpdateUser(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(UpdateUserParams param) => _repo.updateUser(
        action: param.action,
        userData: param.userData,
      );
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({
    required this.action,
    required this.userData,
  });

  const UpdateUserParams.empty()
      : this(
          action: UpdateUserAction.displayName,
          userData: '',
        );

  final UpdateUserAction action;
  final dynamic userData;

  @override
  List<Object?> get props => [
        action,
        userData,
      ];
}
