import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/widgets/shadow_box_container.dart';

import '../constants/color_constants.dart';
import '../constants/icons_constants.dart';
import '../constants/string_constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: PaddingConstants.kBasePadding10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: ShadowBoxContainer(
                  height: SizesConstants.kTopBarTitleHeight,
                  width: SizesConstants.kTopBarTitleWidth,
                  child: Center(
                    child: Text(
                      StringConstants.kSettingPageTitle,
                      style: TextStyle(
                        color: ColorConstatns.kDarkGreyIcon,
                        fontSize: SizesConstants.kTopNavigationBarFontSize,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: PaddingConstants.kBasePadding10,
                child: ShadowBoxContainer(
                  height: SizesConstants.kBottomNavigatiorHeight,
                  width: SizesConstants.kBottomNavigatiorWidth,
                  child: Icon(
                    IconsConstants.kSettingsIcon,
                    size: SizesConstants.kBottomNavigatiorBarIconSize,
                  ),
                ),
              )
            ],
          ),
        ),
        const Expanded(child: SizedBox())
        //TODO: TOP BAR SAYING SETTINGS
        //TODO: OPTION TO LOG OUT
        //TODO: LIST OF SETTINGS
      ],
    );
  }
}
