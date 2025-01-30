import 'package:e_comm/core/app_color.dart';
import 'package:e_comm/modules/home/components/product_card.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class DetailesPage extends StatelessWidget {
  const DetailesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image.asset("assets/products_icon/dress-2.png")),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            margin: EdgeInsets.all(16),
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/products_icon/dress-2.png",
                                scale: 5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Setter detail
                  Text(
                    "BEST SELLER",
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    "Baby suit",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  Text(
                    "967.800 KD",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ExpansionTile(
                      expandedAlignment: Alignment.centerLeft,
                      title: Text("Product Details"),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [Text("Select : "), SizeSelector()],
                  ),
                  Row(
                    children: [Text("Colour : "), ColorSelector()],
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "You may also like",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio:
                                screenWidth / (screenHeight * 0.55),
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return ProductCard(screenHeight: screenHeight);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, -2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class ColorSelector extends StatefulWidget {
  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  // Declare a variable to hold the selected color
  String? selectedColor = 'red';

  // List of color options with corresponding color values
  final Map<String, Color> colorOptions = {
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        DropdownButton<String>(
          value: selectedColor,
          onChanged: (String? newValue) {
            setState(() {
              selectedColor = newValue;
            });
          },
          items: colorOptions.keys
              .map<DropdownMenuItem<String>>((String colorName) {
            return DropdownMenuItem<String>(
              value: colorName,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: colorOptions[colorName],
                  ),
                  SizedBox(width: 10),
                  Text(colorName),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class SizeSelector extends StatefulWidget {
  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  // Declare a variable to hold the selected value
  String? selectedSize = 'small';

  final List<String> sizes = ['small', 'medium', 'large'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        DropdownButton<String>(
          value: selectedSize,
          onChanged: (String? newValue) {
            setState(() {
              selectedSize = newValue;
            });
          },
          items: sizes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
