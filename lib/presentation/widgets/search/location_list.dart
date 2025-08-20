import 'package:charge_locations_app/constants/app_strings.dart';
import 'package:charge_locations_app/navigation/app_router.dart';
import 'package:flutter/material.dart';
import '../../widgets/search/location_list_item.dart';

/// Widget to display a list of locations
class LocationList extends StatelessWidget {
  final List locations;
  const LocationList({required this.locations, super.key});

  @override
  Widget build(BuildContext context) {
    if (locations.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: 64),
          child: Text(
            AppStrings.noLocationsFound,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // City name
        Text(
          locations.isNotEmpty ? '${locations.first.city}' : 'Locations',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        const SizedBox(height: 6),

        // Divider
        Divider(thickness: 1, color: Theme.of(context).colorScheme.outline),

        // Location list
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: locations.length,
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final location = locations[index];
              return LocationListItem(
                location: location,
                onTap:
                    () => Navigator.pushNamed(
                      context,
                      AppRouter.detailScreenRoute,
                      arguments: location,
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}
