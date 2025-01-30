import 'package:e_comm/core/app_color.dart';
import 'package:e_comm/modules/home/components/product_card.dart';
import 'package:e_comm/modules/home/home_page.dart';
import 'package:e_comm/modules/my_cart/address_page.dart';
import 'package:flutter/material.dart';

import '../search/search_page.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Baby Clothes"),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => MyCartPage()));
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCartWidget(),
          Divider(),
          MyCartWidget(),
          Divider(),
          MyCartWidget(),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
            child: Column(
              children: [
                Text(
                  "You may also like",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ],
            ),
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: screenWidth / (screenHeight * 0.55),
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return ProductCard(screenHeight: screenHeight);
              },
            ),
          ),
          Container(
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
            // height: 120,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Cost",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "1690.9",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddressPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColor.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Checkout",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),

              ///
            ),
          )
        ],
      ),
    );
  }
}

class MyCartWidget extends StatelessWidget {
  const MyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            width: 80,
            child: Image.asset("assets/products_icon/dress-2.png"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 40,
            children: [
              Text(
                "Baby Suite",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text("64.95 KD"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 20,
            children: [
              //close
              Icon(Icons.close),
              // item count
              ItemCountButton()
            ],
          )
        ],
      ),
    );
  }
}

class ItemCountButton extends StatefulWidget {
  const ItemCountButton({super.key});

  @override
  State<ItemCountButton> createState() => _ItemCountButtonState();
}

class _ItemCountButtonState extends State<ItemCountButton> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (itemCount > 1) {
                  itemCount--;
                }
              });
            },
            icon: Icon(Icons.remove),
          ),
          Text(
            "$itemCount",
            style: TextStyle(fontSize: 20),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                itemCount++;
              });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
