import 'package:charge_locations_app/navigation/app_router.dart';
import 'package:charge_locations_app/presentation/widgets/search/empty_state.dart';
import 'package:flutter/material.dart';
import '../../widgets/search/location_list_item.dart';

/// Widget to display a list of locations
class LocationList extends StatelessWidget {
  final List locations;
  const LocationList({required this.locations, super.key});

  @override
  Widget build(BuildContext context) {
    if (locations.isEmpty) {
      return const EmptyState(message: 'No locations found.');
    }
    return ListView.builder(
      itemCount: locations.length,
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
    );
  }
}
