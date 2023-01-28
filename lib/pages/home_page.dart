import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/pages/main_home_game_page.dart';
import 'package:login_logout_simple_ui/pages/profile_page.dart';
import 'package:login_logout_simple_ui/pages/task_page.dart';
import 'package:login_logout_simple_ui/providers/task_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _storageBox = Hive.box('storageBox');
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  @override
  void didChangeDependencies() {
    if (_storageBox.get('ITEMS') == null) {
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
