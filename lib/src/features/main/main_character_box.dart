import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/features/universal_components/shadow_box_container.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/sizes_constants.dart';
import '../../constants/string_constants.dart';
import '../../logic/logic_provider.dart';

class MainCharacterBox extends StatelessWidget {
  const MainCharacterBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lvlData = Provider.of<LogicProvider>(context);
    var pickedCharacter = Provider.of<LogicProvider>(context);
    return Padding(
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
          ClipRRect(
            borderRadius: SizesConstants.kBorderRadius12,
            child: SizedBox(
              height: 500,
              width: 450,
              child: Lottie.asset(
                pickedCharacter.character,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
