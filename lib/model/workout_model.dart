import 'dart:convert';

WorkoutModel workoutModelFromJson(String str) => WorkoutModel.fromJson(json.decode(str));

String workoutModelToJson(WorkoutModel data) => json.encode(data.toJson());

class WorkoutModel {
  WorkoutModel({
    required this.workouts,
  });

  final List<Workout> workouts;

  factory WorkoutModel.fromJson(Map<String, dynamic> json) => WorkoutModel(
    workouts: List<Workout>.from(json["workouts"].map((x) => Workout.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "workouts": List<dynamic>.from(workouts.map((x) => x.toJson())),
  };
}

class Workout {
  Workout({
    required this.type,
    required this.subType,
    required this.measurement,
  });

  final String type;
  final List<String> subType;
  final List<String> measurement;

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
    type: json["type"],
    subType: List<String>.from(json["subType"].map((x) => x)),
    measurement: List<String>.from(json["measurement"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "subType": List<dynamic>.from(subType.map((x) => x)),
    "measurement": List<dynamic>.from(measurement.map((x) => x)),
  };
}
