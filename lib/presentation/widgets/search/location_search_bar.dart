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
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Search by city',
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
                  onPressed: onSearch,
                  tooltip: 'Search',
                ),
      ),
      onSubmitted: (_) => onSearch(),
    );
  }
}
