import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/constants/color_constants.dart';
import 'package:login_logout_simple_ui/constants/images_constants.dart';
import 'package:login_logout_simple_ui/constants/string_constants.dart';
import 'package:login_logout_simple_ui/services/auth_service.dart';
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
              color: ColorConstatns.kPurpleProgressIndicator,
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
      backgroundColor:
          ColorConstatns.kLogInOrRegisterBackgroundColorLightGrey300,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 175,
                  width: 175,
                  child: Image.asset(
                    ImagesConstants.kMainLogo,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  StringConstants.kHelloAgain,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  StringConstants.kWelcomeBack,
                  style: TextStyle(
                    fontSize: 13,
                    letterSpacing: 1,
                    color: ColorConstatns.kSubTextLightGrey500,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: GestureDetector(
                    onTap: signUerIn,
                    child: const SignInButton(
                      title: StringConstants.kSignIn,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  StringConstants.kOrContinueWith,
                  style: TextStyle(
                    color: ColorConstatns.kSubTextLightGrey500,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTileButtonLogo(
                      onTap: () {
                        AuthService().signInWithGoogle();
                      },
                      imageId: ImagesConstants.kGoogleLogo,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SquareTileButtonLogo(
                      onTap: () {},
                      imageId: ImagesConstants.kAppleLogo,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConstants.kNotAMember,
                      style: TextStyle(
                        fontSize: 13,
                        color: ColorConstatns.kBlackColorText,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        StringConstants.kRegisterNow,
                        style: TextStyle(
                          fontSize: 13,
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
