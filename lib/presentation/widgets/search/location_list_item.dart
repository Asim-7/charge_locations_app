import 'package:charge_locations_app/constants/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../data/models/charge_location.dart';
import '../../../utils/address_utils.dart';

/// Widget to display a single location in the search results
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
    final isMostlyAvailable =
        totalCount == 0 ? false : availableCount > totalCount / 2;

    // Colors & styles
    final accentGreen = Theme.of(context).primaryColor;
    final cardColor = Theme.of(context).cardColor;
    final iconBg =
        isMostlyAvailable
            ? Theme.of(context).colorScheme.onInverseSurface
            : Theme.of(context).colorScheme.inverseSurface;
    final icon = isMostlyAvailable ? Icons.check_circle : Icons.cancel;
    final iconColor =
        isMostlyAvailable
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.error;
    final iconBgLogo = Theme.of(context).colorScheme.onPrimaryContainer;

    // Split address using reusable function from utils
    final addressParts = splitAddress(location.address);
    final titleText = addressParts[0];
    final subtitleText = addressParts[1];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                blurRadius: 10,
                offset: const Offset(1, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
          child: Row(
            children: [
              // Leading icon (location pin)
              Container(
                decoration: BoxDecoration(
                  color: iconBgLogo,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.ev_station,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitleText,
                      style: const TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.power, color: accentGreen, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '$availableCount ${AppStrings.available}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '/ $totalCount EVSEs',
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),

              // Availability icon
              Container(
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(icon, color: iconColor, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
