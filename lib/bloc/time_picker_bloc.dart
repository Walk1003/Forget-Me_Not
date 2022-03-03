import 'dart:async';
import 'package:test/models/time_slot_manager.dart';

import 'time_picker_event.dart';

class TimePickerBloc {
  late TimeSlot _slot;

  //this controller will be used to manage the different events given by the TimeSlot
  final _timeSlotStateController = StreamController<TimeSlot>();

  //intput sink
  StreamSink<TimeSlot> get _inTimeSlot => _timeSlotStateController.sink;

  //output stream
  Stream<TimeSlot> get timeSlot => _timeSlotStateController.stream;

  final _timeSlotEventController = StreamController<WidgetEvent>();
  Sink<WidgetEvent> get WidgetEventSink => _timeSlotEventController.sink;

  TimePickerBloc() {
    _timeSlotEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(WidgetEvent event) {
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
