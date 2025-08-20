import 'package:flutter/material.dart';
import 'package:charge_locations_app/theme/app_theme.dart';

/// A card widget that displays information about a charging port.
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
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(18),
      ),
      // A row displaying the charging port icon and type.
      child: Row(
        children: [
          // Charging port icon
          Container(
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.power_outlined,
              color: AppTheme.icon,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),

          // Charging port type text
          const Text(
            'Charging Port',
            style: TextStyle(fontSize: 15, color: AppTheme.textSecondary),
          ),
          const Spacer(),

          // Charging port type text
          Text(
            chargingPortType,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
