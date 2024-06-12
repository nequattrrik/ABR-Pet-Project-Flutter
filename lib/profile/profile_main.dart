import 'package:abr_app/profile/adres.dart';
import 'package:abr_app/profile/friend_invite.dart';
import 'package:abr_app/profile/notifications.dart';
import 'package:abr_app/profile/order_history.dart';
import 'package:abr_app/profile/payment_method.dart';
import 'package:abr_app/profile/promocode.dart';
import 'package:abr_app/size_tap_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:abr_app/profile/language.dart';

class ProfileMainPage extends StatefulWidget {
  const ProfileMainPage({Key? key}) : super(key: key);

  @override
  State<ProfileMainPage> createState() => _ProfileMainPageState();
}

class _ProfileMainPageState extends State<ProfileMainPage> {

  String _selectedLanguage = 'Русский';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Владислав',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        actions: [
          IconButton(
            icon:
                const Icon(
                  CupertinoIcons.pencil, 
                  color: Colors.white,
                  ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildBonusCard(),
         const SizedBox(height: 20),
          _buildOptionItem(CupertinoIcons.creditcard, 'Способы оплаты', () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => const PaymentMethod(),),);
            }),
          _buildOptionItem(CupertinoIcons.location, 'Мои адреса', () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Adres(),),);
            }),
          _buildOptionItem(CupertinoIcons.time, 'История заказов', () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => const OrderHistory(),),);
            }),
          _buildOptionItem(CupertinoIcons.bell, 'Уведомления', () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Notifications(),),);
            }),
          _buildOptionItem(CupertinoIcons.tag, 'Ввести промокод', () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Promocode(),),);
            }),
          _buildOptionItem(CupertinoIcons.person_add, 'Пригласить друга', () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => const FriendInvite(),),);
            }),
          _buildOptionItem(CupertinoIcons.globe, 'Язык интерфейса', () {
            showLanguageSelectionBottomSheet(context, _selectedLanguage, (String newLanguage) {
              setState(() {
                _selectedLanguage = newLanguage;
              });
            });
          }),
          const SizedBox(height: 20),
          _buildOptionItem(CupertinoIcons.chat_bubble, 'Написать в поддержку', () {}),
          const SizedBox(height: 20),
          _buildOptionItem(CupertinoIcons.info_circle, 'О компании', () {}),
        ],
      ),
      // bottomNavigationBar: const BottomBar(),
    );
  }

  Widget _buildBonusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey.shade800,
            Colors.grey.shade900,
          ],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
        ),
      ),
      child: SizeTapAnimation(
        onTap: () {
          
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 28,
                ),
                const SizedBox(height: 8),
                const Text(
                  '1000 бонусов',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Кэшбек 3% с каждого заказа.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 0,
              right: 0,
                child: Row(
                  children: [
                    Text(
                      'Как накопить',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 24,
                      color: Colors.white,
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem(
    IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
