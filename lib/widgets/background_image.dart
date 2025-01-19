import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1CA7EC),
      body: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: <Color>[Colors.black, Colors.teal.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds);
        },
        blendMode: BlendMode.colorBurn,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/latar.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
