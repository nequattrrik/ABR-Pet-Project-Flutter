import 'package:flutter/material.dart';

class FriendInvite extends StatelessWidget {
  const FriendInvite({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Align(
          alignment: Alignment.center,
          child: Text('Пригласить друга',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        ),
      ),
    );
  }
}