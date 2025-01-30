import 'package:e_comm/modules/home/components/product_card.dart';
import 'package:flutter/material.dart';

class ShoesPage extends StatelessWidget {
  const ShoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: screenWidth / (screenHeight * 0.55),
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ProductCard(screenHeight: screenHeight);
      },
    );
  }
}
