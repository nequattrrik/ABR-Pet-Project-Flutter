import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethod();
}

class _PaymentMethod extends State<PaymentMethod> {

  void _showApplePayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      builder: (BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 33, 33, 33),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 16, left: 24, right: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(CupertinoIcons.creditcard, size: 16, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Apple Pay',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Бесконтактный способ оплаты',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: const Color.fromARGB(255, 78, 77, 77),
                  shape: const StadiumBorder(),
                  minimumSize: const Size(double.infinity, 44),
                ),
                child: const Text('Закрыть',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Align(
          alignment: Alignment.center,
          child: Text('Способы оплаты',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('Карты',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 62, 62, 62),
                  ),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(CupertinoIcons.plus, color: Colors.white),
                      Text('Добавить',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Text('Здесь будут все сохраненные кредитные и дебетовые карты.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Другие способы оплаты',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildOptionItem(CupertinoIcons.creditcard, 'Apple Pay', () {
            _showApplePayBottomSheet(context);
          }),
        ],
      ),
    );
  }

  Widget _buildOptionItem(
      IconData icon, String title, VoidCallback onTap) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(2),
          ),
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.white,
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: const Icon(
              CupertinoIcons.chevron_forward,
              color: Colors.white,
            ),
            onTap: onTap,
          ),
        ),
      );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PaymentMethod(),
    debugShowCheckedModeBanner: false,
  ));
}
