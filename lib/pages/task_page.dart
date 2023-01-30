import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive/hive.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/constants/string_constants.dart';
import 'package:login_logout_simple_ui/pages/create_a_new_task_page.dart';
import 'package:login_logout_simple_ui/providers/task_provider.dart';
import 'package:login_logout_simple_ui/widgets/shadow_box_container.dart';
import 'package:provider/provider.dart';
import '../constants/textstyle_constants.dart';
import '../widgets/task_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _storageBox = Hive.box('tBox');
  bool _toggleAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: PaddingConstants.kBasePadding10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    StringConstants.kTaskPageTitle,
                    style: TextStyleConstants.kTopBarTextStyleTitle,
                  ),
                ),
              ),
              SizesConstants.kSizedBox45width,
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: ShadowBoxContainer(
                  height: SizesConstants.kBottomNavigatiorHeight,
                  width: SizesConstants.kBottomNavigatiorWidth,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext cotext) =>
                              CreateANewTaskPage(),
                        ),
                      );
                    },
                    icon: IconsConstants.kAddIcon,
                  ),
                ),
              )
            ],
          ),
        ),
        Consumer<TaskProvider>(
          builder: (context, taskData, _) => Expanded(
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
                  taskFinished: (p0) {
                    setState(() {});
                    //TODO: task finished function
                    //TODO: add exp value to progrss bar
                  },
                );
              },
              itemCount: taskData.items.length,
            ),
          ),
        ),
      ],
    ).animate().fadeIn(
          duration: 600.ms,
          curve: Curves.easeIn,
        );
  }
}
