import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';

import '../constants/color_constants.dart';
import '../constants/icons_constants.dart';
import '../constants/string_constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Center(
            child: Text(
              StringConstants.kSettingPageTitle,
              style: TextStyle(
                color: ColorConstatns.kWhite,
                fontSize: SizesConstants.kTopNavigationBarFontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        //TODO: TOP BAR SAYING SETTINGS
        //TODO: OPTION TO LOG OUT
        //TODO: LIST OF SETTINGS
      ],
    );
  }
}
