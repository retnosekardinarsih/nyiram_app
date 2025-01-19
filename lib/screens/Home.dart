import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:nyiram_tanaman/screens/homepage.dart';
import 'package:nyiram_tanaman/screens/logout_page.dart';
import 'package:nyiram_tanaman/screens/pengaturan_page.dart';
import 'package:nyiram_tanaman/screens/tentang_nyiram.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _curvedNavIndex = 0;

  final List<Widget> _listWidget = [
    const HomePage(),
    const TentangNyiram(),
    const PengaturanPompa(),
    const LogoutPage(),
  ];

  final List<CurvedNavigationBarItem> _curvedNavBarItems = [
    const CurvedNavigationBarItem(
      child: Icon(Icons.home),
      label: "Beranda",
    ),
    const CurvedNavigationBarItem(
      child: Icon(Icons.contact_support),
      label: "Nyiram",
    ),
    const CurvedNavigationBarItem(
      child: Icon(Icons.settings),
      label: "Pengaturan",
    ),
    const CurvedNavigationBarItem(
      child: Icon(Icons.account_circle),
      label: "Keluar"
    )
  ];

  void _onCurvedNavTapped(int index) {
    setState(() {
      _curvedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_curvedNavIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 200),
        items: _curvedNavBarItems,
        onTap: _onCurvedNavTapped,
      ),
    );
  }
}
