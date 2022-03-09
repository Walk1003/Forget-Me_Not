import 'package:flutter/material.dart';

class RxDosage extends StatefulWidget {
  const RxDosage({Key? key}) : super(key: key);

  @override
  _RxDosageState createState() => _RxDosageState();

  void onSubmit(String text) {}
}

class _RxDosageState extends State<RxDosage> {
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
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dosage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
              labelText: 'Enter the prescription dosage',
              errorText: _errorText),
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
      Navigator.pushNamed(context, '/FrequencyForm');
      // notify the parent widget via the onSubmit callback
      widget.onSubmit(textController.value.text);
    }
  }
}


//this is an alternate prototype for this form we could flesh out later
//#region
// class RxDosage extends StatefulWidget {
//   const RxDosage({Key? key}) : super(key: key);

//   @override
//   _RxDosageState createState() => _RxDosageState();
// }

// class _RxDosageState extends State<RxDosage> {
//   final dosages = ['1mg', '2mg', '3mg'];
//   String? value;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dosage'),
//       ),
//       body: Center(
//           child: Container(
//         alignment: Alignment.topCenter,
//         child: DropdownButton<String>(
//             value: value,
//             isExpanded: true,
//             items: dosages.map(buildMenuItem).toList(),
//             onChanged: (value) => setState(() => this.value = value)),
//       )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/FrequencyForm');
//         },
//         tooltip: 'Add',
//         child: const Icon(Icons.arrow_right_alt),
//       ),
//     );
//   }

//   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//       child: Text(
//         item,
//         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//       ),
//       value: item);
// }
//#Endregion

