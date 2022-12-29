import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/widgets/bottom_navigation_bar_button.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
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
            avatar: 'images/home1.jpg',
          ),
          BottomNavigationBarButton(
            pageController: _pageController,
            pageIndex: 1,
            avatar: 'images/explore.jpg',
          ),
          BottomNavigationBarButton(
            pageController: _pageController,
            pageIndex: 2,
            avatar: 'images/reels.jpg',
          ),
          BottomNavigationBarButton(
            pageController: _pageController,
            pageIndex: 3,
            avatar: 'images/shop.jpg',
          ),
          BottomNavigationBarButton(
            pageController: _pageController,
            pageIndex: 4,
            avatar: 'images/profilepic.jpg',
          ),
        ],
      ),
    );
  }
}
