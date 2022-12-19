import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'model/calendar_exam.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalendarState();
  }
}

class CalendarState extends State<Calendar> {
  static List<CalendarExam> meetings = <CalendarExam>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Exam Calendar',
          style: TextStyle(color: Colors.white),
        )),
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
          showNavigationArrow: true,
          headerHeight: 70,
        ));
  }

  List<CalendarExam> _getDataSource() {
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(CalendarExam(
        'Exam', startTime, endTime, const Color(0x0F2386FF), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<CalendarExam> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].name;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
