import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() {
    return _NotificationsState();
  }
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Align(
          alignment: Alignment.center,
          child: Text('Уведомления',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        ),
      ),
    );
  }
}