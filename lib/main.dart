import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_log/provider/auth_provider.dart';
import 'package:workout_log/provider/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/utils/route_manager.dart';
import 'package:workout_log/utils/strings_manager.dart';
import 'package:workout_log/utils/theme_manager.dart';
import 'package:workout_log/view/auth/login_screen.dart';
import 'package:workout_log/view/dashboard/dashboard_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await ScreenUtil.ensureScreenSize();
  runApp(const WorkoutLoggerApp());
}

class WorkoutLoggerApp extends StatelessWidget {
  const WorkoutLoggerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkoutProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            onGenerateRoute: RouteGenerator.getRoute,
            debugShowCheckedModeBanner: false,
            title: AppStrings.appTitle,
            theme: getApplicationTheme(),
            home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const DashboardScreen();
                } else {
                  return const LoginScreen();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
