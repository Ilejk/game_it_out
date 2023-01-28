import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/pages/choose_your_character_page.dart';
import 'package:login_logout_simple_ui/widgets/shadow_box_container.dart';
import '../constants/sizes_constants.dart';
import '../constants/string_constants.dart';
import '../constants/textstyle_constants.dart';
import '../widgets/divider_widget.dart';
import 'help_page.dart';

class MyProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  MyProfilePage({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

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
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: Center(
                child: Text(
                  '${StringConstants.kSignedInAS} ${user.email.toString()}',
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
                onTap: signUserOut,
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
    );
  }
}
