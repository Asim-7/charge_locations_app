import 'package:flutter/material.dart';
import '../../data/models/charge_location.dart';

class LocationListItem extends StatelessWidget {
  final ChargeLocation location;
  final VoidCallback onTap;
  const LocationListItem({
    required this.location,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final availableCount = location.availableEvseCount;
    final totalCount = location.evses.length;
    final isMostlyAvailable = availableCount > totalCount / 2;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: onTap,
        title: Text(location.address),
        subtitle: Text('$availableCount AVAILABLE / $totalCount EVSEs'),
        trailing: Icon(
          isMostlyAvailable ? Icons.check_circle : Icons.cancel,
          color: isMostlyAvailable ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
