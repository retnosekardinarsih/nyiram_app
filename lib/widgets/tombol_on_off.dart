// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// class OnOffButton extends StatefulWidget {
//   @override
//   _OnOffButtonState createState() => _OnOffButtonState();
// }
//
// class _OnOffButtonState extends State<OnOffButton> {
//   final DatabaseReference _ref = FirebaseDatabase.instance.ref('Pump/Pompa');
//
//   String getPumpState() {
//     return _ref.onValue as String;
//   }
//
//   void turnOn() {
//     _ref.set('ON');
//   }
//
//   void turnOff() {
//     _ref.set('OFF');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Pump State:'),
//           Text(getPumpState()),
//           SizedBox(height: 10),
//           Switch(
//             value: getPumpState() == 'ON',
//             onChanged: (value) {
//               if (value) {
//                 turnOn();
//               } else {
//                 turnOff();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class OnOffButton extends StatefulWidget {
  @override
  _OnOffButtonState createState() => _OnOffButtonState();
}

class _OnOffButtonState extends State<OnOffButton> {
  final databaseReference = FirebaseDatabase.instance.ref();
  bool isPumpOn = false;

  @override
  void initState() {
    super.initState();
    // Mendapatkan data relay pompa dari database saat inisialisasi
    databaseReference
        .child('Pump')
        .child('Pompa')
        .once()
        .then((DatabaseEvent event) {
      setState(() {
        isPumpOn = event.snapshot.value == 'ON';
      });
    });
  }

  void _togglePump(bool newValue) {
    // Mengubah status relay pompa di database saat tombol switch diubah
    String pumpStatus = newValue ? 'ON' : 'OFF';
    databaseReference.child('Pump').child('Pompa').set(pumpStatus);
    setState(() {
      isPumpOn = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text('Hidupkan Pompa Secara Manual'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Colors.white, Colors.teal.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight ,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                color: Colors.cyan.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        isPumpOn ? 'Pompa Hidup' : 'Pompa Mati',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      Switch(
                        activeColor: Colors.redAccent,
                        value: isPumpOn,
                        onChanged: _togglePump,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "Peringatan:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Text(
                  "Bagi yang tidak berkepentingan, dilarang menekan tombol apapun di halaman ini!",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
//
// class OnOffButton extends StatefulWidget {
//   @override
//   _OnOffButtonState createState() => _OnOffButtonState();
// }
//
// class _OnOffButtonState extends State<OnOffButton> {
//   final databaseReference = FirebaseDatabase.instance.ref();
//
//   bool isPumpOn = false;
//
//   void turnOnPump() {
//     databaseReference.child('Pump/Pompa').set('ON');
//     setState(() {
//       isPumpOn = true;
//     });
//   }
//
//   void turnOffPump() {
//     databaseReference.child('Pump/Pompa').set('OFF');
//     setState(() {
//       isPumpOn = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Turn On/Off Pump'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Pump is ${isPumpOn ? 'ON' : 'OFF'}',
//               style: TextStyle(fontSize: 20),
//             ),
//             ElevatedButton(
//               child: Text('Turn On'),
//               onPressed: turnOnPump,
//             ),
//             ElevatedButton(
//               child: Text('Turn Off'),
//               onPressed: turnOffPump,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
