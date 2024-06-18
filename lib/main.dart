import 'package:education_project/core/colours.dart';
import 'package:education_project/core/common/app/providers/user_providers.dart';
import 'package:education_project/core/res/fonts.dart';
import 'package:education_project/core/services/injection_container.main.dart';
import 'package:education_project/core/services/router.dart';
import 'package:education_project/firebase_options.dart';
import 'package:education_project/scr/dashboard/presentation/providers/dashboard_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
          fontFamily: Fonts.poppins,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
