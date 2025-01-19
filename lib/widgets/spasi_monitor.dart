import 'package:flutter/material.dart';

class SpasiMonitor extends StatelessWidget {
  const SpasiMonitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 40,
      width: width * 0.9,
    );
  }
}
