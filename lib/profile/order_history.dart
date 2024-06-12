import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() {
    return _OrderHistoryState();
  }
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Align(
          alignment: Alignment.center,
          child: Text('История заказов',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        ),
      ),
    );
  }
}