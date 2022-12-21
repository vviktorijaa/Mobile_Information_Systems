import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'main.dart';
import 'model/user.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  User user = User("", "");
  var sessionManager = SessionManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
              child: TextFormField(
                decoration: const InputDecoration(hintText: "Enter username"),
                onSaved: (String? value) {
                  user.name = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                decoration: const InputDecoration(hintText: "Enter password"),
                onSaved: (String? value) {
                  user.password = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await sessionManager.set("username", user.name);
                    await sessionManager.set("password", user.password);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomePage()));
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
      ),
    );
  }
}
