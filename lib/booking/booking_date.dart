// ignore_for_file: library_private_types_in_public_api

import 'package:abr_app/booking/booking_time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BookingDatePage extends StatefulWidget {
  final int guestCount;

  const BookingDatePage({
    super.key, 
    required this.guestCount,
    });

  @override
  _BookingDatePageState createState() => _BookingDatePageState();
}

class _BookingDatePageState extends State<BookingDatePage> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    initializeDateFormatting('ru_RU', null);
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final tomorrow = DateTime.now().add(const Duration(days: 1));

    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return 'Сегодня, ${DateFormat('d MMM', 'ru_RU').format(date)}';
    } else if (date.year == tomorrow.year && date.month == tomorrow.month && date.day == tomorrow.day) {
      return 'Завтра, ${DateFormat('d MMM', 'ru_RU').format(date)}';
    } else {
      return DateFormat('EEEE, d MMM', 'ru_RU').format(date);
    }
  }

  Widget _buildDateButton(DateTime date) {
    String dateText = _formatDate(date);
    bool isSelected = selectedDate.day == date.day && selectedDate.month == date.month && selectedDate.year == date.year;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = date;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          dateText,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
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
              alignment: Alignment.bottomLeft,
              child: Text(
                'Дата бронирования',
                style: TextStyle(
                  fontSize: 24, 
                  color: Colors.white,
                  ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  30,
                  (index) => _buildDateButton(DateTime.now().add(Duration(days: index))),
                ),
              ),
            ),
          ),
          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), 
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
                    builder: (context) => BookingTimePage(
                      guestCount: widget.guestCount,
                      selectedDate: selectedDate,
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
