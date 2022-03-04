import 'dart:async';
import 'package:test/models/prescription.dart';
import 'package:test/models/time_slot_manager.dart';

import 'prescription_event.dart';

class Bloc {
  Prescription _model = Prescription();

  //this controller will be used to manage different events
  final _prescriptionStateController = StreamController<Prescription>();

  //intput sink
  StreamSink<Prescription> get _inModel => _prescriptionStateController.sink;

  //output stream
  Stream<Prescription> get model => _prescriptionStateController.stream;

  final _prescriptionEventController = StreamController<PrescriptionEvent>();

  Sink<PrescriptionEvent> get PrescriptionEventSink =>
      _prescriptionEventController.sink;

  Bloc() {
    _prescriptionEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(PrescriptionEvent event) {
    if (event is SelectTimeEvent) {
      //code to select time 
        
    }
    if (event is RemoveWidgetEvent) {
      //code to remove widget
    } else {
      //code to edit a widget

    }
  }
}

//just create plain dart classes