import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as dev;

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() {
    return _RestaurantsPageState();
  }
}

class _RestaurantsPageState extends State<RestaurantsPage> {

List showData = [];

  @override
  void initState() {
    super.initState();
    getalldata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Все рестораны',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Text(showData[index].toString()),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: showData.length,
      ),
      
    );
  }
  void getalldata() async {
    final resp =
        await Dio().get('https://1bcd-62-84-56-13.ngrok-free.app/getRest');
    dev.log(resp.data.toString());
    showData = resp.data;
    setState(() {
      
    });
  }
}