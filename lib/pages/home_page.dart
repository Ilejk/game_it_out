import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/pages/feed_page.dart';
import 'package:login_logout_simple_ui/pages/my_profile_page.dart';
import 'package:login_logout_simple_ui/widgets/my_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(
        pageController: _pageController,
      ),
      backgroundColor: ColorConstatns.kBlackColorText,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                children: [
                  FeedPage(),
                  MyProfilePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
