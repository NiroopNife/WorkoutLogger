import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/provider/workout_provider.dart';
import 'package:workout_log/utils/common_functions.dart';

import '../../utils/text_input_formatter.dart';

class MeasurementWidget extends StatefulWidget {
  const MeasurementWidget({Key? key}) : super(key: key);

  @override
  State<MeasurementWidget> createState() => _MeasurementWidgetState();
}

class _MeasurementWidgetState extends State<MeasurementWidget> {
  WorkoutProvider? provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<WorkoutProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var workoutLogField = <Widget>[];

    for (var workout in provider!.workoutSelected!.measurement) {
      var textEditingController = TextEditingController();
      provider!.workoutEditingControllers.putIfAbsent(workout, () => textEditingController);
      workoutLogField.add(Flexible(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Text(workout.toUpperCase()),
              Row(
                children: [
                  Flexible(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: provider!.controller,
                          keyboardType: const TextInputType.numberWithOptions(decimal: false),
                          decoration: InputDecoration(
                            hintText: workout.workoutHint,
                          ),
                          onChanged: (val) {
                            for (var element in provider!.workoutSelected!.measurement) {
                              if (element.isNotEmpty) {
                                provider!.enableButton();
                              }
                            }
                          },
                          inputFormatters: <TextInputFormatter>[
                            TimeTextInputFormatter()
                          ],
                        ),),
                  ),
                  Text(workout.workoutValue)
                ],
              )
            ],
          ),
        ),
      ));
      continue;
    }

    return Row(
      children: workoutLogField,
    );
  }
}