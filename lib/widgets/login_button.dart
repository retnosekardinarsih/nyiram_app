import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key, required this.buttonText, required this.onPressedButton})
      : super(key: key);

  final String buttonText;
  final Function() onPressedButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: onPressedButton,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
