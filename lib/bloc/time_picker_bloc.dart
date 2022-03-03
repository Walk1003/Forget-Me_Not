import 'dart:async';
import 'package:test/models/time_slot_manager.dart';

import 'time_picker_event.dart';

class TimePickerBloc {
  late TimeSlotManager _slot;

  //this controller will be used to manage the different events given by the TimeSlot
  final _timeSlotStateController = StreamController<TimeSlotManager>();

  //intput sink
  StreamSink<TimeSlotManager> get _inTimeSlot => _timeSlotStateController.sink;

  //output stream
  Stream<TimeSlotManager> get timeSlot => _timeSlotStateController.stream;

  final _timeSlotEventController = StreamController<TimePickerEvent>();
  Sink<TimePickerEvent> get WidgetEventSink => _timeSlotEventController.sink;

  TimePickerBloc() {
    _timeSlotEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TimePickerEvent event) {
    if (event is AddWidget) {
      //code to add a new widget
      
    }
    if (event is RemoveWidget) {
      //code to remove widget
    } else {
      //code to edit a widget

    }
  }
}
