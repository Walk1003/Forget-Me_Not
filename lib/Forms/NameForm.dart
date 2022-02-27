import 'package:flutter/material.dart';


class RxName extends StatefulWidget {
  const RxName({Key? key}) : super(key: key);

  @override
  _RxNameState createState() => _RxNameState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _RxNameState extends State<RxName> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prescription Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: textController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/DosageForm');
          context:
          Text(textController.text);
          //here we should write the value to the database
          print("Value: " + textController.text);
        },
        tooltip: 'Add',
        child: const Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
