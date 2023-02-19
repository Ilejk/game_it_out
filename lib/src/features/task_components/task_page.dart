import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:login_logout_simple_ui/src/constants/animation_constants.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/constants/string_constants.dart';
import 'package:login_logout_simple_ui/src/constants/textstyle_constants.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../logic/logic_provider.dart';
import 'task_page_appbar.dart';
import 'task_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  Future<void> _handleRefresh() async {
    Provider.of<LogicProvider>(context, listen: false).updateDataBase();
    Provider.of<LogicProvider>(context, listen: false).loadDataBase();
    return await Future.delayed(const Duration(seconds: 2));
  }

  Future<dynamic> playAnimation(BuildContext ctx, String animation) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black54,
        pageBuilder: (BuildContext context, _, __) {
          return Lottie.asset(
            animation,
            repeat: false,
            width: 700,
            height: 700,
            onLoaded: (composition) {
              Future.delayed(composition.duration, () {
                Navigator.pop(context);
              });
            },
          );
        },
      ),
    );
  }

  Future<dynamic> taskAlreadyDoneAnimation(
      BuildContext ctx, String animation) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black54,
        pageBuilder: (BuildContext context, _, __) {
          return Column(
            children: [
              Lottie.asset(
                animation,
                repeat: false,
                width: 700,
                height: 700,
                onLoaded: (composition) {
                  Future.delayed(composition.duration, () {
                    Navigator.pop(context);
                  });
                },
              ),
              Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringConstants.kHasBenFinished,
                      textAlign: TextAlign.center,
                      style: TextStyleConstants.kHasAlreadyBeenDoneTextSTyle,
                    ),
                    SizesConstants.kSizedBox15height,
                    Text(
                      StringConstants.kComeBackTomorrow,
                      textAlign: TextAlign.center,
                      style: TextStyleConstants.kHasAlreadyBeenDoneTextSTyle,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
    Provider.of<LogicProvider>(context, listen: false).updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const TaskPageAppBar(),
          Consumer<LogicProvider>(
            builder: (context, taskData, _) => Expanded(
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
                            child: TaskWidget(
                              taskName: taskData.items[index].title,
                              difficulty: taskData.items[index].difficulty,
                              taskLenght: taskData.items[index].duration,
                              expGained: taskData.items[index].exp,
                              deleteTask: (ctx) {
                                setState(() {
                                  taskData.updateDataBase();
                                  taskData
                                      .deleteTask(taskData.items[index].title);
                                });
                                playAnimation(ctx, AnimationConstants.kDelete);
                              },
                              taskFinished: (ctx) {
                                !taskData.runningTimers.containsKey(
                                        taskData.items[index].title)
                                    ? setState(() {
                                        taskData.startTimer(
                                          taskData.items[index],
                                        );
                                        taskData
                                            .addTaskExp(taskData.items[index]);
                                        taskData.updateDataBase();
                                        playAnimation(
                                            ctx, AnimationConstants.kFinished);
                                      })
                                    : taskAlreadyDoneAnimation(
                                        ctx, AnimationConstants.kWrong);
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: taskData.items.length,
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
