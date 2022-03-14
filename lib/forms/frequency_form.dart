import 'package:flutter/material.dart';
import 'package:test/bloc/prescription_bloc.dart';
import 'package:test/bloc/prescription_event.dart';
import 'package:test/time_slot.dart';

class RxFrequency extends StatefulWidget {
  const RxFrequency({Key? key}) : super(key: key);
  @override
  _RxFrequencyState createState() {
    return _RxFrequencyState();
  }
}

class _RxFrequencyState extends State<RxFrequency> {
  final _bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick A Time"),
      ),
      body: Center(
        child: StreamBuilder(
            stream: _bloc.model,
            initialData: "",
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Column(children: <Widget>[TimeSlot(snapshot.data)]);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => _bloc.PrescriptionEventSink.add(AddWidgetEvent())),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
