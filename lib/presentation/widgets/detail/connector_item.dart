import 'package:charge_locations_app/presentation/screens/chargers_screen.dart';
import 'package:flutter/material.dart';

// Widget for a single connector item
class ConnectorItem extends StatelessWidget {
  final Connector connector;
  const ConnectorItem({super.key, required this.connector});

  @override
  Widget build(BuildContext context) {
    const accentGreen = Color(0xFF6CF05A);
    // final iconBg =
    //     isMostlyAvailable
    //         ? accentGreen.withAlpha((0.13 * 255).toInt())
    //         : Colors.red.withAlpha((0.13 * 255).toInt());

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
                color: accentGreen.withAlpha((0.13 * 255).toInt()),
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
          title: Text(
            connector.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Row(
            children: [
              Row(
                children: [
                  const Icon(Icons.attach_money, size: 17, color: Colors.black),
                  const SizedBox(width: 2),
                  Text(connector.price, style: const TextStyle(fontSize: 13)),
                ],
              ),
              const SizedBox(width: 13),
              Row(
                children: [
                  const Icon(Icons.ev_station, size: 17, color: Colors.black54),
                  const SizedBox(width: 2),
                  Text(connector.slot, style: const TextStyle(fontSize: 13)),
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
