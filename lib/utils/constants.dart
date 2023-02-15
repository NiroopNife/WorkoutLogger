import 'package:flutter/material.dart';
import 'package:workout_log/model/choice_chip_model.dart';

class Constants {
  final List<ChoiceChipModel> choiceChipsList = [
    ChoiceChipModel("Cycling", Colors.green, "distance"),
    ChoiceChipModel("Yoga", Colors.green, "exercises"),
    ChoiceChipModel("Dumbbells", Colors.green, "exercises"),
    ChoiceChipModel("Plank", Colors.green, "exercises"),
    ChoiceChipModel("Warm up exercise", Colors.green, "exercises"),
    ChoiceChipModel("Walking", Colors.green, "distance"),
    ChoiceChipModel("Step count", Colors.green, "count"),
  ];
}