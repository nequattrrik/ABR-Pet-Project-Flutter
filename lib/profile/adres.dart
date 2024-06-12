import 'package:abr_app/dostavka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Adres extends StatefulWidget {
  const Adres({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AdresState();
  }
}

class _AdresState extends State<Adres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Мои адреса',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                CupertinoIcons.location_solid,
                color: Colors.white,
                size: 45,
              ),
              const SizedBox(height: 20),
              const Text(
                'Здесь будут все сохраненные адреса',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const Dostavka(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.white.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                ),
                child: const Text(
                  'Добавить новый адрес',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}