import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(4, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // **Favorite Icon**
          Positioned(
            top: 8,
            left: 8,
            child: Icon(Icons.favorite_border, color: Colors.black),
          ),

          // **Product Image**
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: Image.asset(
              "assets/products_icon/baby_suit.png",
              height: screenHeight * 0.12,
              fit: BoxFit.contain,
            ),
          ),

          // **Product Details**
          Positioned(
            bottom: 10,
            child: Column(
              children: [
                Text("Best Seller",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                Text("Baby Suit", style: TextStyle(fontSize: 14)),
                Text(
                  "254.89 KD",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
          ),

          // **Add to Cart Button**
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 85, 14),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
