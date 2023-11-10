import 'package:delivery/pages/cart/cart_history.dart';
import 'package:delivery/pages/home/main_food_page.dart';
import 'package:delivery/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainFoodPage(),
    Container(
      child: Center(
        child: Text('Next page'),
      ),
    ),
    CartHistory(),
    Container(
      child: Center(
        child: Text('Next next next page'),
      ),
    ),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amberAccent,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          // selectedFontSize: 0.0,
          // unselectedFontSize: 0.0,
          currentIndex: _selectedIndex,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Me'),
          ]),
    );
  }
}
//u can either go for persistent_bottom_nav_bar: ^5.0.2 pub.dev
