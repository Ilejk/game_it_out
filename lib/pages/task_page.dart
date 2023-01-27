import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/constants/string_constants.dart';
import 'package:login_logout_simple_ui/pages/create_a_new_task_page.dart';
import 'package:login_logout_simple_ui/widgets/shadow_box_container.dart';
import '../constants/textstyle_constants.dart';
import '../widgets/task_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List taskList = [
    ['Exercise', 'Medium', 2, 12],
    ['Code', 'Hard', 4, 55],
    ['Write', 'Easy', 3, 30],
  ];

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
                              const CreateANewTaskPage(),
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
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskWidget(
                taskName: taskList[index][0],
                difficulty: taskList[index][1],
                taskLenght: taskList[index][2],
                onTap: () {
                  //TODO: add exp value to progrss bar
                },
                expGained: taskList[index][3],
              );
            },
            itemCount: taskList.length,
          ),
        ),

        //TODO: SCROLLABLE LIST OF TASKS
        //TODO: LIKE 10 TASKS HARDCODED
        //TODO: A TASK SHOULD HAVE AN OPTION TO BE DELETED ON SLIDE TO THE LEFT
        //TODO: OR MARKED AS DONE AND THAT SHOULD ADD APPRIOPRIATE VALUE TO THE PROGRESS BAR
        //TODO: AT THE TOP THERE SHOULD BE A PLUS ICON ALLOWING TO ADD A NEW TASK => CREATE A NEW TAST PAGE
      ],
    );
  }
}
