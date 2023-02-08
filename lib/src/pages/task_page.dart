import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/data/database_provider.dart';
import 'package:provider/provider.dart';
import '../constants/sizes_constants.dart';
import '../widgets/appbars/task_page_appbar.dart';
import '../widgets/task_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  State<TaskPage> createState() =>
      // ignore: no_logic_in_create_state
      _TaskPageState(pageController: _pageController);
}

class _TaskPageState extends State<TaskPage> {
  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  final PageController pageController;

  _TaskPageState({required this.pageController});
  void goBackToMainHomePage() {
    setState(() {
      pageController.animateToPage(0,
          duration: SizesConstants.kAnimationDuration, curve: Curves.easeIn);
      //TODO: FIX THE HIGHLIGH ON THE BOTTOM BAR WHEN THE PAGE CHANGES
      //TODO: FIX THE HIGHLIGH ON THE BOTTOM BAR WHEN THE PAGE CHANGES
      //TODO: FIX THE HIGHLIGH ON THE BOTTOM BAR WHEN THE PAGE CHANGES
      //TODO: FIX THE HIGHLIGH ON THE BOTTOM BAR WHEN THE PAGE CHANGES
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const TaskPageAppBar(),
          Consumer<DataBaseProvider>(
            builder: (context, taskData, _) => Expanded(
              child: LiquidPullToRefresh(
                height: 300.0,
                color: ColorConstatns.kDarkGrey,
                animSpeedFactor: 2,
                backgroundColor: ColorConstatns.kBackGroundGrey,
                onRefresh: _handleRefresh,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return TaskWidget(
                      taskName: taskData.items[index].title,
                      difficulty: taskData.items[index].difficulty,
                      taskLenght: taskData.items[index].duration,
                      expGained: taskData.items[index].exp,
                      deleteTask: (ctx) {
                        setState(() {
                          taskData.updateDataBase();
                          taskData.deleteTask(taskData.items[index].title);
                        });
                      },
                      taskFinished: (ctx) {
                        setState(() {
                          taskData.addTaskExp(taskData.items[index]);
                          taskData.updateDataBase();
                        });
                        goBackToMainHomePage();
                      },
                    );
                  },
                  itemCount: taskData.items.length,
                ),
              ),
            ),
          ),
        ],
      ).animate().fadeIn(
            duration: 600.ms,
            curve: Curves.easeIn,
          ),
    );
  }
}
