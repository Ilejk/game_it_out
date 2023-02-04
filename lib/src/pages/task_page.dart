import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:login_logout_simple_ui/src/providers/task_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/appbars/task_page_appbar.dart';
import '../widgets/task_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TaskPageAppBar(),
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
                  taskFinished: (ctx) {
                    setState(() {
                      taskData.addTaskExp(taskData.items[index]);
                    });
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
