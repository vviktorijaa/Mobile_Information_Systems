import 'package:flutter/material.dart';
import 'calendar.dart';
import 'home.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Exam Organizer',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        routes: {
          '/': (context) => const Home(),
          '/calendar': (context) => const Calendar()
        },
        initialRoute: '/');
  }
}
