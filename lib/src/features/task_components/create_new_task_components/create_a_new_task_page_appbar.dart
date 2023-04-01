import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/icons_constants.dart';
import '../../../constants/padding_constants.dart';
import '../../../constants/sizes_constants.dart';
import '../../../constants/string_constants.dart';
import '../../../constants/textstyle_constants.dart';

class CreateAnewTaskPageAppBar extends StatelessWidget {
  const CreateAnewTaskPageAppBar({
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
                  StringConstants.kNewTaskTitle,
                  style: TextStyleConstants.kTopBarTextStyleTitle,
                ),
              ),
            ),
          ),
          const Padding(
            padding: PaddingConstants.kBasePadding10,
            child: Icon(
              IconsConstants.kTaskMenuIcon,
              color: ColorConstatns.kBackGroundGrey,
              size: SizesConstants.kBottomNavigatiorBarIconSize,
            ),
          )
        ],
      ),
    );
  }
}
