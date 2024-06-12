import 'package:abr_app/main_page.dart';
import 'package:abr_app/restaurants.dart';
import 'package:flutter/material.dart';

class ActionsPage extends StatefulWidget {
  const ActionsPage({super.key});

  @override
  State<ActionsPage> createState() {
    return _ActionsPageState();
  }
}

class _ActionsPageState extends State<ActionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Действия',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Заказы',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Все',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 37, 37, 37),
                ),
                height: 120,
                width: 330,
                child: const Column(
                  children: [
                    Text(
                      'Нет активных заказов',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 177, 177, 177),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 65, vertical: 5),
                        child: Text(
                          'Сделайте заказ на доставку. Актуальные заказы будут отображаться здесь',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const MainPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 66, 65, 65),
                  ),
                  child: const Text(
                    'Заказать доставку',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Брони',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 37, 37, 37),
                ),
                height: 120,
                width: 330,
                child: const Column(
                  children: [
                    Text(
                      'Нет бронирований',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 177, 177, 177),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      child: Text(
                        'После бронирования стола здесь появятся актуальные брони',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const RestaurantsPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 66, 65, 65),
                  ),
                  child: const Text(
                    'Добавить бронирование',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // bottomNavigationBar: const BottomBar(),
    );
  }
}
