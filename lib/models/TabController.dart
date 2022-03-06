import 'package:flutter/material.dart';

import 'RxCard.dart';

class TabControllerWidget extends StatelessWidget {
  const TabControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RxMinder'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.medication),
              ),
              Tab(
                icon: Icon(Icons.timer),
              ),
              Tab(
                icon: Icon(Icons.warning),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: RxCard(),
              //child: Text("Click to Add a Prescription"),
            ),
            Center(
              child: Text("Reminders Here"),
            ),
            Center(
              child: Text("Warnings Here"),
            ),
          ],
        ),
      ),
    );
  }
}
