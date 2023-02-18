import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_character_info_box.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_go_to_help_page.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_information_box.dart';
import 'package:provider/provider.dart';
import '../../logic/logic_provider.dart';
import 'profile_page_appbar.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<LogicProvider>(context);
    return SafeArea(
      child: AnimationLimiter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 500),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: MediaQuery.of(context).size.width / 2,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              const ProfilePageAppBar(),
              CharacterBoxInfo(namingData: data),
              ProfileInformationBox(data: data),
              SizesConstants.kSizedBox45height,
              const GoToHelpPageButton(),
              SizesConstants.kSizedBox45height,
            ],
          ),
        ),
      ),
    );
  }
}
