import 'package:flutter/cupertino.dart';
import '../Forms/DosageForm.dart';
import '../Forms/FrequencyForm.dart';
import '../Forms/NameForm.dart';

class Prescription {
  late String rxName;
  late String dosage;
  late String selectedTime;

  // late RxName rxName;
  // late RxDosage dosage;
  // late List<TimeSlot> timeSlots;

  //Constructor
  //Run following line from NameForm
  Prescription(this.rxName, {dosage = '', timeSlots = ''}) {
    //call BloC update UI event
  }

  //Dosage setter
  //Run following line from DosageForm
  void changeDosage() {
    //DosageForm dosage generator
    //String newDosageAmount = dosage output text
    //Perscription(this.rxName, newDosageAmount, this.timeSlots);
    //call BloC update UI event
  }

  //Timeslots setter
  //Run following line from FrequencyForm
  void changeTimeSlots() {
    //Call FrequencyForm timeSlot generator
    //var newSlotList = list of timeSlots once done generating
    //Perscription(this.rxName, this.dosage, newSlotList);
    //call BloC update UI event
  }
  //Also should set up getters
  getDosage(String rxName) {
    return dosage;
  }

  // getTimeSlots(String rxName) {
  //   return timeSlots;
  // }
}
