import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavigationBarButton(
            pageController: _pageController,
            pageIndex: 0,
            icon: Icons.home,
          ),
          BottomNavigationBarButton(
            pageController: _pageController,
            pageIndex: 1,
            icon: Icons.menu_book,
          ),
          BottomNavigationBarButton(
            pageController: _pageController,
            pageIndex: 2,
            icon: Icons.settings,
          ),
          BottomNavigationBarButton(
            pageController: _pageController,
            pageIndex: 3,
            icon: Icons.person,
          ),
        ],
      ),
    );
  }
}
