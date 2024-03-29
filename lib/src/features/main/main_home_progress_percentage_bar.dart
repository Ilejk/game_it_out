import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/list_constants.dart';
import 'package:login_logout_simple_ui/src/features/universal_components/shadow_box_container.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/sizes_constants.dart';
import '../../logic/logic_provider.dart';

class ProgressBarIndicator extends StatelessWidget {
  const ProgressBarIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var expData = Provider.of<LogicProvider>(context);
    return Padding(
      padding: PaddingConstants.kProgressBarPadding,
      child: ShadowBoxContainer(
        color: ColorConstatns.kBackGroundGrey,
        height: SizesConstants.kProgressBarHeight,
        width: SizesConstants.kProgressBarWidth,
        child: LinearPercentIndicator(
          animation: true,
          animationDuration: 1200,
          animateFromLastPercent: true,
          barRadius: SizesConstants.kProgressBarRadius,
          backgroundColor: Colors.transparent,
          linearGradient:
              LinearGradient(colors: ListConstants.kGradientColorList),
          lineHeight: SizesConstants.kProgressBarLineHeight,
          percent: expData.differenctInPercentageExpValue,
        ),
      ),
    );
  }
}
