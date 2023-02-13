import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:login_logout_simple_ui/src/constants/color_constants.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/constants/textstyle_constants.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_character_box.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_go_to_help_page.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_information_box.dart';
import 'package:login_logout_simple_ui/src/features/universal_components/shadow_box_container.dart';
import 'package:login_logout_simple_ui/src/main.dart';
import 'package:provider/provider.dart';
import '../../constants/string_constants.dart';
import '../../logic/logic_provider.dart';
import 'profile_page_appbar.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<LogicProvider>(context);
    var namingData = Provider.of<LogicProvider>(context);
    return SafeArea(
      child: AnimationLimiter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 500),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: MediaQuery.of(context).size.width / 2,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              const ProfilePageAppBar(),
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: ShadowBoxContainer(
                  height: 250,
                  width: double.infinity,
                  color: ColorConstatns.kBackGroundGrey,
                  child: Padding(
                    padding: PaddingConstants.kBasePadding10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ProfileCharacterBox(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstants.kCharacterName,
                              style:
                                  TextStyleConstants.kProfilInfoBoldTextStyle,
                            ),
                            SizesConstants.kSizedBox20height,
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringConstants.kName,
                                    style: TextStyleConstants
                                        .kProfilInfoBoldTextStyle,
                                  ),
                                  Text(
                                    namingData.name,
                                    style: TextStyleConstants
                                        .kProfileInfoTextStyle,
                                  ),
                                ]),
                            SizesConstants.kSizedBox15height,
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringConstants.kSurname,
                                    style: TextStyleConstants
                                        .kProfilInfoBoldTextStyle,
                                  ),
                                  Text(
                                    namingData.surname,
                                    style: TextStyleConstants
                                        .kProfileInfoTextStyle,
                                  ),
                                ]),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ProfileInformationBox(data: data),
              SizesConstants.kSizedBox45height,
              const GoToHelpPageButton(),
              SizesConstants.kSizedBox45height,
            ],
          ),
        ),
      ),
    );
  }
}
