import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workout_log/provider/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/view/auth/login_view.dart';
import 'package:workout_log/view/dashboard_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const WorkoutLoggerApp());
}

class WorkoutLoggerApp extends StatelessWidget {
  const WorkoutLoggerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkoutProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const DashboardView();
            } else {
              return const LoginView();
            }
          },
        ),
      ),
    );
  }
}
