// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

class FinalPage extends StatefulWidget {
  final int guestCount;
  final DateTime selectedDate;
  final String selectedTimeSlot;

  const FinalPage({
    super.key,
    required this.guestCount,
    required this.selectedDate,
    required this.selectedTimeSlot,
  });

  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  Future<void> _sendReservation() async {
    String formattedDate =
        "${widget.selectedDate.year}-${widget.selectedDate.month}-${widget.selectedDate.day}";
    String formattedTime = widget.selectedTimeSlot;

    Map<String, dynamic> data = {
      "Number of guests": widget.guestCount.toString(),
      "Booking Date": formattedDate,
      "Booking Time": formattedTime,
      "Name": nameController.text,
      "Number": numberController.text,
    };

    try {
      final resp = await Dio().post(
        'https://b4b6-109-239-38-86.ngrok-free.app/tableCreate',
        data: data,
      );
      log(resp.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text('Введите имя и номер для брони',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              const SizedBox(height: 15),
              const Text('Так в ресторане будут знать, за кем нужно закрепить бронирование.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
              ),
              const SizedBox(height: 26),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Имя',
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Номер телефона',
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), 
                  backgroundColor: Colors.white,
                ),
                onPressed: _sendReservation,
                child: const Text('Сохранить и продолжить',
                style: TextStyle(
                  color: Colors.black,
                ),
                ),
              ),
            ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }
}
