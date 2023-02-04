import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/providers/task_provider.dart';
import 'package:login_logout_simple_ui/src/widgets/shadow_box_container.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../constants/color_constants.dart';
import '../constants/padding_constants.dart';
import '../constants/sizes_constants.dart';

class ProgressBarIndicator extends StatelessWidget {
  const ProgressBarIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var expData = Provider.of<TaskProvider>(context);
    return Padding(
      padding: PaddingConstants.kProgressBarPadding,
      child: ShadowBoxContainer(
        height: SizesConstants.kProgressBarHeight,
        width: SizesConstants.kProgressBarWidth,
        child: LinearPercentIndicator(
          barRadius: SizesConstants.kProgressBarRadius,
          backgroundColor: Colors.transparent,
          linearGradient: LinearGradient(colors: [
            ColorConstatns.kLightPurple,
            ColorConstatns.kMediumPurple,
            ColorConstatns.kDarkPurple,
          ]),
          lineHeight: SizesConstants.kProgressBarLineHeight,
          percent: expData.differenctInPercentageExpValue,
        ),
      ),
    );
  }
}
