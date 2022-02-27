import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/Routes/FormLoop.dart';

class RxCard extends StatefulWidget {
  const RxCard({Key? key}) : super(key: key);

  @override
  _RxCardState createState() => _RxCardState();
}

class _RxCardState extends State<RxCard> {
  // List<Widget> _cardList = [];
  final List<String> medicines = <String>['Tylenol'];
  final List<String> dosage = <String>['80mg'];
  final List<String> timesPerDay = <String>['2'];

  TextEditingController medicineController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  TextEditingController timesPerDayController = TextEditingController();

  void addItemToList() {
    setState(() {
      medicines.insert(0, medicineController.text);
      dosage.insert(0, dosageController.text);
      timesPerDay.insert(0, timesPerDayController.text);
    });
  }

/*   Widget _card() {
    return Center(
        child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      const ListTile(
        leading: Icon(Icons.medication_liquid_sharp),
        title: Text('Tylenol'),
        subtitle: Text('80mg'),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            child: const Text('2x Daily'),
            onPressed: () {/* ... */},
          ),
          const SizedBox(width: 4),
        ],
      )
    ])));
  } */

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add medicine'),
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: medicineController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Medicine Name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: dosageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Medicine dosage',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: timesPerDayController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Times per day',
              ),
            ),
          ),
          RaisedButton(
            child: Text('Add'),
            onPressed: () {
              addItemToList();
            },
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: medicines.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      margin: EdgeInsets.all(2),
                      child: Center(
                          child: Text(
                        '${medicines[index]} (${dosage[index]}) || ${timesPerDay[index]} times per day',
                        style: TextStyle(fontSize: 18),
                      )),
                    );
                  }))
        ]));
  }
}
