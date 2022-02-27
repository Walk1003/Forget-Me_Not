import 'package:flutter/material.dart';
import 'package:test/Forms/NameForm.dart';
import 'models/RxCard.dart';
import 'forms/DosageForm.dart';
import 'forms/FrequencyForm.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      initialRoute: '/',
      routes: {
        '/': (context) => const TabControllerWidget(),
        '/NameForm': (context) => const RxName(),
        '/DosageForm': (context) => const RxDosage(),
        '/FrequencyForm': (context) => const RxFrequency(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
    );
  }
}

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
