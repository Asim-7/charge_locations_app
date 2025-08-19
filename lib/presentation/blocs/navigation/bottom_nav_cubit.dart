import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Cubit to manage bottom navigation state
/// Emits the currently selected index of the bottom navigation bar
class BottomNavCubit extends Cubit<int> {
  static const _key = 'selected_nav_index';

  BottomNavCubit() : super(0) {
    _loadSelectedIndex();
  }

  Future<void> _loadSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_key) ?? 0;
    emit(index);
  }

  Future<void> setSelectedIndex(int index) async {
    emit(index);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, index);
  }
}
