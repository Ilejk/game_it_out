import 'package:flutter/material.dart';
import '../../constants/list_constants.dart';

class GradientLinearDivider extends StatelessWidget {
  const GradientLinearDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: ListConstants.kGradientColorList,
        ),
      ),
    );
  }
}
