import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:intl/intl.dart';
import 'package:lab_3/login.dart';
import 'calendar.dart';
import 'home.dart';
import 'model/calendar_exam.dart';
import 'model/exam.dart';
import 'notification_service.dart';

class ExamForm extends StatefulWidget {
  const ExamForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ExamFormState();
  }
}

class ExamFormState extends State<ExamForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController time = TextEditingController();
  Exam exam = Exam('Test', DateTime.now(), TimeOfDay.now());
  late final LocalNotificationService notificationService;
  var sessionManager = SessionManager();

  @override
  void initState() {
    time.text = "";
    notificationService = LocalNotificationService();
    notificationService.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Enter exam name"),
              onSaved: (String? value) {
                exam.name = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an exam name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: InputDatePickerFormField(
              firstDate: DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day, 9, 0, 0),
              lastDate: DateTime(2200, 12, 1),
              onDateSaved: (DateTime? value) {
                exam.date = value!;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller: time,
              decoration: const InputDecoration(labelText: "Enter Time"),
              readOnly: true,
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if (pickedTime != null) {
                  DateTime parsedTime = DateFormat.jm()
                      .parse(pickedTime.format(context).toString());
                  String formattedTime =
                      DateFormat('HH:mm:ss').format(parsedTime);

                  setState(() {
                    time.text = formattedTime;
                  });
                  exam.time = pickedTime;
                } else {
                  print("Time is not selected");
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    HomeState.exams.add(exam);

                    final DateTime startTime = DateTime(
                        exam.date.year,
                        exam.date.month,
                        exam.date.day,
                        exam.time.hour,
                        exam.time.minute,
                        0);
                    final DateTime endTime =
                        startTime.add(const Duration(hours: 1));
                    CalendarState.meetings.add(CalendarExam(exam.name,
                        startTime, endTime, const Color(0xFF0F8644), false));

                    await notificationService.showNotification(
                        id: 0,
                        title: "Exam Added",
                        body: "Exam added to calendar!");
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    minimumSize:
                        MaterialStateProperty.all(const Size(180, 40))),
                child: const Text(
                  "Add Exam",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    minimumSize:
                        MaterialStateProperty.all(const Size(180, 40))),
                child: const Text(
                  "Log in",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
