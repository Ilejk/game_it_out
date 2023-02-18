import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/constants/string_constants.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: SizesConstants.kBorderRadius12,
      child: Container(
        color: ColorConstatns.kDarkGrey,
        child: FittedBox(
          fit: BoxFit.contain,
          child: ClipRRect(
            borderRadius: SizesConstants.kBorderRadius12,
            child: Container(
              color: ColorConstatns.kDarkGrey,
              child: GNav(
                iconSize: 23,
                gap: 8,
                color: ColorConstatns.kMediumGrey,
                activeColor: ColorConstatns.kActiveColor,
                tabs: [
                  GButton(
                      icon: IconsConstants.kMainHomeGamePageIcon,
                      text: StringConstants.kHomeBottomBar,
                      onPressed: () {
                        _pageController.animateToPage(0,
                            duration: SizesConstants.kAnimationDuration,
                            curve: Curves.easeIn);
                      }),
                  GButton(
                      icon: IconsConstants.kTaskMenuIcon,
                      text: StringConstants.kTaskBottomBar,
                      onPressed: () {
                        _pageController.animateToPage(1,
                            duration: SizesConstants.kAnimationDuration,
                            curve: Curves.easeIn);
                      }),
                  GButton(
                      icon: IconsConstants.kAchievement,
                      text: StringConstants.kAchievementBottomBar,
                      onPressed: () {
                        _pageController.animateToPage(2,
                            duration: SizesConstants.kAnimationDuration,
                            curve: Curves.easeIn);
                      }),
                  GButton(
                      icon: IconsConstants.kProfileIcon,
                      text: StringConstants.kProfileBottomBar,
                      onPressed: () {
                        _pageController.animateToPage(3,
                            duration: SizesConstants.kAnimationDuration,
                            curve: Curves.easeIn);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
