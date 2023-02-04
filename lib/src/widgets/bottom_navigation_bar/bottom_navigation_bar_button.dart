import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/widgets/shadow_box_container.dart';

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
        padding: PaddingConstants.kBottomNavigationBarPadding,
        child: IconButton(
          color: ColorConstatns.kDarkGrey,
          iconSize: SizesConstants.kBottomNavigatiorBarIconSize,
          icon: Icon(
            icon,
            color: ColorConstatns.kBackGroundGrey,
          ),
          onPressed: () {
            pageController.animateToPage(
              pageIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
        ),
      ),
    );
  }
}
