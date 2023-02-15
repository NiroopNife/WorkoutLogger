import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:workout_log/model/workout_model.dart';

class WorkoutProvider extends ChangeNotifier {

  WorkoutModel? model;
  Workout? workoutSelected;

  int? _selectedWorkoutTypeIndex;
  int? get selectedIndex => _selectedWorkoutTypeIndex;

  int? _selectedExerciseValue;
  int? get selectedExerciseValue => _selectedExerciseValue;

  TextEditingController? controller;

  bool isCompleted = false;
  bool isWorkoutTypeSelected = false;
  bool hasExercise = false;
  bool isStretchedDropDown = false;
  bool isExerciseSelected = false;

  String? _selectedWorkout;
  String? get selectedWorkout => _selectedWorkout;

  String selectedExercise = 'Select Exercise';

  Map<String, TextEditingController> workoutEditingControllers = {};

  void setExercise(int value) {
    _selectedExerciseValue = value;
    notifyListeners();
  }

  fetchExercises() async {
    final String json = await rootBundle.loadString("assets/json/all_workout.json");
    model = workoutModelFromJson(json);
  }

  toggleDropDown() {
    isStretchedDropDown = !isStretchedDropDown;
    notifyListeners();
  }

  selectTypeOfWorkout(int selectedType, String title, Workout workout) {
    _selectedWorkoutTypeIndex = selectedType;
    _selectedWorkout = title;
    isWorkoutTypeSelected = true;
    workoutSelected = workout;
    checkForExercise(workout);
    notifyListeners();
  }

  checkForExercise(Workout workout) {
    if (workout.subType.isNotEmpty) {
      hasExercise = true;
    } else {
      isExerciseSelected = true;
    }
  }

  selectTypeOfExercise({required String title, required int value, required bool isStretched}) {
    selectedExercise = title;
    _selectedExerciseValue = value;
    isStretchedDropDown = isStretched;
    isExerciseSelected = true;
    notifyListeners();
  }

  fetchControllers(Workout selectedWorkout) {

  }

  enableButton() {
    isCompleted = true;
    notifyListeners();
  }

  submitWorkout() {
    for (var element in workoutSelected!.measurement) {
      if (element.isEmpty) {
        break;
      }
    }
    log("Workout selected ${workoutSelected!.type} exercise selected $selectedExercise ");
  }

  clearWorkout() {
    _selectedWorkoutTypeIndex = null;
    _selectedWorkout = null;
    workoutSelected = null;
    isWorkoutTypeSelected = false;
    hasExercise = false;
    selectedExercise = 'Select Exercise';
    _selectedExerciseValue = null;
    isExerciseSelected = false;
    notifyListeners();
  }

  clearData() {
    _selectedWorkoutTypeIndex = null;
    _selectedWorkout = null;
    workoutSelected = null;
    isWorkoutTypeSelected = false;
    hasExercise = false;
    selectedExercise = 'Select Exercise';
    _selectedExerciseValue = null;
    isExerciseSelected = false;
  }

}