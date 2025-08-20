import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/presentation/widgets/detail/connector_list.dart';
import 'package:charge_locations_app/utils/address_utils.dart';
import 'package:flutter/material.dart';
import 'package:charge_locations_app/theme/app_theme.dart';
import 'package:charge_locations_app/presentation/widgets/detail/chargers_header.dart';
import 'package:charge_locations_app/presentation/widgets/detail/chargers_rating_row.dart';
import 'package:charge_locations_app/presentation/widgets/detail/chargers_distance_time_row.dart';
import 'package:charge_locations_app/presentation/widgets/detail/chargers_date_time_picker_row.dart';

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
                  // Header
                  ChargersHeader(
                    titleText: titleText,
                    subtitleText: subtitleText,
                    onBack: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 6),

                  // Rating Row
                  const ChargersRatingRow(),
                  const SizedBox(height: 8),

                  // Distance & Time Row
                  const ChargersDistanceTimeRow(),
                  const SizedBox(height: 18),

                  // Available Connectors
                  Text(
                    '${location.evses.length} Connector(s)',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
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

                  // Date & Time Picker
                  const ChargersDateTimePickerRow(),
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
