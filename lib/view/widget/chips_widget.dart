import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/provider/workout_provider.dart';
import 'package:workout_log/utils/color_manager.dart';


class ChoiceChipWidget extends StatefulWidget {
  const ChoiceChipWidget({Key? key}) : super(key: key);

  @override
  State<ChoiceChipWidget> createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {

  WorkoutProvider? provider;

  List<Widget> choiceChips() {
    List<Widget> chips = [];
    for (int i = 0; i < (provider?.model?.workouts.length ?? 0); i++) {
      Widget item = Padding(
          padding: const EdgeInsets.only(left: 10, right: 5),
          child: Selector<WorkoutProvider, int?>(builder: (context, selectedIndex, child) => ChoiceChip(
              label: Text(provider?.model?.workouts[i].type ?? ""),
              labelStyle: const TextStyle(color: Colors.white),
              backgroundColor: blackColor,
              selected: provider!.selectedIndex == i,
              selectedColor: Colors.black,
              onSelected: (bool value) {
                provider!.selectTypeOfWorkout(i, provider!.model!.workouts[i].type, provider!.model!.workouts[i]);
              }), selector: (_, provider) => provider.selectedIndex)
      );
      chips.add(item);
    }
    return chips;
  }

  @override
  void initState() {
    super.initState();
    provider = Provider.of<WorkoutProvider>(context, listen: false);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(builder: (context, provider, child) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 6,
            direction: Axis.horizontal,
            children: choiceChips(),
          ),
          const SizedBox(height: 20),
        ],
      );
    });
  }
}


class UnselectChip extends StatefulWidget {

  final String title;

  const UnselectChip({Key? key, required this.title}) : super(key: key);

  @override
  State<UnselectChip> createState() => _UnselectChipState();
}

class _UnselectChipState extends State<UnselectChip> {

  WorkoutProvider? provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<WorkoutProvider>(context, listen: false);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Chip(label: Text(widget.title), onDeleted: () => provider!.clearWorkout(),),
      ],
    );
  }
}
