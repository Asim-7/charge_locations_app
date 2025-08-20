import 'package:charge_locations_app/presentation/screens/chargers_screen.dart';
import 'package:flutter/material.dart';

// Widget for a single connector item
class ConnectorItem extends StatelessWidget {
  final Connector connector;
  const ConnectorItem({super.key, required this.connector});

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(
              connector.imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.grey,
                );
              },
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
