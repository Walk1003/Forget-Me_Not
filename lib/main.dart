import 'package:flutter/material.dart';
import 'forms/dosage_form.dart';
import 'forms/name_form.dart';
import 'forms/frequency_form.dart';
import 'tab_controller.dart';

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
