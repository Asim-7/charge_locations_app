import 'package:flutter/material.dart';
import '../widgets/home/car_info_header.dart';
import '../widgets/home/battery_widget.dart';
import '../widgets/home/car_image_placeholder.dart';
import '../widgets/home/distance_energy_row.dart';
import '../widgets/home/charging_port_card.dart';
import '../widgets/home/nearby_station_card.dart';
import '../../data/providers/main_content_dummy_data.dart';

class MainContentScreen extends StatelessWidget {
  const MainContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF4F6F8);
    const accentGreen = Color(0xFF6CF05A);
    const iconBg = Color(0xFFE8F5E9);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarInfoHeader(
              carModel: carModel,
              carBrand: carBrand,
              notificationCount: 2,
              accentGreen: accentGreen,
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BatteryWidget(
                  batteryPercent: batteryPercent,
                  accentGreen: accentGreen,
                ),
                const SizedBox(child: CarImagePlaceholder()),
              ],
            ),
            const SizedBox(height: 24),
            DistanceEnergyRow(
              distanceKm: distanceKm,
              timeLeft: timeLeft,
              energyKwh: energyKwh,
            ),
            const SizedBox(height: 18),
            ChargingPortCard(
              chargingPortType: chargingPortType,
              iconBg: iconBg,
            ),
            const SizedBox(height: 18),
            NearbyStationCard(
              stationName: stationName,
              stationDistanceKm: stationDistanceKm,
              stationTimeMin: stationTimeMin,
              accentGreen: accentGreen,
              bgColor: bgColor,
            ),
          ],
        ),
      ),
    );
  }
}
