import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/images_constants.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/constants/string_constants.dart';
import 'package:login_logout_simple_ui/src/features/main/home_page.dart';
import 'package:login_logout_simple_ui/src/features/task_components/create_new_task_button.dart';

import '../universal_components/linear_gradient_divider.dart';

class StartTheGamePage extends StatelessWidget {
  const StartTheGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstatns.kBackGroundGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizesConstants.kSizedBox45height,
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: Padding(
                padding: PaddingConstants.kBasePadding10,
                child: Image.asset(
                  ImagesConstants.kGameItOutLogo,
                ),
              ),
            ),
            SizesConstants.kSizedBox45height,
            Padding(
              padding: PaddingConstants.kBasePadding10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage(),
                    ),
                  );
                },
                child: const ShadowBoxBlack(
                  title: StringConstants.kPlayTitle,
                ),
              ),
            ),
            const GradientLinearDivider(),
            SizesConstants.kSizedBox45height,
          ],
        ),
      ),
    );
  }
}
