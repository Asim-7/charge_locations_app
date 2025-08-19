import 'package:flutter/material.dart';

/// Widget to display a search bar for locations
class LocationSearchBarV2 extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;
  final VoidCallback onSearch;

  const LocationSearchBarV2({
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search by city',
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
                          color: Colors.grey.shade400,
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.all(14),
          child: const Icon(Icons.tune, color: Colors.black),
        ),
      ],
    );
  }
}
