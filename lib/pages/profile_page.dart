import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/string_constants.dart';
import 'package:login_logout_simple_ui/pages/choose_your_character_page.dart';
import 'package:login_logout_simple_ui/widgets/shadow_box_container.dart';
import '../constants/sizes_constants.dart';

class MyProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  MyProfilePage({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: PaddingConstants.kBasePadding10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: ShadowBoxContainer(
                  height: SizesConstants.kTopBarTitleHeight,
                  width: SizesConstants.kTopBarTitleWidth,
                  child: Center(
                    child: Text(
                      user.email.toString(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: ColorConstatns.kDarkGreyIcon,
                      ),
                    ),
                  ),
                ),
              ),
              ShadowBoxContainer(
                height: SizesConstants.kBottomNavigatiorHeight,
                width: SizesConstants.kBottomNavigatiorWidth,
                child: IconButton(
                  onPressed: signUserOut,
                  icon: Icon(
                    IconsConstants.kProfileLogOutIcon,
                    size: SizesConstants.kTopNavigationBarIconSize,
                    color: ColorConstatns.kDarkGreyIcon,
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              ShadowBoxContainer(
                height: SizesConstants.kBottomNavigatiorHeight,
                width: SizesConstants.kBottomNavigatiorWidth,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext cotext) =>
                            const ChooseYourCharacterPage(),
                      ),
                    );
                  },
                  icon: Icon(
                    IconsConstants.kProfileLogOutIcon,
                    size: SizesConstants.kTopNavigationBarIconSize,
                    color: ColorConstatns.kDarkGreyIcon,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
