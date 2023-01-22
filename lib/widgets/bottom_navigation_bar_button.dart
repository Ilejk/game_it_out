import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/widgets/shadow_box_container.dart';

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
        child: ShadowBoxContainer(
          height: SizesConstants.kBottomNavigatiorHeight,
          width: SizesConstants.kBottomNavigatiorWidth,
          child: IconButton(
            color: ColorConstatns.kDarkGreyIcon,
            iconSize: SizesConstants.kBottomNavigatiorBarIconSize,
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
