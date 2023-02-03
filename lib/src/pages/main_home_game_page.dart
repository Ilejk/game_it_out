import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:login_logout_simple_ui/src/pages/help_page.dart';
import '../constants/icons_constants.dart';
import '../constants/padding_constants.dart';
import '../constants/sizes_constants.dart';
import '../constants/string_constants.dart';
import '../constants/textstyle_constants.dart';
import '../widgets/main_character_box.dart';
import '../widgets/progress_bar_idicator.dart';
import '../widgets/shadow_box_container.dart';

class MainHomeGamePage extends StatelessWidget {
  const MainHomeGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
                      StringConstants.kPlayTitle,
                      style: TextStyleConstants.kTopBarTextStyleTitle,
                    ),
                  ),
                ),
                SizesConstants.kSizedBox55width,
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: ShadowBoxContainer(
                    height: SizesConstants.kBottomNavigatiorHeight,
                    width: SizesConstants.kBottomNavigatiorWidth,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext cotext) => const HelpPage(),
                          ),
                        );
                      },
                      icon: IconsConstants.kHelpIcon,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizesConstants.kSizedBox20height,
          const MainCharacterBox(),
          const ProgressBarIndicator(),
        ],
      ),
    ).animate().fadeIn(
          duration: 600.ms,
          curve: Curves.easeIn,
        );
  }
}
