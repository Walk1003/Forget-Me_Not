//#region
import 'package:flutter/material.dart';
import 'package:test/bloc/prescription_bloc.dart';
import 'package:test/bloc/prescription_event.dart';
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
  TimeOfDay selectedTime;
  _TimeSlotState(this.selectedTime);
  final _bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder(
            stream: _bloc.model,
            initialData: "",
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: (() =>
                        _bloc.PrescriptionEventSink.add(SelectTimeEvent())),
                    child: const Text("Choose Time"),
                  ),
                  Text(
                      "${selectedTime.hourOfPeriod}:${selectedTime.minute} ${selectedTime.period.toString().substring(10)}")
                ],
              );
            }));
  }
}
