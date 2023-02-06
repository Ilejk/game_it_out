import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/images_constants.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/constants/string_constants.dart';
import 'package:login_logout_simple_ui/src/constants/textstyle_constants.dart';
import 'package:login_logout_simple_ui/src/pages/home_page.dart';
import 'package:login_logout_simple_ui/src/widgets/create_new_task_button.dart';
import 'package:login_logout_simple_ui/src/widgets/holder.dart';
import 'package:login_logout_simple_ui/src/widgets/shadow_box_container.dart';

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
                child: const ShadowBoxBlackButton(
                  title: StringConstants.kPlayTitle,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorConstatns.kShadow1,
                    ColorConstatns.kShadow2,
                    ColorConstatns.kShadow3,
                    ColorConstatns.kShadow4,
                    ColorConstatns.kShadow5,
                    ColorConstatns.kShadow6,
                  ],
                ),
              ),
            ),
            SizesConstants.kSizedBox45height,
          ],
        ),
      ),
    );
  }
}
