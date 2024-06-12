import 'package:flutter/material.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});
  
  
  @override
  State<QrPage> createState() {
    return _QrPageState();
  }
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      // bottomNavigationBar: BottomBar(),
    );
  }
}