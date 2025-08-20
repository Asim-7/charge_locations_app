import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/presentation/widgets/detail/connector_list.dart';
import 'package:charge_locations_app/utils/address_utils.dart';
import 'package:flutter/material.dart';
import 'package:charge_locations_app/theme/app_theme.dart';

class ChargersScreen extends StatelessWidget {
  final ChargeLocation location;

  const ChargersScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    // Split address using reusable function from utils
    final addressParts = splitAddress(location.address);
    final titleText = addressParts[0];
    final subtitleText = addressParts[1];

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          // Gradient header outside SafeArea
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
              ),
            ),
          ),

          // Main content inside SafeArea
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button overlay
                  CircleAvatar(
                    backgroundColor: AppTheme.cardBackground,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppTheme.icon),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  const SizedBox(height: 40),
                  // Title and rating
                  Text(
                    titleText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitleText,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppTheme.subtitleColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppTheme.star, size: 17),
                      const SizedBox(width: 2),
                      const Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' (56 Reviews)',
                        style: const TextStyle(color: AppTheme.subtitleColor),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.iconButtonBg,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.sync_alt,
                            color: AppTheme.icon,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.iconButtonBg,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: AppTheme.favoriteBorder,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Distance & time
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.chipBackground,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          '1.8 km',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.chipBackground,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          '3 min',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  // Available Connectors
                  Text(
                    '${location.evses.length} Connector(s)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(height: 10),

                  // Connector List
                  ConnectorList(connectors: location.evses),

                  const SizedBox(height: 18),
                  // Choose Date & Time
                  const Text(
                    'Choose Date & Time',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.cardBackground,
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: AppTheme.chipBorder),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: AppTheme.iconSecondary,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'Thu, May 30',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.cardBackground,
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: AppTheme.chipBorder),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: AppTheme.iconSecondary,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                '16:30',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  // Confirm Booking Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accentGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Confirm Booking',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
