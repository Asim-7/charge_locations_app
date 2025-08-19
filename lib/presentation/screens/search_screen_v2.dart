import 'package:flutter/material.dart';

class SearchScreenV2 extends StatelessWidget {
  const SearchScreenV2({super.key});

  @override
  Widget build(BuildContext context) {
    const accentGreen = Color(0xFF6CF05A);

    // Dummy data for recent searches
    final recentSearches = [
      {
        'title': 'Pall Mall Station',
        'distance': '1.8 km',
        'address': '1 White Hall Palace, Street 5, London',
      },
      {
        'title': 'CDM Charging Station',
        'distance': '2 km',
        'address': '6391 Elgin St., Delaware 10299',
      },
      {
        'title': 'The Artisan Charing Station',
        'distance': '2.4 km',
        'address': '2464 Royal Ln. Mesa, New Jersey 45463',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Charge Locations',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 15),

              // Search bar row
              Row(
                children: [
                  // Search bar
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search by city',
                          isCollapsed: false,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            color: Colors.grey.shade400,
                            onPressed: () {
                              // Perform search action
                            },
                            tooltip: 'Search',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Filter button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.all(14),
                    child: const Icon(Icons.tune, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Current location
              Row(
                children: [
                  Icon(Icons.my_location, color: accentGreen, size: 23),
                  const SizedBox(width: 8),
                  const Text(
                    'Current location',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              const Text(
                'City name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 6),
              Divider(thickness: 1, color: Colors.grey.shade300),
              // Recent search list
              Expanded(
                child: ListView.separated(
                  itemCount: recentSearches.length,
                  separatorBuilder:
                      (_, __) =>
                          Divider(thickness: 1, color: Colors.grey.shade300),
                  itemBuilder: (context, index) {
                    final item = recentSearches[index];
                    return ListTile(
                      leading: Icon(
                        Icons.location_pin,
                        color: accentGreen,
                        size: 28,
                      ),
                      title: Text(
                        item['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        item['address']!,
                        style: const TextStyle(fontSize: 13),
                      ),
                      trailing: Text(
                        item['distance']!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
