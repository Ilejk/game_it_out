import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/services/auth_service.dart';
import 'package:login_logout_simple_ui/widgets/my_button.dart';
import 'package:login_logout_simple_ui/widgets/my_textfield_widget.dart';
import 'package:login_logout_simple_ui/widgets/square_title_button.dart';

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
    // show circle

    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
            ),
          );
        });
    // try sign up user
    try {
      // check if password and confirmed password is the same
      if (passwordTextController.text == confirmPasswordTextController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text,
        );
      }
      else {
        // show error message, password don't match...
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('PASSWORDS DON\'T MATCH!'),
              );
            });

      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('USER NOT FOUND!'),
              );
            });
      } else if (e.code == 'wrong-password') {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('WRONG PASSWORD!'),
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 175,
                  width: 175,
                  child: Image.asset('images/pngwing.com.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Let\'s create an account for you!',
                  style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 1,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextFieldWidget(
                    controller: emailTextController,
                    hintText: 'Email',
                    obscureText: false),
                MyTextFieldWidget(
                    controller: passwordTextController,
                    hintText: 'Password',
                    obscureText: true),
                MyTextFieldWidget(
                    controller: confirmPasswordTextController,
                    hintText: 'Confirm Password',
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: GestureDetector(
                    onTap: signUerUp,
                    child: const MyButton(
                      title: 'Sign Up!',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  'Or continue with',
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                const SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTileButton(onTap: (){
                      // sign up with google
                      AuthService().signInWithGoogle();
                    }, imageId: 'images/GOOG.png'),
                    const SizedBox(
                      width: 20,
                    ),
                    SquareTileButton(onTap: () {
                      // add sign up with apple
                    }, imageId: 'images/apple.png'),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
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
                        'Sign In now',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.purpleAccent,
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
