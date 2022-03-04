import 'package:flutter/material.dart';
import 'package:test/bloc/prescription_bloc.dart';
import 'package:test/bloc/prescription_event.dart';
import 'package:test/models/time_slot_manager.dart';

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
            //initial data would just be a TimePicker Widget
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _bloc.PrescriptionEventSink.add(AddWidget()),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.PrescriptionEventSink.add(AddWidget()),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
