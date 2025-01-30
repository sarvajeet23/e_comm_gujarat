import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = {
      "Setting": ["Notification", "Language", "Country"],
      "Support": [
        "Terms & Condition",
        "Privacy Policy",
        "Contact us",
        "About us"
      ]
    };

    return Scaffold(
      body: ListView(
        children: sections.entries
            .expand((entry) => [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  const Divider(),
                  ...entry.value.expand((item) => [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(item),
                        ),
                        const Divider(),
                      ])
                ])
            .toList(),
      ),
    );
  }
}
