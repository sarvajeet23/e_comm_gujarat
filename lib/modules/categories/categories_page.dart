import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  final List<Widget> categories = [
    CategoriesCard(
      image: "assets/products_icon/baby_boy.png",
      label: "Baby Boy",
    ),
    CategoriesCard(
      image: "assets/products_icon/baby_girl.png",
      label: "Baby Girl",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: categories[index % categories.length],
          );
        },
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  final String? image;
  final String? label;
  const CategoriesCard({super.key, this.image, this.label});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        image ?? '',
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      Positioned(
        top: 80,
        bottom: 50,
        left: 35,
        child: Text(
          label ?? "",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
