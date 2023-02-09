// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/features/achievement_components/achievement_page.dart';
import 'package:login_logout_simple_ui/src/features/main/main_home_game_page.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_page.dart';
import 'package:login_logout_simple_ui/src/features/task_components/task_page.dart';
import 'package:login_logout_simple_ui/src/data/database_provider.dart';
import 'package:provider/provider.dart';
import '../bottom_navigation_bar/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _storageBox = Hive.box('dBox');
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void didChangeDependencies() {
    if (_storageBox.get('TASKS') == null) {
      Provider.of<DataBaseProvider>(context).createInitialDataBase();
    } else {
      Provider.of<DataBaseProvider>(context).loadDataBase();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(5.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: ColorConstatns.kDarkGrey,
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        pageController: _pageController,
      ),
      backgroundColor: ColorConstatns.kBackGroundGrey,
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
                  const MainHomeGamePage(),
                  TaskPage(
                    pageController: _pageController,
                  ),
                  const AchievementsPage(),
                  const MyProfilePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
