import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/sizes_constants.dart';
import '../../logic/logic_provider.dart';
import '../universal_components/shadow_box_container.dart';

class ProfileCharacterBox extends StatelessWidget {
  const ProfileCharacterBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pickedCharacter = Provider.of<LogicProvider>(context);
    return ShadowBoxContainer(
      color: ColorConstatns.kBackGroundGrey,
      height: 200,
      width: 200,
      child: ClipRRect(
        borderRadius: SizesConstants.kBorderRadius12,
        child: Image.asset(
          pickedCharacter.character,
        ),
      ),
    );
  }
}
