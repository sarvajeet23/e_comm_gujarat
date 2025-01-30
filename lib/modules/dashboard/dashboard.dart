import 'package:e_comm/modules/categories/categories_page.dart';
import 'package:e_comm/modules/my_cart/my_cart_page.dart';
import 'package:e_comm/modules/search/search_page.dart';
import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../favourite/favourite_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  List<Widget> pages = [
    HomePage(),
    CategoriesPage(),
    FavouritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Baby Clothes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyCartPage()));
              },
              icon: Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primary,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                label: "Categories",
                icon: Icon(Icons.category_outlined),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
