import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/pages/main_home_game_page.dart';
import 'package:login_logout_simple_ui/src/pages/profile_page.dart';
import 'package:login_logout_simple_ui/src/pages/task_page.dart';
import 'package:login_logout_simple_ui/src/providers/task_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _storageBox = Hive.box('tBox');
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  @override
  void didChangeDependencies() {
    if (_storageBox.get('TASKS') == null) {
      Provider.of<TaskProvider>(context).createInitialDataBase();
    } else {
      Provider.of<TaskProvider>(context).loadDataBase();
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
                  const TaskPage(),
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