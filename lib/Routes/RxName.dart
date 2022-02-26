// Create a Form widget.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/prescription_form_model.dart';

class PrescriptionForm extends StatefulWidget {
  const PrescriptionForm({Key? key}) : super(key: key);

  @override
  PrescriptionFormState createState() {
    return PrescriptionFormState();
  }
}

//Form goes here, and we will send that data back to the prescription card template
class PrescriptionFormState extends State<PrescriptionForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Drug Name'),
        ),
        body: const Center(
          child: RxForm(),
        ));
  }
}
