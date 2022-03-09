import 'package:flutter/material.dart';

class TimeSlot extends StatefulWidget {
  TimeOfDay selectedTime;

  TimeSlot(this.selectedTime);
  @override
  State<TimeSlot> createState() {
    return TimeSlotState(selectedTime);
  }
}

class TimeSlotState extends State<TimeSlot> {
  TimeOfDay selectedTime;

  TimeSlotState(this.selectedTime);
  
  _selectTime() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              _selectTime();
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
