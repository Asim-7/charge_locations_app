import 'package:charge_locations_app/domain/usecases/cached_locations_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit to manage bottom navigation state
/// Emits the currently selected index of the bottom navigation bar
class BottomNavCubit extends Cubit<int> {
  final CachedLocationsUsecase cachedLocationsUsecase;

  BottomNavCubit({required this.cachedLocationsUsecase}) : super(0) {
    loadSelectedIndex();
  }

  Future<void> loadSelectedIndex() async {
    final index = await cachedLocationsUsecase.getBottomNavIndex();
    emit(index);
  }

  Future<void> setSelectedIndex(int index) async {
    emit(index);
    await cachedLocationsUsecase.saveBottomNavIndex(index);
  }
}
