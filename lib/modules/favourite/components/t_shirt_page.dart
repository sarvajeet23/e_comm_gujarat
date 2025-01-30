import 'package:flutter/material.dart';

class TShirtPage extends StatelessWidget {
  const TShirtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("T-Shirt Page"));
  }
}







/*
GridView.builder(
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
        ),
*/