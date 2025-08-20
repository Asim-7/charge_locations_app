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
    const accentGreen = Color(0xFF6CF05A);
    final cardColor = Colors.white;
    final iconBg =
        isMostlyAvailable
            ? accentGreen.withAlpha((0.13 * 255).toInt())
            : Colors.red.withAlpha((0.13 * 255).toInt());
    final icon = isMostlyAvailable ? Icons.check_circle : Icons.cancel;
    final iconColor = isMostlyAvailable ? accentGreen : Colors.red;
    final iconBgLogo = Color(0xFFE8F5E9);

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
                color: Colors.grey.withAlpha((0.07 * 255).toInt()),
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
                child: const Icon(
                  Icons.ev_station,
                  color: Colors.black,
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
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
                          '$availableCount AVAILABLE',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '/ $totalCount EVSEs',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
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
