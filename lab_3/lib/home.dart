import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'exam_card.dart';
import 'exam_form.dart';
import 'model/exam.dart';
import 'geolocation.dart';
import 'notification_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  late final LocalNotificationService notificationService;
  var sessionManager = SessionManager();

  static List<Exam> exams = [
    Exam("Your exams:", DateTime.now(), TimeOfDay.now())
  ];

  @override
  void initState() {
    super.initState();
    notificationService = LocalNotificationService();
    notificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Exam Organizer',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.calendar_today),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/calendar');
                })
          ],
        ),
        body: Column(
          children: [
            const ExamForm(),
            Expanded(
                child: ListView.builder(
                    itemCount: exams.length,
                    itemBuilder: (contx, index) {
                      return ExamCard(exams[index]);
                    })
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Geolocation())
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)
                          )
                      ),
                      minimumSize:
                          MaterialStateProperty.all(const Size(180, 40))
                  ),
                  child: const Text(
                    "Get current location",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
