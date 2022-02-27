//Dosage Form
import 'package:flutter/material.dart';

//#region
// class RxFrequency extends StatefulWidget {
//   const RxFrequency({Key? key}) : super(key: key);

//   @override
//   RxFrequencyState createState() => RxFrequencyState();
// }

// //Name Form
// class RxFrequencyState extends State<RxFrequency> {
//   final _formKey = GlobalKey<FormState>();

//   int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Frequency"),
//       ),
//       body: Center(
//           child: Form(
//         key: _formKey,
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           TextFormField(
//             // The validator receives the text that the user has entered.
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//         ]),
//       )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           //Here we loop the user through the prescription forms screens
//           if (_formKey.currentState!.validate()) {
//             count++;
//             {
//               //This brings us back to the prescription list screen
//               Navigator.of(context).popUntil((route) => route.isFirst);
//             }
//           } else {
//             print("not validated");
//           }
//           //_addCardWidget();
//         },
//         tooltip: 'Add',
//         child: const Icon(Icons.arrow_right_alt),
//       ),
//     );
//   }
// }
//#endregion

class RxFrequency extends StatefulWidget {
  const RxFrequency({Key? key}) : super(key: key);
  @override
  _RxFrequencyState createState() => _RxFrequencyState();
}

class _RxFrequencyState extends State<RxFrequency> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectTime,
              child: Text('SELECT TIME'),
            ),
            SizedBox(height: 8),
            Text(
              'Selected time: ${_time.format(context)}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        tooltip: 'Add',
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
