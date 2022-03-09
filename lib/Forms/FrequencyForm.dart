import 'package:flutter/material.dart';

class RxFrequency extends StatefulWidget {
  const RxFrequency({Key? key}) : super(key: key);
  @override
  _RxFrequencyState createState() {
    return _RxFrequencyState();
  }
}

class _RxFrequencyState extends State<RxFrequency> {
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
          //here prompt the user with the clock before adding
          onPressed: () {
            _selectTime(context, true);
          },
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ));
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
      setState(() {
        _timeSlots.add(TimeSlot(selectedTime));
      });
    }
  }
}

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
