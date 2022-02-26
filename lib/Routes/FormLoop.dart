// Create a Form widget.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/RxForm.dart';

class FormLoop extends StatelessWidget {
  const FormLoop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: RxForm(),
    ));
  }
}
