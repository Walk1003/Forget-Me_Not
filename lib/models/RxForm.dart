// Create a Form widget.
import 'package:flutter/material.dart';

class RxForm extends StatefulWidget {
  const RxForm({Key? key}) : super(key: key);

  @override
  RxFormState createState() {
    return RxFormState();
  }
}

class RxFormState extends State<RxForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ]),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Here we loop the user through the prescription forms screens
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(context, '/PrescriptionForm');
          } else {
            print("not validated");
          }

          //_addCardWidget();
        },
        tooltip: 'Add',
        child: const Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
