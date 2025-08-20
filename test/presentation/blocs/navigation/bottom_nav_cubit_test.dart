import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/presentation/blocs/navigation/bottom_nav_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('BottomNavCubit', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('initial state is 0 and loads from SharedPreferences', () async {
      SharedPreferences.setMockInitialValues({'selected_nav_index': 2});
      final cubit = BottomNavCubit();
      // Wait for async _loadSelectedIndex
      await Future.delayed(const Duration(milliseconds: 10));
      expect(cubit.state, 2);
    });

    test('setSelectedIndex emits and saves index', () async {
      final cubit = BottomNavCubit();
      await cubit.setSelectedIndex(1);
      expect(cubit.state, 1);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getInt('selected_nav_index'), 1);
    });

    test('setSelectedIndex persists value across cubit instances', () async {
      final cubit = BottomNavCubit();
      await cubit.setSelectedIndex(3);
      final cubit2 = BottomNavCubit();
      await Future.delayed(const Duration(milliseconds: 10));
      expect(cubit2.state, 3);
    });
  });
}
