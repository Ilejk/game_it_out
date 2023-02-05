import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/string_constants.dart';
import 'package:login_logout_simple_ui/src/constants/textstyle_constants.dart';
import '../constants/color_constants.dart';
import '../constants/icons_constants.dart';
import '../constants/images_constants.dart';
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
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: Row(
                children: [
                  Padding(
                    padding: PaddingConstants.kBasePadding10,
                    child: ShadowBoxContainer(
                      height: SizesConstants.kBottomNavigatiorHeight,
                      width: SizesConstants.kBottomNavigatiorWidth,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          IconsConstants.kGoBackIcon,
                          size: SizesConstants.kTopNavigationBarIconSize,
                          color: ColorConstatns.kDarkGrey,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: PaddingConstants.kBasePadding10,
                      child: Center(
                        child: Text(
                          StringConstants.kMenu,
                          textAlign: TextAlign.center,
                          style: TextStyleConstants.kTopBarTextStyleTitle,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: PaddingConstants.kBasePadding10,
                    child: ShadowBoxContainer(
                      height: SizesConstants.kBottomNavigatiorHeight,
                      width: SizesConstants.kBottomNavigatiorWidth,
                      child: IconButton(
                        onPressed: () {
                          //TODO : go somewhere
                        },
                        icon: Icon(
                          IconsConstants.kChooseYourChracterIcon,
                          size: SizesConstants.kTopNavigationBarIconSize,
                          color: ColorConstatns.kDarkGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizesConstants.kSizedBox45height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShadowBoxContainer(
                  height: SizesConstants.kChooseYourCharacterBoxHeight,
                  width: SizesConstants.kChooseYourCharacterBoxWidth,
                  child: Padding(
                    padding: PaddingConstants.kBasePadding10,
                    child: ClipRRect(
                      borderRadius: SizesConstants.kBorderRadius12,
                      child: Image.asset(
                        //TODO: add on tap choose cahracter
                        ImagesConstants.kManCharacterPNG,
                      ),
                    ),
                  ),
                ),
                SizesConstants.kSizedBox15width,
                ShadowBoxContainer(
                  height: SizesConstants.kChooseYourCharacterBoxHeight,
                  width: SizesConstants.kChooseYourCharacterBoxWidth,
                  child: Padding(
                    padding: PaddingConstants.kBasePadding10,
                    child: ClipRRect(
                      borderRadius: SizesConstants.kBorderRadius12,
                      child: Image.asset(
                        //TODO: add on tap choose cahracter

                        ImagesConstants.kWomanCharacterPNG,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizesConstants.kSizedBox45height,
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: Center(
                child: Text(
                  StringConstants.kChooseYourCharacter,
                  textAlign: TextAlign.center,
                  style: TextStyleConstants.kTopBarTextStyleTitle,
                ),
              ),
            ),
            SizesConstants.kSizedBox45height,
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: ShadowBoxContainer(
                height: SizesConstants.kProcedeButtonHeight,
                width: SizesConstants.kProcedeButtonWidth,
                child: Center(
                  child: Text(
                    StringConstants.kProcede,
                    textAlign: TextAlign.center,
                    style: TextStyleConstants.kTopBarTextStyleTitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
