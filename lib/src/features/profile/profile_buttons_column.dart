import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_go_to_help_page.dart';
import '../../constants/padding_constants.dart';
import '../../constants/string_constants.dart';
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
        children: const [
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: ShadowBoxBlack(title: StringConstants.kNameChange),
          ),
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: ShadowBoxBlack(
              title: StringConstants.kReset,
            ),
          ),
          GoToHelpPageButton(),
        ],
      ),
    );
  }
}
