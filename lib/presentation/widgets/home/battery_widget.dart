import 'package:flutter/material.dart';

class BatteryWidget extends StatelessWidget {
  final int batteryPercent;
  final Color accentGreen;
  const BatteryWidget({
    required this.batteryPercent,
    required this.accentGreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.grey.shade200,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.battery_4_bar_rounded, color: accentGreen, size: 70),
          const SizedBox(height: 8),
          Text(
            '$batteryPercent%',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
