import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/pages/choose_your_character_page.dart';
import 'package:login_logout_simple_ui/src/widgets/shadow_box_container.dart';
import '../constants/sizes_constants.dart';
import '../constants/string_constants.dart';
import '../constants/textstyle_constants.dart';
import '../widgets/appbars/profile_page_appbar.dart';
import '../widgets/divider_widget.dart';
import 'help_page.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePageAppBar(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: Center(
                child: Text(
                  StringConstants.kSignedInAS,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: ColorConstatns.kDarkGrey,
                  ),
                ),
              ),
            ),
            const DividerWidget(),
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: ShadowBoxContainer(
                height: SizesConstants.kBottomNavigatiorHeight,
                width: SizesConstants.kBottomNavigatiorWidth,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext cotext) =>
                            const ChooseYourCharacterPage(),
                      ),
                    );
                  },
                  icon: Icon(
                    IconsConstants.kProfileLogOutIcon,
                    size: SizesConstants.kTopNavigationBarIconSize,
                    color: ColorConstatns.kDarkGrey,
                  ),
                ),
              ),
            ),
            const DividerWidget(),
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: GestureDetector(
                onTap: () {
                  // TODO: GO TO MY PROFILE OR STH
                },
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: PaddingConstants.kBasePadding10,
                        child: Text(
                          StringConstants.kMyProfile,
                          style: TextStyleConstants.kSettingsTextStyle,
                        ),
                      ),
                      SizesConstants.kSizedBox50width,
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: PaddingConstants.kBasePadding10,
                        child: Icon(
                          IconsConstants.kProfileIcon,
                          size: SizesConstants.kTopNavigationBarIconSize,
                          color: ColorConstatns.kDarkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const DividerWidget(),
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: GestureDetector(
                onTap: () {
                  //TODO: CHNAGE THEME
                },
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: PaddingConstants.kBasePadding10,
                        child: Text(
                          StringConstants.kChangeTheme,
                          style: TextStyleConstants.kSettingsTextStyle,
                        ),
                      ),
                      SizesConstants.kSizedBox50width,
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: PaddingConstants.kBasePadding10,
                        child: Icon(
                          IconsConstants.kTheme,
                          size: SizesConstants.kTopNavigationBarIconSize,
                          color: ColorConstatns.kDarkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const DividerWidget(),
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext cotext) => const HelpPage(),
                    ),
                  );
                },
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: PaddingConstants.kBasePadding10,
                        child: Text(
                          StringConstants.kHelpPageTitle,
                          style: TextStyleConstants.kSettingsTextStyle,
                        ),
                      ),
                      SizesConstants.kSizedBox50width,
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: PaddingConstants.kBasePadding10,
                        child: IconsConstants.kHelpIcon,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const DividerWidget(),
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: GestureDetector(
                onTap: () {
                  //TODO: TO STH ABOUT THIS PAGE
                },
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: PaddingConstants.kBasePadding10,
                        child: Text(
                          StringConstants.kLogOut,
                          style: TextStyleConstants.kSettingsTextStyle,
                        ),
                      ),
                      SizesConstants.kSizedBox50width,
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: PaddingConstants.kBasePadding10,
                        child: Icon(
                          IconsConstants.kProfileLogOutIcon,
                          size: SizesConstants.kTopNavigationBarIconSize,
                          color: ColorConstatns.kDarkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const DividerWidget(),
          ],
        )
      ],
    ).animate().fadeIn(
          duration: 600.ms,
          curve: Curves.easeIn,
        );
  }
}
