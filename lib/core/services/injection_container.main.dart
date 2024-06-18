import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_project/scr/auth/data/datasources/auth_remote_data_source.dart';
import 'package:education_project/scr/auth/data/repos/auth_repo_impl.dart';
import 'package:education_project/scr/auth/domain/repo/auth_repo.dart';
import 'package:education_project/scr/auth/domain/usecases/forgot_password.dart';
import 'package:education_project/scr/auth/domain/usecases/sign_in.dart';
import 'package:education_project/scr/auth/domain/usecases/sign_up.dart';
import 'package:education_project/scr/auth/domain/usecases/update_user.dart';
import 'package:education_project/scr/auth/presentation/bloc/auth_bloc.dart';
import 'package:education_project/scr/on_bording/dada/datasources/on_boding_local_data_socure.dart';
import 'package:education_project/scr/on_bording/dada/repos/on_boarding_repo_impl.dart';
import 'package:education_project/scr/on_bording/domain/repos/on_bording_repo.dart';
import 'package:education_project/scr/on_bording/domain/usecases/cache_first_timer.dart';
import 'package:education_project/scr/on_bording/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:education_project/scr/on_bording/presentation/cubit/on_bording_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
  await _initOnBoarding();
  await _initAuth();
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(
      () => AuthBloc(
        signIn: sl(),
        signUp: sl(),
        forgotPassword: sl(),
        updateUser: sl(),
      ),
    )
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => ForgotPassword(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        authClient: sl(),
        cloudStoreClient: sl(),
        dbClient: sl(),
      ),
    )
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance);
}

Future<void> _initOnBoarding() async {
  final prefs = await SharedPreferences.getInstance();
  //Feature --> OnBoarding
  //Business Logic

  sl
    ..registerFactory(
      () => OnBoardingCubit(
        cacheFirstTimer: sl(),
        checkIfUserIsFirstTimer: sl(),
      ),
    )
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))
    ..registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(sl()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSourceImpl(
        sl(),
      ),
    )
    ..registerLazySingleton(() => prefs);
}
