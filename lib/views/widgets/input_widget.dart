import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.obscureText});

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFc71f5d)),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextField(
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText, 
            ),
          ),
        ),
      ),
    );
  }
}
