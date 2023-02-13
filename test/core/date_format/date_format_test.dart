import 'package:flutter_test/flutter_test.dart';
import 'package:notes_tdd/core/dateformat/date_format.dart';

void main() {
  group('thumbnail string format', () {
    test('should return today format', () {
      final tDate = DateTime(2023, 2, 10, 8, 10, 10); // make sure to change the date based on test
      const tString = '8:10 AM';
      final result = DateFormatting.thumbnailDate(tDate);

      expect(result, tString);
    });

    test('should return yesterday format', () {
      final tDate = DateTime(2023, 2, 9, 13, 15, 10); // make sure to change the date based on test
      const tString = 'Yesterday 1:15 PM';

      final result = DateFormatting.thumbnailDate(tDate);
      expect(result, tString);
    });

    test('should return Mon 7:56 PM format', () {
      final tDate = DateTime(2023, 2, 6, 19, 56, 10); // make sure to change the date based on test
      const tString = 'Mon 7:56 PM';

      final result = DateFormatting.thumbnailDate(tDate);

      expect(result, tString);
    });

    test('should return January 8, 2023 format', () {
      final tDate = DateTime(2023, 1, 8, 19, 56, 10);
      const tString = 'January 8, 2023';

      final result = DateFormatting.thumbnailDate(tDate);

      expect(result, tString);
    });
  });

  group('note page date', () {
    test('should return February 6 7:57 PM format', () {
      final tDate = DateTime(2023, 2, 6, 19, 57, 10);
      const tString = 'February 6 7:57 PM';

      final result = DateFormatting.notePageDate(tDate);

      expect(result, tString);
    });

    test('should return November 14, 2022 12:26 AM format', () {
      final tDate = DateTime(2022, 11, 14, 00, 26, 10);
      const tString = 'November 14, 2022 12:26 AM';

      final result = DateFormatting.notePageDate(tDate);

      expect(result, tString);
    });
  });
}
