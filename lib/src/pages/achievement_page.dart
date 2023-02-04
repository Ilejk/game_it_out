import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/widgets/appbars/achievement_page_appbar.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          AchievementPageAppBar(),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
