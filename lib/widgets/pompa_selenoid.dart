import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PompaSelenoid extends StatefulWidget {
  const PompaSelenoid({Key? key}) : super(key: key);

  @override
  State<PompaSelenoid> createState() => _PompaSelenoidState();
}

class _PompaSelenoidState extends State<PompaSelenoid> {
  final ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      child: StreamBuilder<DatabaseEvent>(
          stream: ref.child("Pump").onValue,
          builder: (BuildContext context, AsyncSnapshot event) {
            if (event.connectionState == ConnectionState.waiting) {
              return Center(child: Text("Periksa koneksi internet Anda."));
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
                          image: AssetImage("images/sprinkler.jpg"),
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
                            "Pompa",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "${event.data.snapshot.value['Pompa']}",
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
                    right: 50,
                    child: Container(
                      height: 150,
                      child: Column(
                        children: [
                          Text(
                            "Pompa",
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
