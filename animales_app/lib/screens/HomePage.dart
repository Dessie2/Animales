import 'package:flutter/material.dart';
import 'package:animales_app/models/cart.dart';
import 'package:animales_app/tab/cat_tab.dart';
import 'package:animales_app/tab/bird_tab.dart';
import 'package:animales_app/tab/monkey_tab.dart';
import 'package:animales_app/tab/cattle_tab.dart';
import 'package:animales_app/tab/rabbit_tab.dart';
import 'package:animales_app/utils/my_tab.dart';
import 'package:animales_app/pages/cart_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/cat.png', label: 'Gatos'),
    const MyTab(iconPath: 'lib/icons/bird.png', label: 'Pájaros'),
    const MyTab(iconPath: 'lib/icons/monkey.png', label: 'Monos'),
    const MyTab(iconPath: 'lib/icons/cattle.png', label: 'Reses'),
    const MyTab(iconPath: 'lib/icons/rabbit.png', label: 'Conejos'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey[800]),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text('Quiero  ', style: TextStyle(fontSize: 24)),
                  Text(
                    'Adoptar',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              tabs: myTabs,
              onTap: (_) {
                setState(() {});
              },
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CatTab(),
                  BirdTab(),
                  MonkeyTab(),
                  CattleTab(),
                  RabbitTab(),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${Cart.itemCount} Animales | \$${Cart.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Gastos de adopción incluidos',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartPage()),
                      ).then((_) => setState(() {}));
                    },
                    child: const Text(
                      'Ver Carrito',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
