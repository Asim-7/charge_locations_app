import 'package:charge_locations_app/constants/app_strings.dart';
import 'package:flutter/material.dart';

/// Widget to display a no route found state
class NoRoute extends StatelessWidget {
  final String? name;
  const NoRoute({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${AppStrings.noRouteDefined} ${name ?? "unknown"}'),
    );
  }
}
