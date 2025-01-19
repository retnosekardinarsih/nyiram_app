import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class CurahHujan extends StatefulWidget {
  const CurahHujan({Key? key}) : super(key: key);

  @override
  State<CurahHujan> createState() => _CurahHujanState();
}

class _CurahHujanState extends State<CurahHujan> {
  final ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Container(
      child: StreamBuilder<DatabaseEvent>(
          stream: ref.child("Rain").onValue,
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
                          image: AssetImage("images/hujan.jpg"),
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
                    right: 50,
                    child: Container(
                      height: 150,
                      child: Column(
                        children: [
                          Text(
                            "Hujan",
                            // style: Theme.of(context).textTheme.subtitle1,
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "${event.data.snapshot.value['Hujan']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28),
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
                          image: AssetImage("images/hujan.jpg"),
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
                    right: 35,
                    child: Container(
                      height: 150,
                      child: Column(
                        children: [
                          Text(
                            "Curah Hujan",
                            // style: Theme.of(context).textTheme.subtitle1,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "NULL",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28),
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

// class CurahHujan extends StatelessWidget {
//   const CurahHujan({Key? key}) : super(key: key);
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
//                 image: AssetImage("images/hujan.jpg"),
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
//           right: 20,
//           child: Container(
//             height: 150,
//             child: Column(
//               children: [
//                 Text(
//                   "Curah Hujan",
//                   // style: Theme.of(context).textTheme.subtitle1,
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Text(
//                   "Rendah",
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
