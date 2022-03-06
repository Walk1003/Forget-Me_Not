class Prescription {
  //fields
  late String rxName;
  late String rxDosage;
  late List<String> rxFrequency;
  late String rxTime;

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

  Prescription();
}

//rule #1 bloc and models should contain no references to widgets
//rule #2 widgets should handle as little state as possible
