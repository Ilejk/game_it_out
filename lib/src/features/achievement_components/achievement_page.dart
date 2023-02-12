import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:login_logout_simple_ui/src/features/achievement_components/achievement_widget.dart';
import 'package:login_logout_simple_ui/src/features/achievement_components/achievement_page_appbar.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../logic/logic_provider.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const AchievementPageAppBar(),
          Consumer<LogicProvider>(
            builder: (context, achievementData, _) => Expanded(
              child: LiquidPullToRefresh(
                height: 300.0,
                color: ColorConstatns.kDarkGrey,
                animSpeedFactor: 2,
                backgroundColor: ColorConstatns.kBackGroundGrey,
                onRefresh: _handleRefresh,
                child: AnimationLimiter(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          horizontalOffset:
                              MediaQuery.of(context).size.width / 2,
                          child: FadeInAnimation(
                            child: AchievementWidget(
                              achievementTitle:
                                  achievementData.achievements[index].title,
                              achievementDescription: achievementData
                                  .achievements[index].description,
                              isFinishedStatus: achievementData
                                  .achievements[index].isFinished,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: achievementData.achievements.length,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
