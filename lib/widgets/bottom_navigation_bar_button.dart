import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';

class BottomNavigationBarButton extends StatelessWidget {
  final String avatar;
  final int pageIndex;
  final PageController pageController;

  const BottomNavigationBarButton({
    super.key,
    required this.pageController,
    required this.pageIndex,
    required this.avatar,
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
          child: CircleAvatar(
            backgroundImage: AssetImage(avatar),
            backgroundColor: ColorConstatns.kBlackColorText,
          ),
        ),
      ),
    );
  }
}
