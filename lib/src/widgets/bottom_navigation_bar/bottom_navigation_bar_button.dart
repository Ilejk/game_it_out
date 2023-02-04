import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';

class BottomNavigationBarButton extends StatefulWidget {
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
  State<BottomNavigationBarButton> createState() =>
      _BottomNavigationBarButtonState();
}

class _BottomNavigationBarButtonState extends State<BottomNavigationBarButton> {
  late int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.pageController.page?.round();
  }

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Colors.transparent;

    if (selectedIndex == widget.pageIndex) {
      shadowColor = Colors.white;
    } else {
      shadowColor = Colors.transparent;
    }
    return GestureDetector(
      onTap: () {
        widget.pageController.animateToPage(widget.pageIndex,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        setState(() {
          selectedIndex = widget.pageIndex;
        });
      },
      child: Padding(
        padding: PaddingConstants.kBottomNavigationBarPadding,
        child: IconButton(
          color: ColorConstatns.kDarkGrey,
          iconSize: SizesConstants.kBottomNavigatiorBarIconSize,
          icon: Icon(
            widget.icon,
            color: ColorConstatns.kBackGroundGrey,
            shadows: [
              Shadow(color: shadowColor, blurRadius: 3),
              Shadow(color: shadowColor, blurRadius: 6),
            ],
          ),
          onPressed: () {
            widget.pageController.animateToPage(
              widget.pageIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
            setState(() {
              selectedIndex = widget.pageIndex;
            });
          },
        ),
      ),
    );
  }
}
