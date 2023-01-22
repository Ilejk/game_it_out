import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/icons_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/string_constants.dart';
import '../constants/sizes_constants.dart';

class MyProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  MyProfilePage({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstatns.kBlackColorText,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: PaddingConstants.kBasePadding8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: PaddingConstants.kBasePadding8,
                    child: Text(
                      StringConstants.kSignedInAS + user.email.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: ColorConstatns.kWhite,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: signUserOut,
                    icon: const Icon(
                      IconsConstants.kProfileLogOutIcon,
                      size: SizesConstants.kTopNavigationBarIconSize,
                      color: ColorConstatns.kWhite,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(),
            )
          ],
        ),
      ),
    );
  }
}
