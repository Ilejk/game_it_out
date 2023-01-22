import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/images_constants.dart';
import 'package:login_logout_simple_ui/constants/padding_constants.dart';
import 'package:login_logout_simple_ui/constants/sizes_constants.dart';
import 'package:login_logout_simple_ui/constants/string_constants.dart';
import 'package:login_logout_simple_ui/services/auth_service.dart';
import 'package:login_logout_simple_ui/widgets/sign_in_button.dart';
import 'package:login_logout_simple_ui/widgets/input_textfield.dart';
import 'package:login_logout_simple_ui/widgets/square_title_button_logo.dart';

import '../widgets/shadow_box_container.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  void signUerUp() async {
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
      if (passwordTextController.text == confirmPasswordTextController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text,
        );
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text(StringConstants.kPasswordsDontMatch),
              );
            });
      }
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
      backgroundColor:
          ColorConstatns.kLogInOrRegisterBackgroundColorLightGrey300,
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
                  StringConstants.kWelcomeTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizesConstants.kTitleTextFontSize,
                  ),
                ),
                SizesConstants.kSizedBox15height,
                Text(
                  StringConstants.kLetsCreateAnAccountForYou,
                  style: TextStyle(
                    fontSize: SizesConstants.kSubTextFontSize,
                    letterSpacing: 1,
                    color: ColorConstatns.kSubTextLightGrey500,
                    fontWeight: FontWeight.bold,
                  ),
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
                InputTextFieldWidget(
                  controller: confirmPasswordTextController,
                  hintText: StringConstants.kConfirmPassword,
                  obscureText: true,
                ),
                SizesConstants.kSizedBox20height,
                Padding(
                  padding: PaddingConstants.kLeftRightPadding25,
                  child: GestureDetector(
                    onTap: signUerUp,
                    child: const SignInButton(
                      title: StringConstants.kSignUp,
                    ),
                  ),
                ),
                SizesConstants.kSizedBox45height,
                Text(
                  StringConstants.kOrContinueWith,
                  style: TextStyle(
                    color: ColorConstatns.kSubTextLightGrey500,
                    fontWeight: FontWeight.bold,
                    fontSize: SizesConstants.kSubTextFontSize,
                  ),
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
                        //TODO: add register in with apple
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
                      StringConstants.kAlreadyHaveAnAccount,
                      style: TextStyle(
                        fontSize: SizesConstants.kSubTextFontSize,
                        color: ColorConstatns.kBlack,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    SizesConstants.kSizedBox15width,
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        StringConstants.kSignInNow,
                        style: TextStyle(
                          fontSize: SizesConstants.kSubTextFontSize,
                          color: ColorConstatns.kLightPurpleText,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
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
