import 'package:abr_app/actions.dart';
import 'package:abr_app/bottom.dart';
import 'package:abr_app/main_page.dart';
import 'package:abr_app/profile/profile_main.dart';
import 'package:abr_app/qr.dart';
import 'package:abr_app/restaurants.dart';
import 'package:flutter/material.dart';

class StackWrapper extends StatefulWidget {
  const StackWrapper({super.key});

  @override
  State<StackWrapper> createState() => _StackWrapperState();
}

class _StackWrapperState extends State<StackWrapper> {
  int indexValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: IndexedStack(
            index: indexValue,
            children: [
              MainPage(),
              RestaurantsPage(),
              QrPage(),
              ActionsPage(),
              ProfileMainPage(),
            ],
          ),
        ),
        BottomBar(
          onChange: (val){
              setState(() {
                indexValue = val;
              });
          },
        )
      ],
    );
  }
}
