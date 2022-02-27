import 'package:flutter/material.dart';

class RxName extends StatefulWidget {
  const RxName({Key? key}) : super(key: key);

  @override
  _RxNameState createState() => _RxNameState();

  void onSubmit(String text) {}
}

class _RxNameState extends State<RxName> {
  // Create a text controller and use it to retrieve the current value of the TextField.
  final textController = TextEditingController();
  final _text = '';

  String? get _errorText {
    final text = textController.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

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
          decoration: InputDecoration(
              labelText: 'Enter a prescription', errorText: _errorText),
          onChanged: (text) => setState(() => _text),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: textController.value.text.isNotEmpty ? _proceed : null,
        tooltip: 'Add',
        child: const Icon(Icons.arrow_right_alt),
      ),
    );
  }

  void _proceed() {
    // if there is no error
    if (_errorText == null) {
      Navigator.pushNamed(context, '/DosageForm');
      // notify the parent widget via the onSubmit callback
      widget.onSubmit(textController.value.text);
    }
  }
}
