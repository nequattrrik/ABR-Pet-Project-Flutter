import 'package:abr_app/booking/guests_num.dart';
import 'package:abr_app/dostavka.dart';
import 'package:abr_app/size_tap_animation.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  final List<String> images = [
    'https://n1s1.hsmedia.ru/24/a9/51/24a951f47dfa422d5551d525b6c26ac1/1200x629_0xac120003_2788271691642801761.jpeg',
    'https://culinaryschool.ru/wp-content/uploads/2016/07/10.-%D0%A1%D1%83-%D1%88%D0%B5%D1%84-%D0%BF%D0%BE%D0%B2%D0%B0%D1%80-600x400.jpg',
    'https://vkusnogram.ru/upload/iblock/8c7/IMG_1615.jpg',
    'https://static-cdn4-2.vigbo.tech/u39676/56614/blog/4707935/3744725/47997761/1000-3b8eaa79a4188afaed822a43311c4629.jpg',
  ];

  final List<String> deliveryOffersImages = [
    'https://restolife.kz/upload/information_system_6/5/0/8/item_5080/information_items_property_17200.jpg',
    'https://sxodim.com/uploads/posts/2022/08/10/optimized/9c167d1d737036bae4372769505d3533_1400x790-q-85.jpg',
    'https://restolife.kz/upload/information_system_6/2/4/4/item_24414/small_information_items_property_30907.jpg',
    'https://restolife.kz/upload/information_system_6/2/2/5/item_22585/information_items_property_26245.jpg',
    'https://wikicity.kz/fotos_ms/Company_31279_kdwvCcrASoUHb5A4xmwxtkOC.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              const Expanded(
                child: Text(
                  'Укажите адрес доставки',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 47, 47, 47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Бонусы',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              height: 350,
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SizeTapAnimation(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GuestNumPage(),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.network(
                              images[index],
                              fit: BoxFit.cover,
                              height: 350,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.8),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.all(9),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Весеннее обновление в огоньке",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    height: 22,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 100, 100, 100),
                                    ),
                                    child: const Text(
                                      'Забронировать стол',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Dostavka(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 32, 32, 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.delivery_dining,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Доставка',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GuestNumPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 32, 32, 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Бронирование',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text(
                'Предложения на доставку',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Dostavka(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_circle_right_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: deliveryOffersImages.length,
              itemBuilder: (BuildContext context, int index) {
                return SizeTapAnimation(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Dostavka(),
                      ),
                    );
                  },
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        deliveryOffersImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Text(
                'Доставка из ресторанов abr',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: deliveryOffersImages.length,
              itemBuilder: (BuildContext context, int index) {
                return SizeTapAnimation(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Dostavka(),
                      ),
                    );
                  },
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(9.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        deliveryOffersImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text(
                'Магазины партнёры',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Dostavka(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_circle_right_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: deliveryOffersImages.length,
              itemBuilder: (BuildContext context, int index) {
                return SizeTapAnimation(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Dostavka(),
                      ),
                    );
                  },
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        deliveryOffersImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const BottomBar(),
    );
  }
}
