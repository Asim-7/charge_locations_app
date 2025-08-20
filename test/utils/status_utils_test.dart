import 'package:charge_locations_app/theme/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/utils/status_utils.dart';

void main() {
  group('getStatusColor', () {
    test('returns statusAvailable for AVAILABLE', () {
      expect(getStatusColor('AVAILABLE'), AppColors.statusAvailable);
    });
    test('returns statusCharging for CHARGING', () {
      expect(getStatusColor('CHARGING'), AppColors.searchError);
    });
    test('returns statusDefault for unknown status', () {
      expect(getStatusColor('UNKNOWN'), AppColors.searchIconSecondary);
      expect(getStatusColor(''), AppColors.searchIconSecondary);
    });
  });
}
