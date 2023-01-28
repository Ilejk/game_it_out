import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import '../constants/icons_constants.dart';
import '../constants/padding_constants.dart';
import '../constants/sizes_constants.dart';
import '../constants/string_constants.dart';
import '../constants/textstyle_constants.dart';
import '../widgets/shadow_box_container.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstatns.kBackGroundGrey,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: PaddingConstants.kBasePadding10,
                    child: ShadowBoxContainer(
                      height: SizesConstants.kBottomNavigatiorHeight,
                      width: SizesConstants.kBottomNavigatiorWidth,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          IconsConstants.kGoBackIcon,
                          size: SizesConstants.kTopNavigationBarIconSize,
                          color: ColorConstatns.kDarkGrey,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: PaddingConstants.kBasePadding10,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          StringConstants.kHelpPageTitle,
                          style: TextStyleConstants.kTopBarTextStyleTitle,
                        ),
                      ),
                    ),
                  ),
                  SizesConstants.kSizedBox15width,
                  Padding(
                    padding: PaddingConstants.kBasePadding10,
                    child: ShadowBoxContainer(
                      height: SizesConstants.kBottomNavigatiorHeight,
                      width: SizesConstants.kBottomNavigatiorWidth,
                      child: IconsConstants.kHelpIcon,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Text(
                    StringConstants.kHowToPlay,
                    textAlign: TextAlign.center,
                    style: TextStyleConstants.kHowToPlayTextStyle,
                  ),
                ),
                SizesConstants.kSizedBox15height,
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Text(
                    StringConstants.kRules,
                    style: TextStyleConstants.kRulesTextStyle,
                  ),
                ),
                SizesConstants.kSizedBox15height,
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Text(
                    StringConstants.kPleaseRead,
                    textAlign: TextAlign.center,
                    style: TextStyleConstants.kHowToPlayTextStyle,
                  ),
                ),
                SizesConstants.kSizedBox15height,
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Text(
                    StringConstants.kPleaseReadRules,
                    style: TextStyleConstants.kRulesTextStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
