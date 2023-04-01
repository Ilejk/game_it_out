import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../constants/list_constants.dart';
import '../../../constants/sizes_constants.dart';
import '../../../constants/string_constants.dart';
import '../../../constants/textstyle_constants.dart';

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
      animation: true,
      animationDuration: 800,
      animateFromLastPercent: true,
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
            style: TextStyleConstants.kActiveTextStyle,
          ),
        ],
      ),
      linearGradient: LinearGradient(
        colors: ListConstants.kGradientColorList,
      ),
    );
  }
}
