import 'package:flutter/material.dart';
import 'package:nyiram_tanaman/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutPage extends StatefulWidget {
  static const String id = 'logoutpage';

  const LogoutPage({Key? key}) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _logout,
          child: const Text("Keluar dari Nyiram App"),
        ),
      ),
    );
  }

  void _logout() async {
    final navigator = Navigator.of(context);
    await _auth.signOut();
    // Navigate to the login page
    navigator.pushReplacementNamed(LoginPage.id);
  }
}
