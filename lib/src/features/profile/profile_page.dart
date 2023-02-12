import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:login_logout_simple_ui/src/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/src/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/src/constants/textstyle_constants.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_buttons_column.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_character_box.dart';
import 'package:login_logout_simple_ui/src/features/profile/profile_information_box.dart';
import 'package:login_logout_simple_ui/src/features/universal_components/holder.dart';
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
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 500),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: MediaQuery.of(context).size.width / 2,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              const ProfilePageAppBar(),
              SizesConstants.kSizedBox20height,
              const Holder(),
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const ProfileCharacterBox(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.kCharacterName,
                          style: TextStyleConstants.kProfilInfoBoldTextStyle,
                        ),
                        SizesConstants.kSizedBox15height,
                        Text(
                          namingData.name,
                          style: TextStyleConstants.kProfileInfoTextStyle,
                        ),
                        SizesConstants.kSizedBox15height,
                        Text(
                          namingData.surname,
                          style: TextStyleConstants.kProfileInfoTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Holder(),
              ProfileInformationBox(data: data),
              const Holder(),
              SizesConstants.kSizedBox45height,
              const ProfileButtonsColumn(),
            ],
          ),
        ),
      ),
    );
  }
}