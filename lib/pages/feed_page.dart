import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/widgets/feed_post.dart';
import 'package:login_logout_simple_ui/widgets/ig_fake_roll.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const TopBarFeedPage(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // scrollable row with circular avatar stories
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
                  const FeedPost(),
                  const FeedPost(),
                  const FeedPost(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBarFeedPage extends StatelessWidget {
  const TopBarFeedPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
      ],
    );
  }
}
