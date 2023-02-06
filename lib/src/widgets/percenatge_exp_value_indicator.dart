import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constants/color_constants.dart';
import '../constants/sizes_constants.dart';
import '../constants/string_constants.dart';
import '../constants/textstyle_constants.dart';

class PercentageBarExpValueIndicator extends StatelessWidget {
  const PercentageBarExpValueIndicator({
    Key? key,
    required this.percentageValue,
    required this.expGainedValue,
  }) : super(key: key);

  final double percentageValue;
  final double expGainedValue;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      percent: percentageValue,
      backgroundColor: Colors.transparent,
      circularStrokeCap: CircularStrokeCap.round,
      lineWidth: SizesConstants.kProgressBarLineHeight,
      radius: 100,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringConstants.kExp,
            style: TextStyleConstants.kTaskSubTitleTextStyle,
          ),
          SizesConstants.kSizedBox10height,
          Text(
            expGainedValue.toStringAsFixed(2),
            style: TextStyleConstants.kTaskSubTitleTextStyle,
          ),
        ],
      ),
      linearGradient: LinearGradient(
        colors: [
          ColorConstatns.kShadow1,
          ColorConstatns.kShadow2,
          ColorConstatns.kShadow3,
          ColorConstatns.kShadow4,
          ColorConstatns.kShadow5,
          ColorConstatns.kShadow6,
        ],
      ),
    );
  }
}