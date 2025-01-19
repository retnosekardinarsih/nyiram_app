import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SuhuUdara extends StatefulWidget {
  const SuhuUdara({Key? key}) : super(key: key);

  @override
  State<SuhuUdara> createState() => _SuhuUdaraState();
}

class _SuhuUdaraState extends State<SuhuUdara> {
  final ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      child: StreamBuilder<DatabaseEvent>(
          stream: ref.child("DS18B20").onValue,
          builder: (BuildContext context, AsyncSnapshot event) {
            if (event.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (event.hasData &&
                !event.hasError &&
                event.data!.snapshot.value != null) {
              return Stack(
                children: [
                  Container(
                    height: 180,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(1, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    bottom: 20,
                    child: Container(
                      height: 160,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/udara.jpg"),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(1, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 37,
                    child: Container(
                      height: 150,
                      child: Column(
                        children: [
                          Text(
                            "Suhu Udara",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "${event.data.snapshot.value['Temperatur']}" + "°C",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else
              return Stack(
                children: [
                  Container(
                    height: 180,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(1, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    bottom: 20,
                    child: Container(
                      height: 160,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/udara.jpg"),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(1, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 37,
                    child: Container(
                      height: 150,
                      child: Column(
                        children: [
                          Text(
                            "Suhu Udara",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "NULL",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
          }),
    );
  }
}




// class SuhuUdara extends StatelessWidget {
//   const SuhuUdara({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     return Stack(
//       children: [
//         Container(
//           height: 180,
//           width: width * 0.9,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(10),
//                 bottomRight: Radius.circular(10)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: Offset(1, 3), // changes position of shadow
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           top: 20,
//           left: 20,
//           bottom: 20,
//           child: Container(
//             height: 160,
//             width: 100,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: AssetImage("images/udara.jpg"),
//               ),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: Offset(1, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           top: 30,
//           right: 37,
//           child: Container(
//             height: 150,
//             child: Column(
//               children: [
//                 Text(
//                   "Suhu Udara",
//                   // style: Theme.of(context).textTheme.subtitle1,
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Text(
//                   "30oC",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
