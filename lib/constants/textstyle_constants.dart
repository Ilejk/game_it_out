import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';

import 'color_constants.dart';

class TextStyleConstants {
  static final kTopBarTextStyleTitle = TextStyle(
    fontSize: SizesConstants.kTopBarTitlePageSize,
    fontWeight: FontWeight.bold,
    letterSpacing: 3,
    color: ColorConstatns.kDarkGrey,
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
  static const kSubTextTextStylePurple = TextStyle(
    fontSize: SizesConstants.kSubTextFontSize,
    color: ColorConstatns.kLightPurpleText,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );
}
