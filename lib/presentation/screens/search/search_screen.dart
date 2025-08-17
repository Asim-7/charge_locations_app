import 'package:charge_locations_app/presentation/blocs/search/search_event.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_state.dart';
import 'package:charge_locations_app/presentation/widgets/location_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/search/search_bloc.dart';
import '../../widgets/location_list_item.dart';
import '../detail/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSearch() {
    final city = _controller.text.trim();
    if (city.isNotEmpty && !_isLoading) {
      context.read<LocationSearchBloc>().add(SearchLocations(city));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Charge Locations')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LocationSearchBar(
              controller: _controller,
              isLoading: _isLoading,
              onSearch: _onSearch,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocConsumer<LocationSearchBloc, LocationSearchState>(
                listener: (context, state) {
                  setState(() {
                    _isLoading = state is LocationSearchLoading;
                  });
                },
                builder: (context, state) {
                  if (state is LocationSearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LocationSearchError) {
                    return Center(child: Text(state.message));
                  } else if (state is LocationSearchLoaded) {
                    final locations = state.locations;
                    if (locations.isEmpty) {
                      return const Center(child: Text('No locations found.'));
                    }
                    return ListView.builder(
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        final location = locations[index];
                        return LocationListItem(
                          location: location,
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => DetailScreen(location: location),
                                ),
                              ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('Search for charge locations.'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
