import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/utils/status_utils.dart';
import 'package:flutter/material.dart';

void main() {
  Widget makeTestable({required Widget child}) {
    return MaterialApp(home: Scaffold(body: child));
  }

  group('getStatusColor', () {
    testWidgets('returns colorScheme.tertiary for AVAILABLE', (tester) async {
      late Color color;
      await tester.pumpWidget(
        makeTestable(
          child: Builder(
            builder: (context) {
              color = getStatusColor(context, 'AVAILABLE');
              return const SizedBox();
            },
          ),
        ),
      );
      expect(color, ThemeData().colorScheme.onInverseSurface);
    });
    testWidgets('returns colorScheme.error for CHARGING', (tester) async {
      late Color color;
      await tester.pumpWidget(
        makeTestable(
          child: Builder(
            builder: (context) {
              color = getStatusColor(context, 'CHARGING');
              return const SizedBox();
            },
          ),
        ),
      );
      expect(color, ThemeData().colorScheme.inverseSurface);
    });
    testWidgets('returns colorScheme.onSurface for unknown status', (
      tester,
    ) async {
      late Color color1;
      late Color color2;
      await tester.pumpWidget(
        makeTestable(
          child: Builder(
            builder: (context) {
              color1 = getStatusColor(context, 'UNKNOWN');
              color2 = getStatusColor(context, '');
              return const SizedBox();
            },
          ),
        ),
      );
      expect(color1, ThemeData().colorScheme.onSurface);
      expect(color2, ThemeData().colorScheme.onSurface);
    });
  });
}
