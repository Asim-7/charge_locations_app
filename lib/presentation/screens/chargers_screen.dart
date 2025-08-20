import 'package:flutter/material.dart';

// Dummy connector data
class Connector {
  final String name;
  final String price;
  final String slot;
  final String imagePath;

  Connector({
    required this.name,
    required this.price,
    required this.slot,
    required this.imagePath,
  });
}

final connectors = [
  Connector(
    name: 'Type A',
    price: '\$1.00/ kWh',
    slot: 'Slot A',
    imagePath: 'assets/images/tesla.png',
  ),
  Connector(
    name: 'CHAdeMO',
    price: '\$0.5/ kWh',
    slot: 'Slot B',
    imagePath: 'assets/images/tesla.png',
  ),
  Connector(
    name: 'Type B',
    price: '\$0.75/ kWh',
    slot: 'Slot C',
    imagePath: 'assets/images/tesla.png',
  ),
];

class ChargersScreen extends StatelessWidget {
  const ChargersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const accentGreen = Color(0xFF6CF05A);
    const subtitleColor = Colors.grey;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: Stack(
        children: [
          // Gradient header outside SafeArea
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              // color: accentGreen,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFE0F7FA), // Light cyan
                  Color(0x00E0F7FA), // Transparent fade
                ],
              ),
            ),
          ),

          // Main content inside SafeArea
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button overlay
                  Positioned(
                    left: 30,
                    top: 32,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  // Title and rating
                  Text(
                    'Pall Mall Station',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '1 White Hall Palace, Street 5, London',
                    style: TextStyle(fontSize: 14, color: subtitleColor),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 17),
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
                        style: TextStyle(color: subtitleColor),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.sync_alt, color: Colors.black),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
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
                          color: Colors.white,
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
                          color: Colors.white,
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
                  const Text(
                    'Available Connectors',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(height: 10),
                  ...connectors.map(
                    (connector) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              connector.imagePath,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.broken_image,
                                  size: 50,
                                  color: Colors.grey,
                                );
                              },
                            ),
                          ),
                          title: Text(
                            connector.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.attach_money,
                                    size: 17,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    connector.price,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 13),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.ev_station,
                                    size: 17,
                                    color: Colors.black54,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    connector.slot,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 18,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Colors.black54,
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: Colors.black54,
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
                        backgroundColor: accentGreen,
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
