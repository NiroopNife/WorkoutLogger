import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/provider/workout_provider.dart';
import 'package:workout_log/utils/strings_manager.dart';
import 'package:workout_log/view/widget/chips_widget.dart';
import 'package:workout_log/view/widget/custom_rounded_button.dart';
import 'package:workout_log/view/widget/measurement_widget.dart';

import 'custom_drop_down.dart';

class AddWorkoutFormDialog extends StatefulWidget {
  const AddWorkoutFormDialog({Key? key}) : super(key: key);

  @override
  State<AddWorkoutFormDialog> createState() => _AddWorkoutFormDialogState();
}

class _AddWorkoutFormDialogState extends State<AddWorkoutFormDialog> {
  WorkoutProvider? provider;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    provider = Provider.of<WorkoutProvider>(context, listen: false);
  }

  @override
  void dispose() {
    provider!.clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Selector<WorkoutProvider, bool>(
              selector: (_, provider) => provider.isWorkoutTypeSelected,
              builder: (context, value, child) {
                return (value) ? UnselectChip(title: provider!.selectedWorkout!) : const ChoiceChipWidget();
              },
            ),
            Selector<WorkoutProvider, bool>(
                selector: (_, provider) => provider.hasExercise,
                builder: (context, value, child) {
                  return (value) ? const CustomDropDown() : const SizedBox.shrink();
                }),
            Selector<WorkoutProvider, bool>(
                selector: (_, provider) => provider.isExerciseSelected,
                builder: (context, value, child) {
                  return (value)
                      ? const MeasurementWidget()
                      : const SizedBox.shrink();
                }),
            Selector<WorkoutProvider, bool>(
              selector: (_, provider) => provider.isCompleted,
              builder: (context, value, child) => CustomRoundedButton(
                title: AppStrings.SUBMIT,
                onPressed: provider!.selectedIndex == null
                    ? null
                    : () {
                        provider!.submitWorkout();
                        Navigator.of(context).pop();
                      },
              ),
            )
          ],
        ),
      ),
    );
  }
}
