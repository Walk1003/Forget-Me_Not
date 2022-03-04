import 'package:flutter/material.dart';
import 'package:test/bloc/prescription_event.dart';
import 'package:test/models/prescription.dart';
import 'time_slot.dart';
import 'package:test/bloc/prescription_bloc.dart';

class TimeSlot extends StatefulWidget {
  const TimeSlot(TimeOfDay selectedTime, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TimeSlotState();
}

class TimeSlotState extends State<TimeSlot> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final _bloc = Bloc();
  List<Widget> _timeSlots = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          //instead of listview builder, use a stream builder, listens from the bloc
          child: StreamBuilder(
            stream: _bloc.model,
            initialData: _timeSlots.length,
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

  //here instead of changing state, parse this out into the bloc
  void addTimeSlot() {
    setState(() {
      
      _timeSlots.add(TimeSlot(selectedTime));
    });
  }

  // _selectTime(BuildContext context, bool newTime) async {
  //   final TimeOfDay? timeOfDay = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //     initialEntryMode: TimePickerEntryMode.dial,
  //   );
  //   if (timeOfDay != null && timeOfDay != selectedTime) {
  //     setState(() {
  //       selectedTime = timeOfDay;
  //     });
  //   }
    if (newTime) {
      addTimeSlot();
    }
  }
}
