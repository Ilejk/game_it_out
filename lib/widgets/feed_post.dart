import 'package:flutter/material.dart';

class FeedPost extends StatelessWidget {
  const FeedPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
               SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('images/profilepic.jpg'),
                ),
              ),
              Text(
                'Ilejk',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
              Expanded(child: SizedBox()),
              Icon(
                Icons.more_horiz_outlined,
                color: Colors.white,
                size: 26,
              )
            ],
          ),
          SizedBox(width: double.infinity,height: 500,child: Image.asset('images/gg.png'),),
          Row(
            children: const [
              SizedBox(width: 15,),
              Icon(Icons.favorite_border_sharp,size: 26,color: Colors.white,),
              SizedBox(width: 10,),
              Icon(Icons.chat_bubble_outline_outlined,size: 26,color: Colors.white,),
              SizedBox(width: 10,),
              Icon(Icons.send,size: 26,color: Colors.white,),
              Expanded(child: SizedBox()),
              Icon(Icons.bookmark_border,size: 26,color: Colors.white,),
              SizedBox(width: 15,),
            ],
          ),
        ],
      ),
    );
  }
}
