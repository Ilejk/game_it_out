import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';

class BottomNavigationBarButton extends StatelessWidget {
  final IconData icon;
  final int pageIndex;
  final PageController pageController;

  const BottomNavigationBarButton({
    super.key,
    required this.pageController,
    required this.pageIndex,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageController.animateToPage(pageIndex,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: 60,
          color: ColorConstatns.kBlackColorText,
          child: IconButton(
            color: ColorConstatns.kWhite,
            iconSize: 30,
            icon: Icon(icon),
            onPressed: () {
              pageController.animateToPage(
                pageIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
        ),
      ),
    );
  }
}
