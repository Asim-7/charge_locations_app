import 'package:charge_locations_app/domain/usecases/cached_locations_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/presentation/blocs/navigation/bottom_nav_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../search/search_bloc_test.mocks.dart';

// Mock the dependencies using: "flutter pub run build_runner build" in cmd
@GenerateMocks([CachedLocationsUsecase])
void main() {
  late MockCachedLocationsUsecase cachedLocationsUsecase;
  late BottomNavCubit cubit;

  setUp(() async {
    cachedLocationsUsecase = MockCachedLocationsUsecase();
    when(cachedLocationsUsecase.getBottomNavIndex()).thenAnswer((_) async => 0);
    when(cachedLocationsUsecase.saveBottomNavIndex(0)).thenAnswer((_) async {});
    cubit = BottomNavCubit(cachedLocationsUsecase: cachedLocationsUsecase);
    // Wait for async _loadSelectedIndex if needed
    await Future.delayed(const Duration(milliseconds: 10));
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state is 0 and loads from cache', () async {
    // By default, mock returns 0
    expect(cubit.state, 0);
    // Now test with a different value
    when(cachedLocationsUsecase.getBottomNavIndex()).thenAnswer((_) async => 2);
    final cubit2 = BottomNavCubit(
      cachedLocationsUsecase: cachedLocationsUsecase,
    );
    await Future.delayed(const Duration(milliseconds: 10));
    expect(cubit2.state, 2);
  });

  test('setSelectedIndex emits and saves index', () async {
    await cubit.setSelectedIndex(1);
    expect(cubit.state, 1);
    verify(cachedLocationsUsecase.saveBottomNavIndex(1)).called(1);
  });

  test('setSelectedIndex persists value across cubit instances', () async {
    when(cachedLocationsUsecase.getBottomNavIndex()).thenAnswer((_) async => 3);
    await cubit.setSelectedIndex(3);
    final cubit2 = BottomNavCubit(
      cachedLocationsUsecase: cachedLocationsUsecase,
    );
    await Future.delayed(const Duration(milliseconds: 10));
    expect(cubit2.state, 3);
  });
}
