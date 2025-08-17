import 'package:charge_locations_app/presentation/blocs/search/search_event.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/search/search_bloc.dart';
import '../widgets/location_list_item.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  void _onSearch() {
    final city = _controller.text.trim();
    if (city.isNotEmpty) {
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
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search by city',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _onSearch,
                ),
              ),
              onSubmitted: (_) => _onSearch(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<LocationSearchBloc, LocationSearchState>(
                builder: (context, state) {
                  if (state is LocationSearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is LocationSearchError) {
                    return Center(child: Text(state.message));
                  }
                  if (state is LocationSearchLoaded) {
                    if (state.locations.isEmpty) {
                      return const Center(child: Text('No locations found.'));
                    }
                    return ListView.builder(
                      itemCount: state.locations.length,
                      itemBuilder: (context, index) {
                        final location = state.locations[index];
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
                  }
                  return const Center(
                    child: Text('Search for charge locations.'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
