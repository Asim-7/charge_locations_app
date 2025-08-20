import 'package:charge_locations_app/data/models/evse.dart';
import 'package:flutter/material.dart';

// Widget for a single connector item
class ConnectorItem extends StatelessWidget {
  final Evse connector;
  const ConnectorItem({super.key, required this.connector});

  @override
  Widget build(BuildContext context) {
    const accentGreen = Color(0xFF6CF05A);
    Color statusColor;
    switch (connector.status) {
      case 'AVAILABLE':
        statusColor = Colors.green;
        break;
      case 'CHARGING':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: statusColor.withAlpha((0.13 * 255).toInt()),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.electric_car,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                connector.connectorType,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4), // Minor vertical spacing
            ],
          ),
          subtitle: Row(
            children: [
              Row(
                children: [
                  const Icon(Icons.attach_money, size: 17, color: Colors.black),
                  const SizedBox(width: 2),
                  Text('\$1.00/ kWh', style: const TextStyle(fontSize: 13)),
                ],
              ),
              const SizedBox(width: 13),
              Row(
                children: [
                  const Icon(Icons.ev_station, size: 17, color: accentGreen),
                  const SizedBox(width: 2),
                  Text(
                    connector.powerType,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
