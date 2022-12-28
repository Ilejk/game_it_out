import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/widgets/ig_fake_roll.dart';
import 'package:login_logout_simple_ui/widgets/my_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

// sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 135,
                    height: 55,
                    child: Image(
                      image: AssetImage('images/ig.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {
                      // add a new post
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 27,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // see who likes ur photos
                    },
                    icon: const Icon(
                      Icons.favorite_border_sharp,
                      size: 27,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // send sb a message
                    },
                    icon: const Icon(
                      Icons.send,
                      size: 27,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: signUserOut,
                    icon: const Icon(
                      Icons.logout,
                      size: 27,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    // scrollable row with circlevatars stories
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          IgFakeRoll(),
                          IgFakeRoll(),
                          IgFakeRoll(),
                          IgFakeRoll(),
                          IgFakeRoll(),
                          IgFakeRoll(),
                          IgFakeRoll(),
                          IgFakeRoll(),
                          IgFakeRoll(),
                        ],
                      ),
                    ),
                    // scrollable feed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


