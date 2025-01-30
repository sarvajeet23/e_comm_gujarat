import 'package:flutter/material.dart';

class LinerColor extends StatelessWidget {
  final Widget? child;
  const LinerColor({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFB2F0E9),
            Colors.white,
          ],
        ),
      ),
      child: child,
    );
  }
}
