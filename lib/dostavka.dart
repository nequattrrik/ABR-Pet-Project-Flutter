import 'package:flutter/material.dart';

class Dostavka extends StatefulWidget {
  const Dostavka({super.key});

  @override
  State<Dostavka> createState() {
    return _DostavkaState();
  }
}

class _DostavkaState extends State<Dostavka> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 450,
              width: double.infinity,
              color: Colors.grey,
              alignment: Alignment.center,
              child: const Text(
                'Карта',
                style: TextStyle(
                  fontSize: 25, 
                  color: Colors.white,
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Укажите адрес доставки',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Введите адрес',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Квартира, подъезд, домофон',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Сохранить',
                      style: TextStyle(
                        color: Colors.black, 
                        fontSize: 18,
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
