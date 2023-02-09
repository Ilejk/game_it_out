import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/sizes_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/textstyle_constants.dart';
import 'help_page_appbar.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(5.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: ColorConstatns.kDarkGrey,
        ),
      ),
      backgroundColor: ColorConstatns.kBackGroundGrey,
      body: SafeArea(
        child: Column(
          children: [
            const HelpPageAppBar(),
            Column(
              children: [
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Text(
                    StringConstants.kHowToPlay,
                    textAlign: TextAlign.center,
                    style: TextStyleConstants.kHowToPlayTextStyle,
                  ).animate().fadeIn(duration: 600.ms, curve: Curves.easeIn),
                ),
                SizesConstants.kSizedBox15height,
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Text(
                    StringConstants.kRules,
                    style: TextStyleConstants.kRulesTextStyle,
                  ).animate().fadeIn(
                      duration: 600.ms, curve: Curves.easeIn, delay: 600.ms),
                ),
                SizesConstants.kSizedBox15height,
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Text(
                    StringConstants.kPleaseRead,
                    textAlign: TextAlign.center,
                    style: TextStyleConstants.kHowToPlayTextStyle,
                  ).animate().fadeIn(
                      duration: 600.ms, curve: Curves.easeIn, delay: 1200.ms),
                ),
                SizesConstants.kSizedBox15height,
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Text(
                    StringConstants.kPleaseReadRules,
                    style: TextStyleConstants.kRulesTextStyle,
                  ).animate().fadeIn(
                      duration: 600.ms, curve: Curves.easeIn, delay: 1800.ms),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
