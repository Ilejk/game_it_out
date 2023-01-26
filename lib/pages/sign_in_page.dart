import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/images_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/constants/string_constants.dart';
import 'package:login_logout_simple_ui/constants/textstyle_constants.dart';
import 'package:login_logout_simple_ui/services/auth_service.dart';
import 'package:login_logout_simple_ui/widgets/shadow_box_container.dart';
import 'package:login_logout_simple_ui/widgets/sign_in_button.dart';
import 'package:login_logout_simple_ui/widgets/input_textfield.dart';
import 'package:login_logout_simple_ui/widgets/square_title_button_logo.dart';

class SignInPage extends StatefulWidget {
  final Function()? onTap;

  const SignInPage({super.key, required this.onTap});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  void signUerIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorConstatns.kPurple,
            ),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text(StringConstants.kUserNotFound),
              );
            });
      } else if (e.code == 'wrong-password') {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text(StringConstants.kWrongPassword),
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstatns.kBackGroundGrey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShadowBoxContainer(
                  height: SizesConstants.kMainLogoHeight,
                  width: SizesConstants.kMainLogoWidth,
                  child: Image.asset(
                    ImagesConstants.kGameItOutLogo,
                  ),
                ),
                SizesConstants.kSizedBox20height,
                const Text(
                  StringConstants.kHelloAgain,
                  style: TextStyleConstants.kSignInRegisterTitleTextStyle,
                ),
                SizesConstants.kSizedBox15height,
                Text(
                  StringConstants.kWelcomeBack,
                  style: TextStyleConstants.kSubTitleTextStyle,
                ),
                SizesConstants.kSizedBox20height,
                InputTextFieldWidget(
                  controller: emailTextController,
                  hintText: StringConstants.kEmail,
                  obscureText: false,
                ),
                InputTextFieldWidget(
                  controller: passwordTextController,
                  hintText: StringConstants.kPassword,
                  obscureText: true,
                ),
                SizesConstants.kSizedBox20height,
                Padding(
                  padding: PaddingConstants.kLeftRightPadding25,
                  child: GestureDetector(
                    onTap: signUerIn,
                    child: const SignInButton(
                      title: StringConstants.kSignIn,
                    ),
                  ),
                ),
                SizesConstants.kSizedBox45height,
                Text(
                  StringConstants.kOrContinueWith,
                  style: TextStyleConstants.kSubTextTextStyleGrey,
                ),
                SizesConstants.kSizedBox45height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTileButtonLogo(
                      onTap: () {
                        AuthService().signInWithGoogle();
                      },
                      imageId: ImagesConstants.kGoogleLogo,
                    ),
                    SizesConstants.kSizedBox20width,
                    SquareTileButtonLogo(
                      onTap: () {
                        //TODO: add log in with apple
                      },
                      imageId: ImagesConstants.kAppleLogo,
                    ),
                  ],
                ),
                SizesConstants.kSizedBox35height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConstants.kNotAMember,
                      style: TextStyleConstants.kSubTextTextStyleBlack,
                    ),
                    SizesConstants.kSizedBox15width,
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        StringConstants.kRegisterNow,
                        style: TextStyleConstants.kSubTextTextStylePurple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}