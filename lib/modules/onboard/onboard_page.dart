import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm/core/app_color.dart';
import 'package:e_comm/modules/auth/singin_page.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatefulWidget {
  OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int _currentIndex = 0;
  List<String> images = [
    "assets/icon/ongoing.png",
    "assets/icon/ongoing.png",
    "assets/icon/ongoing.png"
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 80, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Carousel Slider**
            CarouselSlider(
              items: images.map((image) => Image.asset(image)).toList(),
              options: CarouselOptions(
                autoPlay: true,
                height: screenHeight * 0.5,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),

            SizedBox(height: 60),
            Spacer(),
            Text(
              "Start Journey With ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "Smart, Gorgeous & Fashionable Collection ",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: Colors.black26),
            ),
            Row(
              children: [
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
                        color: _currentIndex == idx
                            ? Colors.blueAccent
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }).toList(),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    foregroundColor: AppColor.whiteColors,
                  ),
                  child: Text("Get Started"),
                )
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
