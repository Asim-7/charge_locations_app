import 'package:flutter/material.dart';

class ChargingPortCard extends StatelessWidget {
  final String chargingPortType;
  final Color iconBg;
  const ChargingPortCard({
    required this.chargingPortType,
    required this.iconBg,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.power_outlined,
              color: Colors.black,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Charging Port',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          const Spacer(),
          Text(
            chargingPortType,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
