import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
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
                  height: SizesConstants.kBottomNavigatiorHeight,
                  width: SizesConstants.kBottomNavigatiorWidth,
                  child: IconButton(
                    onPressed: () {
                      //TODO : do sth
                    },
                    icon: Icon(
                      IconsConstants.kProfileLogOutIcon,
                      size: SizesConstants.kTopNavigationBarIconSize,
                      color: ColorConstatns.kDarkGrey,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: PaddingConstants.kBasePadding10,
                  child: Center(
                    child: Text(
                      user.email.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: ColorConstatns.kDarkGrey,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: PaddingConstants.kBasePadding10,
                child: ShadowBoxContainer(
                  height: SizesConstants.kBottomNavigatiorHeight,
                  width: SizesConstants.kBottomNavigatiorWidth,
                  child: IconButton(
                    onPressed: signUserOut,
                    icon: Icon(
                      IconsConstants.kProfileLogOutIcon,
                      size: SizesConstants.kTopNavigationBarIconSize,
                      color: ColorConstatns.kDarkGrey,
                    ),
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
                    color: ColorConstatns.kDarkGrey,
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
