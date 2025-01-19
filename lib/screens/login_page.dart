import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyiram_tanaman/screens/Home.dart';
import 'package:nyiram_tanaman/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'loginpage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text(
                      "Nyiram.",
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(2, 3),
                              blurRadius: 3,
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Siram tanamanmu setiap hari",
                    // style: Theme.of(context).textTheme.subtitle1,
                    style: TextStyle(
                        // fontSize: 48,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(1, 2),
                            blurRadius: 1,
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInput(
                              icon: FontAwesomeIcons.solidEnvelope,
                              hint: "Email",
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              onEmailChanged: (value) {
                                _email = value;
                              },
                            ),
                            PasswordInput(
                              icon: FontAwesomeIcons.lock,
                              hint: "Password",
                              inputAction: TextInputAction.done,
                              onPasswordChanged: (value) {
                                _password = value;
                              },
                            ),
                            TextButton(
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Lupa Email dan Password'),
                                  content: const SizedBox(
                                    height: 80,
                                    width: 100,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Silakan hubungi pembuat aplikasi di",
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "retnosekardinarsih@students.usu.ac.id",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text("atau"),
                                          SizedBox(height: 8),
                                          Text(
                                            "retnosekardinarsih@gmail.com",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("OK"),
                                    ),
                                  ],
                                ),
                              ),
                              child: const Text(
                                'Lupa Email/Password?',
                                style: TextStyle(
                                  // fontSize: 48,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(1, 2),
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 100,
                            ),
                            LoginButton(
                              buttonText: "MASUK",
                              onPressedButton: () {
                                _login();
                              },
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("images/logo_usu.png"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                  height: 40,
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("images/logo_fmipa.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _login() async {
    try {
      final navigator = Navigator.of(context);
      final credential = EmailAuthProvider.credential(
        email: _email,
        password: _password,
      );

      await _auth.signInWithCredential(credential);
      navigator.pushReplacementNamed(Home.id);
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Login error"),
            content: const Text("Email/Password yang Anda masukan salah!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
