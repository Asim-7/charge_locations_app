import 'package:flutter/material.dart';

import '../../data/models/charge_location.dart';

class DetailScreen extends StatelessWidget {
  final ChargeLocation location;
  const DetailScreen({required this.location, super.key});

  @override
  Widget build(BuildContext context) {
    // If you still need BlocProvider, update its usage to use location object as needed
    return Scaffold(
      appBar: AppBar(title: const Text('Location Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address: ${location.address}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text('City: ${location.city}'),
            Text('Country: ${location.country}'),
            Text('Latitude: ${location.latitude}'),
            Text('Longitude: ${location.longitude}'),
            const SizedBox(height: 16),
            Text('EVSEs:', style: Theme.of(context).textTheme.titleMedium),
            ...location.evses.map(
              (evse) => Text(
                '- ${evse.evseId}: ${evse.status}, ${evse.connectorType}, ${evse.powerType}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
