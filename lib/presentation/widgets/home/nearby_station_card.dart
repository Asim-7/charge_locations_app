import 'package:flutter/material.dart';

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nearby Station',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Text(
            stationName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '$stationTimeMin min',
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                child: const Text('Get Direction'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 54,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 18,
                  child: Icon(Icons.location_on, color: accentGreen, size: 32),
                ),
                Positioned(
                  left: 30,
                  top: 27,
                  child: Container(width: 80, height: 2, color: accentGreen),
                ),
                Positioned(
                  left: 118,
                  top: 12,
                  child: Icon(Icons.ev_station, color: Colors.green, size: 38),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
