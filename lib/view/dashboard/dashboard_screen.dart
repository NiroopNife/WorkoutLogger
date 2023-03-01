import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/provider/workout_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widget/add_workout_form_dialog.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  late FirebaseAuth _auth;

  final user = FirebaseAuth.instance.currentUser!;


  WorkoutProvider? provider;

  User? getUser() {

  }

  @override
  void initState() {
    super.initState();
    provider = Provider.of<WorkoutProvider>(context, listen: false);
    fetchData();
  }

  fetchData() async {
    await provider!.fetchExercises();
  }

  signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email!),
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return const AddWorkoutFormDialog();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
