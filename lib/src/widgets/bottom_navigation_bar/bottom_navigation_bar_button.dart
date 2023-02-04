import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final int pageIndex;
  final PageController pageController;

  const BottomNavigationBarButton({
    super.key,
    required this.pageController,
    required this.title,
    required this.pageIndex,
    required this.icon,
  });

  @override
  State<BottomNavigationBarButton> createState() =>
      _BottomNavigationBarButtonState();
}

class _BottomNavigationBarButtonState extends State<BottomNavigationBarButton> {
  @override
  Widget build(BuildContext context) {
    return GButton(
        icon: widget.icon,
        text: widget.title,
        onPressed: () {
          widget.pageController.animateToPage(widget.pageIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        });
  }
}
