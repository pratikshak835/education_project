import 'package:education_project/core/common/views/page_under_construction.dart';
import 'package:education_project/core/extensions/contex_extensions.dart';
import 'package:education_project/core/services/injection_container.main.dart';
import 'package:education_project/scr/auth/data/models/user_model.dart';
import 'package:education_project/scr/auth/presentation/bloc/auth_bloc.dart';
import 'package:education_project/scr/auth/presentation/views/sign_in_screen.dart';
import 'package:education_project/scr/auth/presentation/views/sign_up_screen.dart';
import 'package:education_project/scr/dashboard/presentation/views/dashboard.dart';
import 'package:education_project/scr/on_bording/dada/datasources/on_boding_local_data_socure.dart';
import 'package:education_project/scr/on_bording/presentation/cubit/on_bording_cubit.dart';
import 'package:education_project/scr/on_bording/presentation/views/on_bording_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      final prefs = sl<SharedPreferences>();
      return _pageBuilder(
        (context) {
          if (prefs.getBool(kFirstTimerKey) ?? true) {
            return BlocProvider(
              create: (_) => sl<OnBoardingCubit>(),
              child: const OnBoardingScreen(),
            );
          } else if (sl<FirebaseAuth>().currentUser != null) {
            final user = sl<FirebaseAuth>().currentUser!;
            final localUser = LocalUserModel(
              uid: user.uid,
              email: user.email ?? '',
              points: 0,
              fullName: user.displayName ?? '',
            );
            context.userProvider.initUser(localUser);
            return const Dashboard();
          }
          return BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const SignInScreen(),
          );
        },
        settings: settings,
      );
    case SignInScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const SignInScreen(),
        ),
        settings: settings,
      );
    case SignUpScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const SignUpScreen(),
        ),
        settings: settings,
      );
    case Dashboard.routeName:
      return _pageBuilder(
        (_) => const Dashboard(),
        settings: settings,
      );

    // case '/forgot-password':
    //   return _pageBuilder(
    //     (_) => const fui.ForgotPasswordScreen(),
    //     settings: settings,
    //   );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(
      context,
    ),
  );
}
