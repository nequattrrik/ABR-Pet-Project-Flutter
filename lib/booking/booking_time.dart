// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'name.dart';

class BookingTimePage extends StatefulWidget {
  final int guestCount;
  final DateTime selectedDate;

  const BookingTimePage({
    super.key,
    required this.guestCount,
    required this.selectedDate,
  });

  @override
  _BookingTimePageState createState() => _BookingTimePageState();
}

class _BookingTimePageState extends State<BookingTimePage> {
  String selectedTimeSlot = '12:00';

  Widget _buildTimeSlotButton(String time) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeSlot = time;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: selectedTimeSlot == time ? Colors.white : Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: selectedTimeSlot == time ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Время',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 65,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  '12:00',
                  '12:30',
                  '13:00',
                  '13:30',
                  '14:00',
                  '14:30',
                  '15:00',
                  '15:30',
                  '16:00',
                ].map((time) => _buildTimeSlotButton(time)).toList(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Ждём вас 15 минут. Пожалуйста, приходите вовремя. Время посещения ограничено: 2 часа.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  50,
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'Продолжить',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FinalPage(
                      guestCount: widget.guestCount,
                      selectedDate: widget.selectedDate,
                      selectedTimeSlot: selectedTimeSlot,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
