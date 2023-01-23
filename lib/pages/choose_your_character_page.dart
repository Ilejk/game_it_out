import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/icons_constants.dart';
import '../constants/sizes_constants.dart';
import '../widgets/shadow_box_container.dart';

class ChooseYourCharacterPage extends StatelessWidget {
  const ChooseYourCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstatns.kBackGroundGrey,
      body: SafeArea(
        child: Column(
          children: [
            //TODO : FINISH CHOOSE UR CHARACTER PAGE
            ShadowBoxContainer(
              height: SizesConstants.kBottomNavigatiorHeight,
              width: SizesConstants.kBottomNavigatiorWidth,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  IconsConstants.kGoBackIcon,
                  size: SizesConstants.kTopNavigationBarIconSize,
                  color: ColorConstatns.kDarkGreyIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
