import 'package:flutter/material.dart';

class BackgroundTentangNyiram extends StatelessWidget {
  const BackgroundTentangNyiram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Colors.black, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      )
    );
  }
}
