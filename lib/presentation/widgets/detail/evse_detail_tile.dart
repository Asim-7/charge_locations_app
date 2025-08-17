import 'package:flutter/material.dart';
import '../../../data/models/evse.dart';

class EvseDetailTile extends StatelessWidget {
  final Evse evse;
  const EvseDetailTile({required this.evse, super.key});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (evse.status) {
      case 'AVAILABLE':
        statusColor = Colors.green;
        break;
      case 'CHARGING':
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.grey;
    }
    return ListTile(
      leading: Icon(Icons.electric_car, color: statusColor),
      title: Text('Connector: ${evse.connectorType}'),
      subtitle: Text('Power: ${evse.powerType}'),
      trailing: Text(evse.status, style: TextStyle(color: statusColor)),
    );
  }
}
