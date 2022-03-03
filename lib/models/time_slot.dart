//#region
import 'package:flutter/material.dart';
import 'package:test/models/time_slot_manager.dart';

class TimeSlot extends StatefulWidget {
  TimeOfDay selectedTime;

  TimeSlot(this.selectedTime);
  @override
  State<TimeSlot> createState() {
    return _TimeSlotState(selectedTime);
  }
}

class _TimeSlotState extends State<TimeSlot> {
  TimeOfDay selectedTime = TimeOfDay.now();
  
  late TimeSlotManagerState manager;
  _TimeSlotState(this.selectedTime);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              manager.addTimeSlot();
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

//#endregion