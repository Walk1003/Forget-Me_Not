//#region
import 'package:flutter/material.dart';
import 'package:test/bloc/prescription_bloc.dart';
import 'package:test/models/time_slot_manager.dart';

class TimeSlot extends StatefulWidget {

  TimeSlot({Key? key}) : super(key: key);
  @override
  State<TimeSlot> createState() {
    return _TimeSlotState();
  }
}

class _TimeSlotState extends State<TimeSlot> {
  TimeOfDay selectedTime = TimeOfDay.now();

  final _bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {

            },
            child: Text("Choose Time"),
          ),
          Text(
              "${selectedTime.hourOfPeriod}:${selectedTime.minute} ${selectedTime.period.toString().substring(10)}"),
        ],
      ),
    );
  }
}
