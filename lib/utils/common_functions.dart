extension WorkoutMeasurement on String {
  String get workoutValue {
    switch (this) {
      case "distance":
        return "km";
      case "time":
        return "hrs";
      case "reps":
        return "reps";
      case "sets":
        return "sets";
      default:
        return '';
    }
  }

  String get workoutHint {
    switch (this) {
      case "distance":
      case "reps":
      case "sets":
        return "0";
      case "time":
        return "00:00:00";
      default:
        return '';
    }
  }
}