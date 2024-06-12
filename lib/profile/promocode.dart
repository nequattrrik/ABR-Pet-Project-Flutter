import 'package:flutter/material.dart';

class Promocode extends StatefulWidget {
  const Promocode({super.key});

  @override
  State<Promocode> createState() {
    return _Promocode();
  }
}

class _Promocode extends State<Promocode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Align(
          alignment: Alignment.center,
          child: Text('Промокод',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        ),
      ),
    );
  }
}