import 'package:flutter/material.dart';
import '../../constants/padding_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/textstyle_constants.dart';
import '../../logic/logic_provider.dart';

class ProfileInformationBox extends StatelessWidget {
  const ProfileInformationBox({
    Key? key,
    required this.data,
  }) : super(key: key);

  final LogicProvider data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.kBasePadding10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConstants.kCureentEXP,
                  style: TextStyleConstants.kProfileInfoTextStyle,
                ),
                Text(
                  '${data.currentExpValue.toStringAsFixed(2)} exp',
                  style: TextStyleConstants.kProfilInfoBoldTextStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConstants.kCurrentLVL,
                  style: TextStyleConstants.kProfileInfoTextStyle,
                ),
                Text(
                  '${data.currentLvlCount.toString()} lvl',
                  style: TextStyleConstants.kProfilInfoBoldTextStyle,
                )
              ],
            ),
          ),
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConstants.kLevelCompletion,
                  style: TextStyleConstants.kProfileInfoTextStyle,
                ),
                Text(
                  '${data.differenctInPercentageExpValue.toStringAsFixed(2)} %',
                  style: TextStyleConstants.kProfilInfoBoldTextStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
