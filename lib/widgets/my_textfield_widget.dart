import 'package:flutter/material.dart';


class MyTextFieldWidget extends StatelessWidget {
final controller;
final String hintText;
final bool obscureText;

const MyTextFieldWidget({super.key, required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 5, bottom: 5, right: 25, left: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child:  Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: hintText),
          ),
        ),
      ),
    );
  }
}