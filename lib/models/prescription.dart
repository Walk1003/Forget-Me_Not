import 'package:test/models/time_slot.dart';

class Prescription {
  //fields
  late String rxName;
  late String rxDosage;
  late List<String> rxFrequency;
  late String rxTime;
  late TimeSlot timeSlot;

  String get name {
    return rxName;
  }

  String get dosage {
    return rxDosage;
  }

  List<String> get frequency {
    return rxFrequency;
  }

  String get time {
    return rxTime;
  }

  TimeSlot get slot {
    return timeSlot;
  }

  Prescription();
}

//rule #1 bloc and models should contain no references to widgets
//rule #2 widgets should handle as little state as possible
