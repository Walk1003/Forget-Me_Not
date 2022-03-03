import 'package:flutter/material.dart';
import 'time_slot.dart';

class TimeSlot extends StatefulWidget {
  const TimeSlot(TimeOfDay selectedTime, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TimeSlotState();
}

class TimeSlotState extends State<TimeSlot> {
  TimeOfDay selectedTime = TimeOfDay.now();
  List<Widget> _timeSlots = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter TimePicker"),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: _timeSlots.length,
              itemBuilder: (context, index) {
                return _timeSlots[index];
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _selectTime(context, true);
          },
        ));
  }

  void addTimeSlot() {
    setState(() {
      _timeSlots.add(TimeSlot(selectedTime));
    });
  }

  _selectTime(BuildContext context, bool newTime) async {
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
    if (newTime) {
      addTimeSlot();
    }
  }
}
