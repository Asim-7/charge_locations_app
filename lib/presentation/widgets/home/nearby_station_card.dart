import 'package:charge_locations_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// A card widget that displays information about a nearby charging station.
class NearbyStationCard extends StatelessWidget {
  final String stationName;
  final double stationDistanceKm;
  final int stationTimeMin;
  final Color accentGreen;
  final Color bgColor;
  const NearbyStationCard({
    required this.stationName,
    required this.stationDistanceKm,
    required this.stationTimeMin,
    required this.accentGreen,
    required this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left column: Station info
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Station label
                const Text(
                  'Nearby Station',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 5),

                // Station name
                Text(
                  stationName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),

                // Station distance and time
                Row(
                  children: [
                    // Station distance
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '$stationDistanceKm km',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Station time
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '$stationTimeMin min',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Right column: Button and route row
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Get Direction button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.icon,
                    foregroundColor: AppTheme.cardBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Get Direction'),
                ),
                const SizedBox(height: 10),

                // Route information
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Start location
                    Icon(
                      Icons.location_on,
                      color: AppTheme.routeStart,
                      size: 25,
                    ),

                    // Route line
                    Container(
                      width: 80,
                      height: 2,
                      color: AppTheme.routeLine,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),

                    // End location
                    Icon(Icons.ev_station, color: AppTheme.routeEnd, size: 25),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// const SizedBox(height: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: const Text('Get Direction'),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Icon(Icons.location_on, color: accentGreen, size: 32),
//                   Container(
//                     width: 80,
//                     height: 2,
//                     color: accentGreen,
//                     margin: const EdgeInsets.symmetric(horizontal: 8),
//                   ),
//                   Icon(Icons.ev_station, color: Colors.green, size: 38),
//                 ],
//               ),
//             ],
//           ),
