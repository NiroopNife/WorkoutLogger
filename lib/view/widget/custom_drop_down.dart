import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/utils/color_manager.dart';
import 'package:workout_log/view/widget/custom_scrollbar.dart';

import '../../provider/workout_provider.dart';
import 'expanded_section.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  WorkoutProvider? provider;

  bool isStretchedDropDown = false;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<WorkoutProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: const BorderRadius.all(Radius.circular(27))),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isStretchedDropDown = !isStretchedDropDown;
                            });
                          },
                          child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: greyColor,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(25))),
                              constraints: const BoxConstraints(
                                minHeight: 45,
                                minWidth: double.infinity,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Text(
                                        provider?.selectedExercise ?? "",
                                      ),
                                    ),
                                  ),
                                  Icon(isStretchedDropDown
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward)
                                ],
                              )),
                        ),
                        ExpandedSection(
                          expand: isStretchedDropDown,
                          height: 100,
                          child: CustomScrollbar(
                            builder: (context, scrollController2) =>
                                ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    controller: scrollController2,
                                    shrinkWrap: true,
                                    itemCount: provider!.workoutSelected!.subType.length,
                                    itemBuilder: (context, index) {
                                      return RadioListTile(
                                          title: Text(provider!.workoutSelected!.subType.elementAt(index)),
                                          value: index,
                                          groupValue: provider!.selectedExerciseValue,
                                          onChanged: (val) {
                                            setState(() {
                                              provider!.setExercise(val!);
                                              provider!.selectedExercise = provider!.workoutSelected!.subType.elementAt(index);
                                              provider!.isExerciseSelected = true;
                                              isStretchedDropDown = !isStretchedDropDown;
                                            });
                                          });
                                    }),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
