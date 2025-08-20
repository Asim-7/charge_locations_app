import 'package:charge_locations_app/data/models/evse.dart';
import 'package:flutter/material.dart';
import 'package:charge_locations_app/theme/app_theme.dart';
import 'package:charge_locations_app/utils/status_utils.dart';

// Widget for a single connector item
class ConnectorItem extends StatelessWidget {
  final Evse connector;
  const ConnectorItem({super.key, required this.connector});

  @override
  Widget build(BuildContext context) {
    final statusColor = getStatusColor(connector.status);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.searchCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.searchCardBorder),
        ),
        child: ListTile(
          // Leading icon with status color
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
                color: AppTheme.searchIcon,
                size: 28,
              ),
            ),
          ),
          // Title
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
              // Price
              Row(
                children: [
                  const Icon(
                    Icons.attach_money,
                    size: 17,
                    color: AppTheme.searchIcon,
                  ),
                  const SizedBox(width: 2),
                  Text('\$1.00/ kWh', style: const TextStyle(fontSize: 13)),
                ],
              ),
              const SizedBox(width: 13),

              // Power Type
              Row(
                children: [
                  Icon(Icons.ev_station, size: 17, color: AppTheme.accentGreen),
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
            color: AppTheme.searchIconSecondary,
            size: 18,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
