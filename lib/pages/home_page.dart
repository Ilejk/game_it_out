import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

final user = FirebaseAuth.instance.currentUser!;

// sign user in method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body:  Center(
        child: Text('LOGGED IN AS : ${user.email!}'),
      ),
    );
  }
}
