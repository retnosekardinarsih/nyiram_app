import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nyiram_tanaman/screens/Home.dart';
import 'package:nyiram_tanaman/screens/homepage.dart';
import 'package:nyiram_tanaman/screens/login_page.dart';
import 'package:nyiram_tanaman/screens/logout_page.dart';
import 'package:nyiram_tanaman/screens/pengaturan_page.dart';
import 'package:nyiram_tanaman/screens/tentang_nyiram.dart';
import 'package:nyiram_tanaman/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nyiram App",
      theme: ThemeData(
        textTheme: myTextTheme,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return const LoginPage();
          }
        },
      ),
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        Home.id: (context) => const Home(),
        HomePage.id: (context) => const HomePage(),
        TentangNyiram.id: (context) => const TentangNyiram(),
        PengaturanPompa.id: (context) => const PengaturanPompa(),
        LogoutPage.id: (context) => const LogoutPage(),
      },
    );
  }
}