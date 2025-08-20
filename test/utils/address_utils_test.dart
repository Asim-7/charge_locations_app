import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/utils/address_utils.dart';

void main() {
  group('splitAddress', () {
    test('splits address with comma', () {
      final result = splitAddress('Main St, Suite 100');
      expect(result, ['Main St', 'Suite 100']);
    });

    test('returns [address, address] if no comma', () {
      final result = splitAddress('NoCommaHere');
      expect(result, ['NoCommaHere', 'NoCommaHere']);
    });

    test('trims whitespace around parts', () {
      final result = splitAddress(' 123 Road , Apt 4 ');
      expect(result, ['123 Road', 'Apt 4']);
    });

    test('splits only at first comma', () {
      final result = splitAddress('A, B, C');
      expect(result, ['A', 'B, C']);
    });
  });
}
