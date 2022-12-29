import 'package:flutter/material.dart';

class IgFakeRoll extends StatelessWidget {
  const IgFakeRoll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        height: 65,
        width: 65,
        child: CircleAvatar(
          backgroundImage: AssetImage('images/gg.png'),
        ),
      ),
    );
  }
}
