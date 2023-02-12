import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/images_constants.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/constants/string_constants.dart';
import 'package:login_logout_simple_ui/src/features/main/home_page.dart';
import 'package:login_logout_simple_ui/src/features/new_game/choose_your_character_page.dart';
import 'package:login_logout_simple_ui/src/features/task_components/create_new_task_button.dart';
import 'package:provider/provider.dart';
import '../../logic/logic_provider.dart';
import '../universal_components/linear_gradient_divider.dart';

class StartTheGamePage extends StatefulWidget {
  const StartTheGamePage({super.key});

  @override
  State<StartTheGamePage> createState() => _StartTheGamePageState();
}

class _StartTheGamePageState extends State<StartTheGamePage> {
  var pushAfterStartingPage;
  final _storageBox = Hive.box('cyceBox');

  @override
  void didChangeDependencies() {
    if (_storageBox.get('TASKS') == null) {
      pushAfterStartingPage = ChooseYourCharacterPage();
      Provider.of<LogicProvider>(context).createInitialDataBase();
    } else {
      pushAfterStartingPage = const HomePage();
      Provider.of<LogicProvider>(context).loadDataBase();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstatns.kBackGroundGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizesConstants.kSizedBox45height,
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: Padding(
                padding: PaddingConstants.kBasePadding10,
                child: Image.asset(
                  ImagesConstants.kGameItOutLogo,
                ),
              ),
            ),
            SizesConstants.kSizedBox45height,
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => pushAfterStartingPage,
                    ),
                  );
                },
                child: const ShadowBoxBlack(
                  title: StringConstants.kPlayTitle,
                ),
              ),
            ),
            const GradientLinearDivider(),
            SizesConstants.kSizedBox45height,
          ],
        ),
      ),
    );
  }
}
