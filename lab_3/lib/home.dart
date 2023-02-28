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
  final sessionManager = SessionManager();

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
      appBar: buildAppBar(),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ExamForm(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ExamCard(exams[index]);
              },
              childCount: exams.length,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: buildLocationButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
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
            }),
        IconButton(
            icon: const Icon(Icons.map_outlined),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/maps');
            })
      ],
    );
  }

  Widget buildLocationButton() {
    return ElevatedButton(
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
    );
  }

}
