//Dosage Form
import 'package:flutter/material.dart';

class RxFrequency extends StatefulWidget {
  const RxFrequency({Key? key}) : super(key: key);

  @override
  RxFrequencyState createState() => RxFrequencyState();
}

//Name Form
class RxFrequencyState extends State<RxFrequency> {
  final _formKey = GlobalKey<FormState>();

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frequency"),
      ),
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
            count++;
            {
              Navigator.pushNamed(context, '/');
            }
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
