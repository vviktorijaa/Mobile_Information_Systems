import 'package:flutter/material.dart';
import 'calendar.dart';
import 'home.dart';
import 'maps.dart';

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
          RouteNames.home: (context) => const Home(),
          RouteNames.calendar: (context) => const Calendar(),
          RouteNames.maps: (context) => const Maps()
        },
        initialRoute: RouteNames.home
    );
  }
}

class RouteNames {
  static const home = '/';
  static const calendar = '/calendar';
  static const maps = '/maps';
}