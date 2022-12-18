import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'exam.dart';
import 'main.dart';

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

  @override
  void initState() {
    time.text = "";
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    HomePage.exams.add(exam);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
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
        ],
      ),
    );
  }
}
