import 'dart:ui';

class CalendarExam {
  CalendarExam(this.name, this.from, this.to, this.background, this.isAllDay);

  String name;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
