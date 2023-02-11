import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';
import '../../constants/icons_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/sizes_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/textstyle_constants.dart';

class ChooseYourCharacterAppBar extends StatelessWidget {
  const ChooseYourCharacterAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstatns.kDarkGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                IconsConstants.kGoBackIcon,
                size: SizesConstants.kTopNavigationBarIconSize,
                color: ColorConstatns.kBackGroundGrey,
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: PaddingConstants.kBasePadding10,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  StringConstants.kChooseYourCharacter,
                  style: TextStyleConstants.kTopBarTextStyleTitle,
                ),
              ),
            ),
          ),
          SizesConstants.kSizedBox15width,
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: IconsConstants.kHolder,
          )
        ],
      ),
    );
  }
}
