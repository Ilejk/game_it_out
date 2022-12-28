import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/pages/my_profile_page.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // home icon button
          IconButton(
            onPressed: () {
              // go to home feed page
            },
            icon: const Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
          ),
          // explore icon button
          IconButton(
            onPressed: () {
              // go to explore page
            },
            icon: const Icon(
              Icons.search_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
          // reels icon button
          IconButton(
            onPressed: () {
              // go to reels page
            },
            icon: const Icon(
              Icons.slow_motion_video_sharp,
              size: 30,
              color: Colors.white,
            ),
          ),
          // shop icon button
          IconButton(
            onPressed: () {
              // go to shop page
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          // my profile button with profile picture circular
          GestureDetector(
            onTap: () {
              // go to my profile page
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MyProfilePage(),
                ),
              );
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset('images/gg.png'),
            ),
          ),
        ],
      ),
    );
  }
}
