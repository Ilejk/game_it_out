import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_logout_simple_ui/src/data/task_typeAdapter.dart';
import 'package:login_logout_simple_ui/src/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_logout_simple_ui/src/data/task.dart';
import 'package:login_logout_simple_ui/src/data/database_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());
  await Hive.openBox('dBox');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: DataBaseProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
      ),
    );
  }
}
