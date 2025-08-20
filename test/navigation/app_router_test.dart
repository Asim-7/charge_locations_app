import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/navigation/app_router.dart';
import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/presentation/screens/chargers_screen.dart';
import 'package:charge_locations_app/presentation/widgets/router/no_route.dart';

// Minimal fake BuildContext for testing
class _FakeBuildContext implements BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

void main() {
  group('AppRouter', () {
    test('returns ChargersScreen route for detailScreenRoute', () {
      final location = ChargeLocation(
        address: 'A, B',
        city: 'Amsterdam',
        country: 'NL',
        latitude: 1.0,
        longitude: 2.0,
        evses: [],
      );
      final settings = RouteSettings(
        name: AppRouter.detailScreenRoute,
        arguments: location,
      );
      final route = AppRouter.generateRoute(settings);
      expect(route, isA<MaterialPageRoute>());
      final widget = (route as MaterialPageRoute).builder(_FakeBuildContext());
      expect(widget, isA<ChargersScreen>());
      expect((widget as ChargersScreen).location, location);
    });

    test('returns NoRoute for unknown route', () {
      final settings = RouteSettings(name: '/unknown');
      final route = AppRouter.generateRoute(settings);
      expect(route, isA<MaterialPageRoute>());
      final widget = (route as MaterialPageRoute).builder(_FakeBuildContext());

      expect(widget, isA<NoRoute>());
      expect((widget as NoRoute).name, '/unknown');
    });
  });
}
