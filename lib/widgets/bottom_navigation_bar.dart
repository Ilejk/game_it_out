import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/widgets/bottom_navigation_bar_button.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          icon: IconsConstants.kProfileIcon,
        ),
      ],
    );
  }
}
