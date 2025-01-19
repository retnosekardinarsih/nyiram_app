import 'package:flutter/material.dart';
import 'package:nyiram_tanaman/widgets/widgets.dart';

class TentangNyiram extends StatelessWidget {
  static const String id = 'tentang_nyiram';

  const TentangNyiram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const BackgroundTentangNyiram(),
        Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/logo_usu.png"),
                              ),
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/logo_fmipa.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      "Tentang Nyiram App",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Nyiram App adalah sebuah aplikasi yang dikembangkan oleh seorang mahasiswa dari Universitas Sumatera Utara (USU), Retno Sekar Dinarsih, sebagai bagian dari tugas akhirnya. Aplikasi ini dirancang untuk mengintegrasikan alat penyiraman otomatis dengan teknologi Internet of Things (IoT).",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Text(
                          "     Tujuan utama Nyiram App adalah untuk memberikan solusi yang efisien dalam hal penyiraman tanaman. Aplikasi ini memanfaatkan teknologi IoT untuk menghubungkan alat penyiraman otomatis dengan Android.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Text(
                          "     Aplikasi ini dilengkapi dengan fitur pemantauan dan kontrol pompa jarak jauh. Dengan Nyiram App, pengguna dapat memantau hasil dari pembacaan sensor pada alat serta dapat menghidupkan pompa tanpa harus secara fisik hadir di lokasi.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Text(
                          "     Fitur pemantauan atau fitur monitoring dapat diakses pada halaman Beranda. Sedangkan untuk menghidupkan pompa secara manual dapat dilakukan di halaman Pengaturan. Secara default, pompa akan otomatis melakukan penyiraman setiap hari pada jam 7 pagi, 5 sore, dan saat terjadi hujan panas.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 8,
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
}
