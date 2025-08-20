import 'package:charge_locations_app/constants/app_strings.dart';
import 'package:charge_locations_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Widget to display a search bar for locations
class LocationSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;
  final VoidCallback onSearch;

  const LocationSearchBar({
    required this.controller,
    required this.isLoading,
    required this.onSearch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search bar
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.searchCard,
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: AppStrings.searchByCity,
                isCollapsed: false,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                suffixIcon:
                    isLoading
                        ? const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                        : IconButton(
                          icon: const Icon(Icons.search),
                          color: AppTheme.searchTextSecondary,
                          onPressed: onSearch,
                          tooltip: 'Search',
                        ),
              ),
              onSubmitted: (_) => onSearch(),
            ),
          ),
        ),
        const SizedBox(width: 10),

        // Filter button
        Container(
          decoration: BoxDecoration(
            color: AppTheme.searchCard,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.all(14),
          child: const Icon(Icons.tune, color: AppTheme.searchIcon),
        ),
      ],
    );
  }
}
