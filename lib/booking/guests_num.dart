// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'booking_date.dart';

class GuestNumPage extends StatefulWidget {
  const GuestNumPage({super.key});

  @override
  _GuestNumPageState createState() => _GuestNumPageState();
}

class _GuestNumPageState extends State<GuestNumPage> {
  int guestCount = 1;

  Widget _buildGuestButton(int number) {
    return GestureDetector(
      onTap: () {
        setState(() {
          guestCount = number;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          color: guestCount == number ? Colors.white : Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '$number',
          style: TextStyle(
            color: guestCount == number ? Colors.black : Colors.white,
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
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' Количество гостей',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              5,
              (index) => _buildGuestButton(index + 1),
            ),
          ),
          const SizedBox(height: 40),
          const Text('Позвоните в ресторан, чтобы забронировать стол на большее количество гостей',
          style: TextStyle(
            color: Colors.grey,
          ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), 
                backgroundColor: Colors.white,
              ),
              child: const Text('Продолжить',
              style: TextStyle(
                color: Colors.black,
              ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingDatePage(guestCount: guestCount),
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
