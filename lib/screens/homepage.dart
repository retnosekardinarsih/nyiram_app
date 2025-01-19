import 'package:flutter/material.dart';
import 'package:nyiram_tanaman/widgets/curah_hujan.dart';
import 'package:nyiram_tanaman/widgets/intensitas_cahaya.dart';
import 'package:nyiram_tanaman/widgets/kelembapan_tanah.dart';
import 'package:nyiram_tanaman/widgets/pompa_selenoid.dart';
import 'package:nyiram_tanaman/widgets/spasi_monitor.dart';
import 'package:nyiram_tanaman/widgets/suhu_udara.dart';

class HomePage extends StatefulWidget {
  static const String id = 'homepage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lightGreen.shade300,
            Colors.teal,
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Nyiram App",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(40),
            children: const <Widget>[
              PompaSelenoid(),
              SpasiMonitor(),
              CurahHujan(),
              SpasiMonitor(),
              SuhuUdara(),
              SpasiMonitor(),
              IntensitasCahaya(),
              SpasiMonitor(),
              KelembapanTanah(),
            ],
          ),
        ),
      ),
    );
  }
}
