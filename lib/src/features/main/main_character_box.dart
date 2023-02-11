import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/data/database_provider.dart';
import 'package:login_logout_simple_ui/src/features/universal_components/shadow_box_container.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/images_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/sizes_constants.dart';
import '../../constants/string_constants.dart';

class MainCharacterBox extends StatelessWidget {
  const MainCharacterBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lvlData = Provider.of<DataBaseProvider>(context);
    var pickedCharacter = Provider.of<DataBaseProvider>(context);
    return Padding(
      padding: PaddingConstants.kCharacterImagePadding,
      child: ShadowBoxContainer(
        color: ColorConstatns.kBackGroundGrey,
        height: SizesConstants.kCharacterBoxHeight,
        width: SizesConstants.kCharacterBoxWidth,
        child: Padding(
          padding: PaddingConstants.kBasePadding10,
          child: Column(
            children: [
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: Text(
                  '${StringConstants.kLvLString}    ${lvlData.currentLvlCount}',
                  style: TextStyle(
                    fontSize: SizesConstants.kLVLfontsize,
                    fontWeight: FontWeight.bold,
                    color: ColorConstatns.kDarkGrey,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              ClipRRect(
                borderRadius: SizesConstants.kBorderRadius12,
                child: Image.asset(
                  pickedCharacter.character,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
