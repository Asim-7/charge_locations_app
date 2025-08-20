import 'package:charge_locations_app/presentation/blocs/search/search_event.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_state.dart';
import 'package:charge_locations_app/presentation/widgets/search/location_search_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/search/search_bloc.dart';
import '../../widgets/search/location_list.dart';
import '../../widgets/search/empty_state.dart';
import '../../widgets/search/error_retry.dart';

/// Search screen for finding charge locations
class SearchScreen extends StatefulWidget {
  // For widget instantiation and optimization
  const SearchScreen({super.key});

  // Linking stateful widget to its state logic.
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// State management for the search screen
class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  // Load cached locations After initializing the state
  @override
  void initState() {
    super.initState();

    // Load cached locations
    context.read<LocationSearchBloc>().add(LoadCachedLocations());
  }

  // Dispose the controller when the widget is removed from the widget tree
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Handle search action
  void _onSearch() {
    final city = _controller.text.trim();
    final isLoading =
        context.read<LocationSearchBloc>().state is LocationSearchLoading;
    if (city.isNotEmpty && !isLoading) {
      context.read<LocationSearchBloc>().add(SearchLocations(city));
    }
  }

  @override
  Widget build(BuildContext context) {
    const accentGreen = Color(0xFF6CF05A);

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

              // Search bar with loading indicator
              BlocSelector<LocationSearchBloc, LocationSearchState, bool>(
                selector: (state) => state is LocationSearchLoading,
                builder: (context, isLoading) {
                  return LocationSearchBarV2(
                    controller: _controller,
                    isLoading: isLoading,
                    onSearch: () {
                      _onSearch();
                      FocusScope.of(context).unfocus(); // Dismiss keyboard
                    },
                    key: const Key('searchBar'),
                  );
                },
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

              // BlocBuilder for location search results
              Expanded(
                child: BlocBuilder<LocationSearchBloc, LocationSearchState>(
                  builder: (context, state) {
                    if (state is LocationSearchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is LocationSearchError) {
                      return ErrorRetry(
                        message: state.message,
                        onRetry: _onSearch,
                      );
                    } else if (state is LocationSearchLoaded) {
                      return LocationList(locations: state.locations);
                    }
                    return const EmptyState(
                      message: 'Search for charge locations.',
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
