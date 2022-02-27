import 'package:flutter/material.dart';

class RxCard extends StatefulWidget {
  const RxCard({Key? key}) : super(key: key);

  @override
  _RxCardState createState() => _RxCardState();
}

class _RxCardState extends State<RxCard> {
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
        child: ListView.builder(
            itemCount: _cardList.length,
            itemBuilder: (context, index) {
              return _cardList[index];
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Here we bring the user to the prescription forms screen
          Navigator.pushNamed(context, '/NameForm');
          _addCardWidget();
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
