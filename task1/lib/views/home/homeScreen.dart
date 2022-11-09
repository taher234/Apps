import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/controllers/controller.dart';

import 'shop/shop.dart';

class homeScreen extends StatelessWidget {
  List pages = [shop(), shop(), shop(), shop(), shop()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[context.watch<control>().currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => context.read<control>().changePages(value),
        currentIndex: context.watch<control>().currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'shop'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
