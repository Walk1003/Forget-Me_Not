import 'package:flutter/material.dart';

//#region
// class RxName extends StatefulWidget {
//   const RxName({Key? key}) : super(key: key);

//   @override
//   RxNameState createState() => RxNameState();
// }

// //Name Form
// class RxNameState extends State<RxName> {
//   final _formKey = GlobalKey<FormState>();

//   int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Prescription Name"),
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
//             {
//               Navigator.pushNamed(context, '/DosageForm');
//             }
//           } else {
//             print("not validated");
//           }
//         },
//         tooltip: 'Add',
//         child: const Icon(Icons.arrow_right_alt),
//       ),
//     );
//   }
// }


// Define a custom Form widget.
class RxName extends StatefulWidget {
  const RxName({Key? key}) : super(key: key);

  @override
  _RxNameState createState() => _RxNameState();
}
//#endregion

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
