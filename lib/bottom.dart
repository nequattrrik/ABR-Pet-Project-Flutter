// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomBar extends StatefulWidget {
  final void Function(int val) onChange;
  const BottomBar({
    required this.onChange,
    super.key,
  });

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black.withOpacity(0.8),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.6),
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          widget.onChange(index);
          _selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book),
          label: 'Рестораны',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.qrcode_viewfinder),
          label: 'abr QR',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bolt),
          label: 'Действия',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          label: 'Профиль',
        ),
      ],
    );
  }
}
