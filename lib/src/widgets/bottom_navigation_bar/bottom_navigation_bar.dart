import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/widgets/bottom_navigation_bar/bottom_navigation_bar_button.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavigationBarButton(
              pageController: _pageController,
              pageIndex: 0,
              icon: IconsConstants.kMainHomeGamePageIcon,
            ),
            BottomNavigationBarButton(
              pageController: _pageController,
              pageIndex: 1,
              icon: IconsConstants.kTaskMenuIcon,
            ),
            BottomNavigationBarButton(
              pageController: _pageController,
              pageIndex: 2,
              icon: IconsConstants.kAchievement,
            ),
            BottomNavigationBarButton(
              pageController: _pageController,
              pageIndex: 3,
              icon: IconsConstants.kProfileIcon,
            ),
          ],
        ),
      ),
    );
  }
}
