import 'package:flutter/material.dart';

class IgFakeRoll extends StatelessWidget {
  const IgFakeRoll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset('images/gg.png'),
      ),
    );
  }
}