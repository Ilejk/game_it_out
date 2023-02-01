import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/widgets/shadow_box_container.dart';
import '../data/constants/color_constants.dart';
import '../data/constants/images_constants.dart';
import '../data/constants/padding_constants.dart';
import '../data/constants/sizes_constants.dart';
import '../data/constants/string_constants.dart';

class MainCharacterBox extends StatelessWidget {
  const MainCharacterBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.kCharacterImagePadding,
      child: ShadowBoxContainer(
        height: SizesConstants.kCharacterBoxHeight,
        width: SizesConstants.kCharacterBoxWidth,
        child: Padding(
          padding: PaddingConstants.kBasePadding10,
          child: Column(
            children: [
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: Text(
                  '${StringConstants.kLvLString}    3',
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
                  ImagesConstants.kManCharacterPNG,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
