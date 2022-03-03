import 'package:flutter/material.dart';
import 'package:test/bloc/time_picker_bloc.dart';
import 'package:test/bloc/time_picker_event.dart';
import 'package:test/models/time_slot_manager.dart';

class RxFrequency extends StatefulWidget {
  const RxFrequency({Key? key}) : super(key: key);
  @override
  _RxFrequencyState createState() {
    return _RxFrequencyState();
  }
}

class _RxFrequencyState extends State<RxFrequency> {
  final _bloc = TimePickerBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick A Time"),
      ),
      body: Center(
        child: StreamBuilder(
            stream: _bloc.timeSlot,
            //initial data would just be a TimePicker Widget
            initialData: TimeSlot(),
            builder: (BuildContext context, AsyncSnapshot<TimeSlot> snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[TimeSlot()],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.WidgetEventSink.add(AddWidget()),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
