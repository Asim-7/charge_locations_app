import 'package:flutter/material.dart';
import '../widgets/home/car_info_header.dart';
import '../widgets/home/battery_widget.dart';
import '../widgets/home/car_image_placeholder.dart';
import '../widgets/home/distance_energy_row.dart';
import '../widgets/home/charging_port_card.dart';
import '../widgets/home/nearby_station_card.dart';
import '../../data/providers/main_content_dummy_data.dart';
import 'package:charge_locations_app/theme/app_theme.dart';

/// Screen displaying the main content for the user's vehicle.
class MainContentScreen extends StatelessWidget {
  const MainContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Information Header
            CarInfoHeader(
              carModel: carModel,
              carBrand: carBrand,
              notificationCount: 2,
              accentGreen: AppTheme.accentGreen,
            ),
            const SizedBox(height: 18),

            // Battery & Car Image Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BatteryWidget(
                  batteryPercent: batteryPercent,
                  accentGreen: AppTheme.accentGreen,
                ),
                const SizedBox(child: CarImagePlaceholder()),
              ],
            ),
            const SizedBox(height: 24),

            // Distance & Energy Row
            DistanceEnergyRow(
              distanceKm: distanceKm,
              timeLeft: timeLeft,
              energyKwh: energyKwh,
            ),
            const SizedBox(height: 18),

            // Charging Port Card
            ChargingPortCard(
              chargingPortType: chargingPortType,
              iconBg: AppTheme.searchIconBg,
            ),
            const SizedBox(height: 18),

            // Nearby Station Card
            NearbyStationCard(
              stationName: stationName,
              stationDistanceKm: stationDistanceKm,
              stationTimeMin: stationTimeMin,
              accentGreen: AppTheme.accentGreen,
              bgColor: AppTheme.backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
