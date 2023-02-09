import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constants/sizes_constants.dart';
import 'main_character_box.dart';
import 'main_home_page_appbar.dart';
import 'main_home_progress_percentage_bar.dart';

class MainHomeGamePage extends StatelessWidget {
  const MainHomeGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          MainGameHomePageAppBar(),
          SizesConstants.kSizedBox20height,
          MainCharacterBox(),
          ProgressBarIndicator(),
        ],
      ),
    ).animate().fadeIn(
          duration: 600.ms,
          curve: Curves.easeIn,
        );
  }
}
