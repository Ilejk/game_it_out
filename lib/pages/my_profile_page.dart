import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

// sign user out method
  void signUserOut() {

      FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    user.email.toString(),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {
                    // add new post
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 27,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed:signUserOut,
                  icon: const Icon(
                    Icons.menu,
                    size: 27,
                    color: Colors.white,
                  ),
                ),
              ],
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
