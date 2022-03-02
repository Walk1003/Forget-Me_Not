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

  void _addTimeSlot() {
    setState(() {
      _timeSlots.add(_timeSlot(selectedTime));
    });
  }

  //this method could get the selected time from the selectTime method call in the floating aciton button
  Widget _timeSlot(TimeOfDay selectedTime) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              _selectTime(context);
            },
            child: Text("Choose Time"),
          ),
          Text("${selectedTime.hour}:${selectedTime.minute}"),
        ],
      ),
    );
  }

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
            _selectTime(context);
            //_addTimeSlot();
          },
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ));
  }

  _selectTime(BuildContext context) async {
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

    _addTimeSlot();
  }
}
