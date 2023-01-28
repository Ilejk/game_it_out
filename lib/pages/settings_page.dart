import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/constants/textstyle_constants.dart';
import 'package:login_logout_simple_ui/widgets/shadow_box_container.dart';
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    StringConstants.kSettingPageTitle,
                    style: TextStyleConstants.kTopBarTextStyleTitle,
                  ),
                ),
              ),
              SizesConstants.kSizedBox15width,
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

        //TODO: OPTION TO LOG OUT
        //TODO: LIST OF SETTINGS
      ],
    );
  }
}
