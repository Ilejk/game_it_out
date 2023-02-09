import 'package:flutter/material.dart';
import '../../constants/images_constants.dart';
import '../../constants/sizes_constants.dart';
import '../universal_components/shadow_box_container.dart';

class ProfileCharacterBox extends StatelessWidget {
  const ProfileCharacterBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowBoxContainer(
      height: 200,
      width: 200,
      child: ClipRRect(
        borderRadius: SizesConstants.kBorderRadius12,
        child: Image.asset(ImagesConstants.kManCharacterPNG),
      ),
    );
  }
}
