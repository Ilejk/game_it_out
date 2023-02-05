import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';
import '../../constants/icons_constants.dart';
import '../../constants/padding_constants.dart';
import '../../constants/sizes_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/textstyle_constants.dart';
import '../../pages/help_page.dart';

class MainGameHomePageAppBar extends StatelessWidget {
  const MainGameHomePageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstatns.kDarkGrey,
      child: Padding(
        padding: PaddingConstants.kBasePadding10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: IconButton(
                onPressed: () {},
                icon: IconsConstants.kHolder,
              ),
            ),
            const Padding(
              padding: PaddingConstants.kBasePadding10,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  StringConstants.kPlayTitle,
                  style: TextStyleConstants.kTopBarTextStyleTitle,
                ),
              ),
            ),
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext cotext) => const HelpPage(),
                    ),
                  );
                },
                icon: IconsConstants.kHelpIcon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
