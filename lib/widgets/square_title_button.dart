import 'package:flutter/material.dart';

class SquareTileButton extends StatelessWidget {
  final String imageId;
  final Function()? onTap;

  const SquareTileButton(
      {super.key, required this.onTap, required this.imageId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imageId),
        ),
      ),
    );
  }
}
