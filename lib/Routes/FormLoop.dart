// Create a Form widget.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/RxForm.dart';

class FormLoop extends StatefulWidget {
  const FormLoop({Key? key}) : super(key: key);

  @override
  FormLoopState createState() {
    return FormLoopState();
  }
}

//Here will call the form template, loop through it, and send that data back to the prescription card template
class FormLoopState extends State<FormLoop> {
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
