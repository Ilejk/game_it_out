import 'package:flutter/material.dart';
import '../constants/sizes_constants.dart';
import '../widgets/main_character_box.dart';
import '../widgets/progress_bar_idicator.dart';

class MainHomeGamePage extends StatelessWidget {
  const MainHomeGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          //TODO: LVL

          SizesConstants.kSizedBox20height,
          MainCharacterBox(),
          ProgressBarIndicator(),

          // TODO: VALUE SHOULD CHANGE DEPENDS ON THE LVL GOING UP
        ],
      ),
    );
  }
}
