import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/models/form.dart';

class PrescriptionCard extends StatefulWidget {
  const PrescriptionCard({Key? key}) : super(key: key);

  @override
  _PrescriptionCardState createState() => _PrescriptionCardState();
}

class _PrescriptionCardState extends State<PrescriptionCard> {
  List<Widget> _cardList = [];

  void _addCardWidget() {
    setState(() {
      _cardList.add(_card());
    });
  }

  Widget _card() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
            itemCount: _cardList.length,
            itemBuilder: (context, index) {
              return _cardList[index];
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addCardWidget();
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
