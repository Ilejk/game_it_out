import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_logout_simple_ui/src/features/task_components/task_type_adapter.dart';
import 'package:login_logout_simple_ui/src/features/task_components/task.dart';
import 'package:login_logout_simple_ui/src/features/new_game/start_the_game_page.dart';
import 'package:provider/provider.dart';
import 'features/achievement_components/achievement_adapter.dart';
import 'features/timer/timer_adapter.dart';
import 'logic/logic_provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());
  Hive.registerAdapter(AchievementAdapter());
  Hive.registerAdapter(TimerWrapperAdapter());

  await Hive.openBox('99999Box');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: LogicProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartTheGamePage(),
      ),
    );
  }
}
