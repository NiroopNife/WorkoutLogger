import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:workout_log/provider/workout_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workout_log/utils/styles_manager.dart';
import '../../utils/color_manager.dart';
import '../widget/add_workout_form_dialog.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  late FirebaseAuth _auth;

  final user = FirebaseAuth.instance.currentUser!;

  DateTime today = DateTime.now();


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
      backgroundColor: blackColor,
      appBar: AppBar(
        title: Text(user.email!),
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: blackColor,
                margin: EdgeInsets.all(8.w),
                child: TableCalendar(
                    availableGestures: AvailableGestures.all,
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      decoration: BoxDecoration(
                        color: primaryLightColor.withOpacity(.8),
                        borderRadius: BorderRadius.all(Radius.circular(10.w))
                      ),
                      headerMargin: EdgeInsets.only(bottom: 8.h),
                      titleTextStyle: getBoldStyle(color: whiteDarkColor),
                      formatButtonDecoration: BoxDecoration(border: Border.all(color: greyColor), borderRadius: BorderRadius.circular(8.w)),
                      formatButtonTextStyle: getSemiBoldStyle(color: whiteDarkColor),
                      leftChevronIcon: const Icon(Icons.chevron_left, color: whiteDarkColor),
                      rightChevronIcon: const Icon(Icons.chevron_right, color: whiteDarkColor,)
                    ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: primaryDarkColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      selectedDecoration: BoxDecoration(
                        color: primaryLightColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      weekendDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      defaultTextStyle: getSemiBoldStyle(color: whiteColor),
                      weekendTextStyle: getSemiBoldStyle(color: primaryLightColor),
                      disabledTextStyle: getSemiBoldStyle(color: unselectedColor),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: getSemiBoldStyle(color: whiteColor),
                      weekendStyle: getSemiBoldStyle(color: primaryLightColor)
                    ),
                    onDaySelected: _onDaySelected,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    focusedDay: today, firstDay: DateTime.utc(2023), lastDay: DateTime.utc(2030)))
          ],
        ),
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

  _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }
}
