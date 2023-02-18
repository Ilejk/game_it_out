import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../constants/sizes_constants.dart';
import 'main_character_box.dart';
import 'main_home_page_appbar.dart';
import 'main_home_progress_percentage_bar.dart';

class MainHomeGamePage extends StatelessWidget {
  const MainHomeGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 500),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: MediaQuery.of(context).size.width / 2,
              child: FadeInAnimation(child: widget),
            ),
            children: const [
              MainGameHomePageAppBar(),
              SizesConstants.kSizedBox20height,
              MainCharacterBox(),
              ProgressBarIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
