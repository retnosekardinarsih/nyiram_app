import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF1CA7EC),
      bottomNavigationBar: Container(
        child: Center(
          child: Row(
            children: [
              Image.asset("images/logo_usu.png"),
            ],
          ),
        ),
      ),
    );
  }
}
