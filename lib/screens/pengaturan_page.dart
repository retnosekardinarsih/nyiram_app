import 'package:flutter/material.dart';
import 'package:nyiram_tanaman/widgets/widgets.dart';

class PengaturanPompa extends StatefulWidget {
  const PengaturanPompa({Key? key}) : super(key: key);
  static const String id = 'pengaturan';

  @override
  State<PengaturanPompa> createState() => _PengaturanPompaState();
}

class _PengaturanPompaState extends State<PengaturanPompa> {
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
            "Pengaturan",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: OnOffButton(),
      ),
    );
  }
}

// class Pengaturan extends StatelessWidget {
//   static const String id = 'pengaturan';
//
//   const Pengaturan({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Colors.lightGreen.shade300,
//             Colors.teal,
//           ],
//           begin: Alignment.topCenter,
//           end: Alignment.center,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             "Pengaturan",
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
