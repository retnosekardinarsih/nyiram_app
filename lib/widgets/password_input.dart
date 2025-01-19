import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputAction,
    required this.onPasswordChanged,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputAction inputAction;
  final Function(String) onPasswordChanged;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade50.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          obscureText: _obscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(_obscureText
                  ? Icons.visibility
                  : Icons.visibility_off, color: Colors.green.shade900,),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.white),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                widget.icon,
                color: Colors.green.shade900,
                size: 30,
              ),
            ),
          ),
          textInputAction: widget.inputAction,
          // obscureText: true,
          onChanged: widget.onPasswordChanged,
        ),
      ),
    );
  }
}
