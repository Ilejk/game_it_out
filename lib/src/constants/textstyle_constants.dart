import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';

import 'color_constants.dart';

class TextStyleConstants {
  static const kTopBarTextStyleTitle = TextStyle(
    fontSize: SizesConstants.kTopBarTitlePageSize,
    fontWeight: FontWeight.bold,
    letterSpacing: 3,
    color: ColorConstatns.kBackGroundGrey,
  );
  static const kSignInRegisterTitleTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: SizesConstants.kTitleTextFontSize,
  );
  static final kSubTitleTextStyle = TextStyle(
    fontSize: SizesConstants.kSubTextFontSize,
    letterSpacing: 1,
    color: ColorConstatns.kSubTextLightGrey500,
    fontWeight: FontWeight.bold,
  );
  static final kSubTextTextStyleGrey = TextStyle(
    color: ColorConstatns.kSubTextLightGrey500,
    fontWeight: FontWeight.bold,
    fontSize: SizesConstants.kSubTextFontSize,
  );
  static const kSubTextTextStyleBlack = TextStyle(
    fontSize: SizesConstants.kSubTextFontSize,
    color: ColorConstatns.kBlack,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );
  static final kSubTextTextStyleOrange = TextStyle(
    fontSize: SizesConstants.kSubTextFontSize,
    color: ColorConstatns.kShadow2,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );
  static final kTaskTitleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    color: ColorConstatns.kDarkGrey,
  );
  static final kTaskSubTitleTextStyle = TextStyle(
    fontSize: 15,
    letterSpacing: 2,
    color: ColorConstatns.kDarkGrey,
  );
  static final kSettingsTextStyle = TextStyle(
    fontSize: 20,
    letterSpacing: 2,
    color: ColorConstatns.kDarkGrey,
  );
  static final kHowToPlayTextStyle = TextStyle(
    fontSize: 22,
    letterSpacing: 3,
    color: ColorConstatns.kDarkGrey,
    fontWeight: FontWeight.bold,
  );
  static final kRulesTextStyle = TextStyle(
    fontSize: 18,
    letterSpacing: 3,
    height: 1.4,
    color: ColorConstatns.kDarkGrey,
  );
}
