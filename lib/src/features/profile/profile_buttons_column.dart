import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import '../../constants/color_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/string_constants.dart';
import '../help/help_page.dart';
import '../task_components/create_new_task_button.dart';

class ProfileButtonsColumn extends StatelessWidget {
  const ProfileButtonsColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.kBasePadding10,
      child: Column(
        children: [
          const Padding(
            padding: PaddingConstants.kBasePadding10,
            child: ShadowBoxBlack(title: StringConstants.kNameChange),
          ),
          const Padding(
            padding: PaddingConstants.kBasePadding10,
            child: ShadowBoxBlack(
              title: StringConstants.kReset,
            ),
          ),
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: OpenContainer(
              openElevation: 0.0,
              closedElevation: 0.0,
              closedShape: RoundedRectangleBorder(
                borderRadius: SizesConstants.kBorderRadius12,
              ),
              transitionDuration: const Duration(milliseconds: 500),
              closedColor: ColorConstatns.kBackGroundGrey,
              middleColor: Colors.transparent,
              openColor: Colors.transparent,
              transitionType: ContainerTransitionType.fade,
              openBuilder: (context, action) {
                return const HelpPage();
              },
              closedBuilder: (context, action) {
                return GestureDetector(
                  onTap: action,
                  child: const ShadowBoxBlack(
                    title: StringConstants.kHelpPageTitle,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
