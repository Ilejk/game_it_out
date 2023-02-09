import 'package:flutter/material.dart';
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
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const HelpPage(),
                  ),
                );
              },
              child: const ShadowBoxBlack(
                title: StringConstants.kHelpPageTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
