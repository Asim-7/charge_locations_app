import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/data/providers/home_screens_provider.dart';

void main() {
  group('getHomeScreens', () {
    test('returns a list of 4 widgets', () {
      final screens = getHomeScreens();
      expect(screens, isA<List<Widget>>());
      expect(screens.length, 4);
    });

    test('contains expected types and text', () {
      final screens = getHomeScreens();
      // MainContentScreen is a StatelessWidget
      expect(screens[0], isA<StatelessWidget>());
      // SearchScreen is wrapped in BlocProvider, so type is BlocProvider
      expect(screens[1].runtimeType.toString(), contains('BlocProvider'));
      // Map and Profile screens are Center widgets with Text
      expect(screens[2], isA<Center>());
      expect(screens[3], isA<Center>());
      final mapText = ((screens[2] as Center).child as Text).data;
      final profileText = ((screens[3] as Center).child as Text).data;
      expect(mapText, isNotNull);
      expect(profileText, isNotNull);
    });
  });
}
