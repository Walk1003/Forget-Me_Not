import 'package:flutter/material.dart';

class RxDosage extends StatefulWidget {
  const RxDosage({Key? key}) : super(key: key);

  @override
  _RxDosageState createState() => _RxDosageState();
}

class _RxDosageState extends State<RxDosage> {
  final textController = TextEditingController(text: "mg ");

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
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/FrequencyForm');
          context:
          Text(textController.text);

          print("Dosage: " + textController.text);
        },
        tooltip: 'Add',
        child: const Icon(Icons.arrow_right_alt),
      ),
    );
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

