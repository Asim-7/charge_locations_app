import 'package:flutter/material.dart';

class CarImagePlaceholder extends StatelessWidget {
  const CarImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/tesla.png',
        fit: BoxFit.fitHeight,
        height: 150,
      ),
    );
  }
}
