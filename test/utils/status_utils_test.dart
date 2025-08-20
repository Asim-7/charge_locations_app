import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/utils/status_utils.dart';
import 'package:charge_locations_app/theme/app_theme.dart';

void main() {
  group('getStatusColor', () {
    test('returns statusAvailable for AVAILABLE', () {
      expect(getStatusColor('AVAILABLE'), AppTheme.statusAvailable);
    });
    test('returns statusCharging for CHARGING', () {
      expect(getStatusColor('CHARGING'), AppTheme.searchError);
    });
    test('returns statusDefault for unknown status', () {
      expect(getStatusColor('UNKNOWN'), AppTheme.searchIconSecondary);
      expect(getStatusColor(''), AppTheme.searchIconSecondary);
    });
  });
}
