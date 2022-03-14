import 'package:flutter/material.dart';
import 'package:test/bloc/prescription_event.dart';
import 'time_slot.dart';
import 'package:test/bloc/prescription_bloc.dart';

class TimeSlotManager extends StatefulWidget {
  const TimeSlotManager({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TimeSlotManagerState();
}

class TimeSlotManagerState extends State<TimeSlotManager> {
  TimeOfDay selectedTime = TimeOfDay.now();
  List<Widget> _timeSlots = [];
  final _bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          //instead of listview builder, use a stream builder, listens from the bloc
          child: StreamBuilder(
            stream: _bloc.model,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return _timeSlots[snapshot.data];
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //on pressed events should typically be invoking methods from the bloc
            _bloc.PrescriptionEventSink.add(SelectTimeEvent());
            //_selectTime(context, true);
          },
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
