import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:login_logout_simple_ui/src/constants/images_constants.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/constants/textstyle_constants.dart';
import 'package:login_logout_simple_ui/src/widgets/holder.dart';
import 'package:login_logout_simple_ui/src/widgets/shadow_box_container.dart';
import 'package:provider/provider.dart';
import '../constants/string_constants.dart';
import '../data/database_provider.dart';
import '../widgets/appbars/profile_page_appbar.dart';
import '../widgets/create_new_task_button.dart';
import 'help_page.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<DataBaseProvider>(context);
    return SafeArea(
      child: Column(
        children: [
          const ProfilePageAppBar(),
          const Holder(),
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShadowBoxContainer(
                  height: 200,
                  width: 200,
                  child: ClipRRect(
                    borderRadius: SizesConstants.kBorderRadius12,
                    child: Image.asset(ImagesConstants.kManCharacterPNG),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.kCharacterName,
                      style: TextStyleConstants.kProfilInfoBoldTextStyle,
                    ),
                    SizesConstants.kSizedBox15height,
                    Text(
                      'Adrian',
                      style: TextStyleConstants.kProfileInfoTextStyle,
                    ),
                    SizesConstants.kSizedBox15height,
                    Text(
                      'Skiba',
                      style: TextStyleConstants.kProfileInfoTextStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
          const Holder(),
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstants.kCureentEXP,
                        style: TextStyleConstants.kProfileInfoTextStyle,
                      ),
                      Text(
                        '${data.currentExpValue.toStringAsFixed(2)} exp',
                        style: TextStyleConstants.kProfilInfoBoldTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstants.kCurrentLVL,
                        style: TextStyleConstants.kProfileInfoTextStyle,
                      ),
                      Text(
                        '${data.currentLvlCount.toString()} lvl',
                        style: TextStyleConstants.kProfilInfoBoldTextStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstants.kLevelCompletion,
                        style: TextStyleConstants.kProfileInfoTextStyle,
                      ),
                      Text(
                        '${data.differenctInPercentageExpValue.toStringAsFixed(2)} %',
                        style: TextStyleConstants.kProfilInfoBoldTextStyle,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Holder(),
          Padding(
            padding: PaddingConstants.kBasePadding10,
            child: Column(
              children: [
                const Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child:
                      ShadowBoxBlackButton(title: StringConstants.kNameChange),
                ),
                const Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: ShadowBoxBlackButton(
                    title: StringConstants.kReset,
                  ),
                ),
                Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const HelpPage(),
                        ),
                      );
                    },
                    child: const ShadowBoxBlackButton(
                      title: StringConstants.kHelpPageTitle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ).animate().fadeIn(
            duration: 600.ms,
            curve: Curves.easeIn,
          ),
    );
  }
}
