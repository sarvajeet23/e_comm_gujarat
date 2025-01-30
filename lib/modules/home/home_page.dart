import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm/core/app_color.dart';
import 'package:e_comm/modules/home/components/product_card.dart';
import 'package:e_comm/modules/home/detailes_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<String> images = [
    "https://images.unsplash.com/photo-1500375592092-40eb2168fd21?q=80&w=1888&auto=format&fit=crop",
    "https://images.unsplash.com/photo-1530845645774-eed359045642?q=80&w=1935&auto=format&fit=crop",
    "https://images.unsplash.com/photo-1510154221590-ff63e90a136f?q=80&w=2070&auto=format&fit=crop",
  ];
//categories
  final List<Widget> categories = [
    CatergoriesButton(
        lable: "Baby Clothes", image: "assets/products_icon/Ellipse-1.png"),
    CatergoriesButton(
        lable: "Baby Cream", image: "assets/products_icon/Ellipse-4.png"),
    CatergoriesButton(
        lable: "Baby Shoes", image: "assets/products_icon/Ellipse.png"),
    CatergoriesButton(
        lable: "Mom Clothes", image: "assets/products_icon/Ellipse-3.png"),
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // **Carousel Slider**
            CarouselSlider(
              items: images
                  .map((image) => Image.network(
                        image,
                        width: screenWidth,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                height: screenHeight * 0.25,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 10),

            // **Dot Indicator for Slider**
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                int idx = entry.key;
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: _currentIndex == idx ? 20 : 10,
                  decoration: BoxDecoration(
                    color:
                        _currentIndex == idx ? Colors.blueAccent : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10),

            // **Categories Section**
            Container(
              width: screenWidth,
              color: AppColor.primary,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return Container();
                      // }));
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: Text("See all"),
                  ),
                ],
              ),
            ),
            //categories with label
            Container(
              decoration: BoxDecoration(color: AppColor.iceColors),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    categories.length,
                    (index) => Expanded(child: categories[index]),
                  ),
                ),
              ),
            ),

            // **Featured Products Header**
            Container(
              width: screenWidth,
              color: AppColor.primary,
              padding: EdgeInsets.all(16),
              child: Text(
                "Featured Products",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),

            // **Featured Products Grid**
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailesPage()));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: screenWidth / (screenHeight * 0.55),
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return ProductCard(screenHeight: screenHeight);
                      },
                    ),
                    // pic
                    Image.asset(
                      "assets/products_icon/dress.png",
                      fit: BoxFit.fill,
                    ),

                    // Brand
                    Text(
                      "Brand",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    BrandCard(),
                    Text(
                      "Featured Products",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: screenWidth / (screenHeight * 0.55),
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailesPage()));
                            },
                            child: ProductCard(screenHeight: screenHeight));
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class BrandCard extends StatelessWidget {
  List<String> brand = [
    "assets/products_icon/brabd-1.png",
    "assets/products_icon/brand-2.png",
    "assets/products_icon/brand-3.png",
    "assets/products_icon/brand-4.png"
  ];
  BrandCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            brand.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(brand[index]),
                )),
      ),
    );
  }
}

class CatergoriesButton extends StatelessWidget {
  final String? lable;
  final String? image;
  const CatergoriesButton({super.key, this.image, this.lable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: Image.asset(image ?? ""),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              lable ?? "",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
//
