import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 128, 229, 217),
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Text(
                          "Search",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                // search field
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search Your Shoes",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),

                Text("Clothes", style: TextStyle(fontSize: 24)),
                IconWithLable(
                  iconData: Icon(
                    Icons.watch_later_outlined,
                    color: Colors.black26,
                  ),
                  label: "Rompers",
                ),
                IconWithLable(
                  label: "Baby suit",
                  iconData: Icon(
                    Icons.watch_later_outlined,
                    color: Colors.black26,
                  ),
                ),
                IconWithLable(
                  label: "Summer",
                  iconData: Icon(
                    Icons.watch_later_outlined,
                    color: Colors.black26,
                  ),
                ),
                IconWithLable(
                  label: "Spring",
                  iconData: Icon(
                    Icons.watch_later_outlined,
                    color: Colors.black26,
                  ),
                ),
                IconWithLable(
                  label: "Sleep suit",
                  iconData: Icon(
                    Icons.watch_later_outlined,
                    color: Colors.black26,
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class IconWithLable extends StatelessWidget {
  final Icon? iconData;
  final String? label;
  const IconWithLable({super.key, this.iconData, this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        iconData ?? SizedBox(),
        Text(
          label ?? "",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
