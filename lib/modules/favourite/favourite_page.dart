import 'package:e_comm/core/app_color.dart';
import 'package:e_comm/modules/favourite/components/shoes_page.dart';
import 'package:e_comm/modules/favourite/components/shorts_page.dart';
import 'package:e_comm/modules/favourite/components/t_shirt_page.dart';
import 'package:e_comm/modules/favourite/components/top_page.dart';
import 'package:e_comm/modules/favourite/widget/tab_item.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({super.key});

  final List<TabItem> tabs = [
    TabItem(label: "Shoes", page: ShoesPage()),
    TabItem(label: "Top", page: TopPage()),
    TabItem(label: "Shorts", page: ShortsPage()),
    TabItem(label: "Shoes", page: ShoesPage()),
    TabItem(label: "T-shirt", page: TShirtPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: AppColor.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColor.primary, width: 2),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: AppColor.primary,
                  unselectedLabelColor: Colors.white,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  tabs: tabs.map((tab) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 40,
                        constraints: BoxConstraints(minWidth: 80),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Tab(text: tab.label),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: tabs.map((tab) => tab.page).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
