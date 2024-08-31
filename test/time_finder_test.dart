import 'package:time_finder/time_finder.dart';
import 'package:test/test.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  // the tests will focus on the method TimeFinder.findDate
  // because its underlying method (the one in OffsetDates class) is used by all of the other methods
// Note: In test descriptions, the terms "subtracting" or "adding" refer to adjusting the time unit, which effectively discards any fractional parts.
  setUpAll(() {
    tz.initializeTimeZones();
  });
  group('TimeFinder Class -', () {
    group('findDate Function -', (){
      group('UTC Time Handling', (){

        group('Time Unit Calculations - Second', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.second;
          });

          group('Negative Offset', (){
            test('should return the correct UTC date after subtracting 10 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30, 10);
              final int offset = -10;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 22, 20);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after subtracting 1 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30, 59);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 22, 29);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after subtracting 120 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30);
              final int offset = -120;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 20, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original UTC date when the offset is 0 and the original date does not have fractions after the second', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 22, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current second when the offset is 0', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 22, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current second when the offset is 0 and date is at the last millisecond of the second', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 22, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct UTC date after subtracting 10 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30, 10);
              final int offset = -10;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 22, 20);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 1 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30, 59);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 22, 31);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 120 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30);
              final int offset = 120;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 24, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Minute', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.minute;
          });
          group('Negative Offset', (){
            test('should return the correct UTC date after subtracting 1 minute from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2023, 12, 31, 4, 47);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after subtracting 360 minute from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = -360;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2023, 12, 30, 22, 48);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original UTC date when the offset is 0 and the original date does not have fractions after the minute', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22,);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 22,);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current minute when the offset is 0', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 22);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current minute when the offset is 0 and date is at the last second of the minute', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 22);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct UTC date after adding 1 minute from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2023, 12, 31, 4, 49);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 360 minute from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = 360;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2023, 12, 31, 10, 48);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Hour', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.hour;
          });
          group('Negative Offset', (){
            test('should return the correct UTC date after subtracting 1 hour from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2023, 12, 31, 3);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after subtracting 25 hour from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = -25;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2023, 12, 30, 3);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original UTC date when the offset is 0 and the original date does not have fractions after the hour', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current hour when the offset is 0', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current minute when the offset is 0 and date is at the last minute of the hour', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 59, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct UTC date after adding 1 hour from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2023, 12, 31, 5);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 25 hour from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = 25;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 1, 1, 5);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Day', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.day;
          });
          group('Negative Offset', (){
            test('should return the correct UTC date after subtracting 1 day from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2023, 12, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after subtracting 30 day from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = -30;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2023, 12, 1);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original UTC date when the offset is 0 and the original date does not have fractions after the day', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current day when the offset is 0', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current day when the offset is 0 and date is at the last hour of the day', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 23, 59, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct UTC date after adding 1 day from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 1, 1);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 10 days from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2023, 12, 31, 4, 48, 36,);
              final int offset = 10;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 1, 10);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Week', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.week;
          });
          group('Negative Offset', (){
            test('should return the correct UTC date after subtracting 1 week from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 19);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after subtracting 3 weeks from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = -3;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 5);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original UTC date when the offset is 0 and the original date is at the start of the week', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current week when the offset is 0', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 28, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current week when the offset is 0 and date is at the last hour of the week', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 9, 1, 23, 59, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct UTC date after adding 1 week from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 29, 23, 59, 59, 59, 59);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 9, 2);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 3 week from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 9, 16);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('different weekStartDay', (){
            test('should return the correct UTC date after adding 3 week from the original date with Tuesday as the start of the week', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.tuesday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 9, 17);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 3 week from the original date with Wednesday as the start of the week', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.wednesday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 9, 11);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 3 week from the original date with Thursday as the start of the week', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.thursday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 9, 12);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 3 week from the original date with Friday as the start of the week', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.friday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 9, 13);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 3 week from the original date with Saturday as the start of the week', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.saturday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 9, 14);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 3 week from the original date with Sunday as the start of the week', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.sunday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 9, 15);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Month', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.month;
          });
          group('Negative Offset', (){
            test('should return the correct UTC date after subtracting 1 month from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 7);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after subtracting 3 months from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = -3;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 5);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original UTC date when the offset is 0 and the original date is at the start of the month', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current month when the offset is 0', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 12, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current month when the offset is 0 and date is at the last hour of the month', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 9, 30, 23, 59, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 9);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct UTC date after adding 1 month from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 29, 23, 59, 59, 59, 59);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 9);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 3 months from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 11);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Year', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.year;
          });
          group('Negative Offset', (){
            test('should return the correct UTC date after subtracting 1 year from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2023);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after subtracting 5 years from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = -5;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2019);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original UTC date when the offset is 0 and the original date is at the start of the year', (){
              // arrange
              final DateTime date = DateTime.utc(2024);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current year when the offset is 0', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 12, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current month when the offset is 0 and date is at the last hour of the month', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 12, 31, 23, 59, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct UTC date after adding 1 year from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 29, 23, 59, 59, 59, 59);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2025);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 3 years from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2027);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

      });

      group('Local Time Handing', (){

        group('Time Unit Calculations - Second', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.second;
          });
          group('Negative Offset', (){
            test('should return the correct local date after subtracting 10 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 10);
              final int offset = -10;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 20);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct local date after subtracting 1 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 59);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 29);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct local date after subtracting 120 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 30);
              final int offset = -120;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8, 20, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original date when the offset is 0 and the original date does not have fractions after the second', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 30);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current second when the offset is 0', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current second when the offset is 0 and date is at the last millisecond of the second', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct UTC date after subtracting 10 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime.utc(2024, 8, 26, 8, 22, 30, 10);
              final int offset = -10;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime.utc(2024, 8, 26, 8, 22, 20);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 1 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 59);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 31);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 120 seconds from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 30);
              final int offset = 120;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8, 24, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Minute', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.minute;
          });
          group('Negative Offset', (){
            test('should return the correct date after subtracting 1 minute from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023, 3, 31, 4, 47);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after subtracting 360 minute from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = -360;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023, 3, 30, 22, 48);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original date when the offset is 0 and the original date does not have fractions after the minute', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22,);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22,);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current minute when the offset is 0 - local date', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current minute when the offset is 0 and date is at the last second of the minute - local date', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct date after adding 1 minute from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023, 3, 31, 4, 49);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 360 minute from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = 360;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023, 3, 31, 10, 48);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Hour', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.hour;
          });
          group('Negative Offset', (){
            test('should return the correct date after subtracting 1 hour from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023, 3, 31, 3);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after subtracting 25 hour from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = -25;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023, 3, 30, 3);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original date when the offset is 0 and the original date does not have fractions after the hour', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current hour when the offset is 0 - local date', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current minute when the offset is 0 and date is at the last minute of the hour - local date', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 59, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26, 8);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct date after adding 1 hour from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023, 3, 31, 5);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 25 hour from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = 25;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023, 4, 1, 5);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Day', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.day;
          });
          group('Negative Offset', (){
            test('should return the correct date after subtracting 1 day from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert

              final DateTime expectedResult = DateTime(2023, 3, 30);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after subtracting 30 day from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = -30;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023, 3, 1);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original date when the offset is 0 and the original date does not have fractions after the day', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current day when the offset is 0 - local date', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current day when the offset is 0 and date is at the last hour of the day - local date', (){
              // arrange
              final DateTime date = DateTime(2024, 3, 26, 23, 59, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 3, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct UTC date after adding 1 day from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023, 4, 1);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct UTC date after adding 10 days from the original date', (){
              // arrange
              final DateTime date = DateTime(2023, 3, 31, 4, 48, 36,);
              final int offset = 10;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023, 4, 10);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Week', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.week;
          });
          group('Negative Offset', (){
            test('should return the correct date after subtracting 1 week from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 8, 19);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after subtracting 3 weeks from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = -3;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 8, 5);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original date when the offset is 0 and the original date is at the start of the week', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 26);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 8, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current week when the offset is 0 - local time', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 28, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 8, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current week when the offset is 0 and date is at the last hour of the week - local time', (){
              // arrange
              final DateTime date = DateTime(2024, 9, 1, 23, 59, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 8, 26);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct date after adding 1 week from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 29, 23, 59, 59, 59, 59);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 9, 2);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 3 week from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 9, 16);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('different weekStartDay', (){
            test('should return the correct date after adding 3 week from the original date with Tuesday as the start of the week', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.tuesday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime(2024, 9, 17);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 3 week from the original date with Wednesday as the start of the week', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.wednesday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime(2024, 9, 11);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 3 week from the original date with Thursday as the start of the week', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.thursday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime(2024, 9, 12);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 3 week from the original date with Friday as the start of the week', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.friday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime(2024, 9, 13);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 3 week from the original date with Saturday as the start of the week', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.saturday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime(2024, 9, 14);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 3 week from the original date with Sunday as the start of the week', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              final WeekStartDay weekStartDay = WeekStartDay.sunday;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset, weekStartDay: weekStartDay,);
              // assert
              final DateTime expectedResult = DateTime(2024, 9, 15);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Month', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.month;
          });
          group('Negative Offset', (){
            test('should return the correct date after subtracting 1 month from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 7);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after subtracting 3 months from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = -3;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 5);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original date when the offset is 0 and the original date is at the start of the month', (){
              // arrange
              final DateTime date = DateTime(2024, 8);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 8);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current month when the offset is 0 - local time', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 12, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 8);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current month when the offset is 0 and date is at the last hour of the month - local time', (){
              // arrange
              final DateTime date = DateTime(2024, 9, 30, 23, 59, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 9);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct date after adding 1 month from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 29, 23, 59, 59, 59, 59);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 9);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 3 months from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024, 11);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

        group('Time Unit Calculations - Year', (){
          late TimeUnit timeUnit;
          setUp(() {
            // Set up common parameters for the group of tests
            timeUnit = TimeUnit.year;
          });
          group('Negative Offset', (){
            test('should return the correct date after subtracting 1 year from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = -1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2023);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after subtracting 5 years from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = -5;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2019);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Zero Offset', (){
            test('should return the original date when the offset is 0 and the original date is at the start of the year', (){
              // arrange
              final DateTime date = DateTime(2024);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current year when the offset is 0 - local time', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 12, 8, 22, 30, 28);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the start of the current month when the offset is 0 and date is at the last hour of the month - local time', (){
              // arrange
              final DateTime date = DateTime(2024, 12, 31, 23, 59, 59, 59, 59);
              final int offset = 0;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2024);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });

          group('Positive Offset', (){
            test('should return the correct date after adding 1 year from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 29, 23, 59, 59, 59, 59);
              final int offset = 1;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2025);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });

            test('should return the correct date after adding 3 years from the original date', (){
              // arrange
              final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
              final int offset = 3;
              // act
              final DateTime result = TimeFinder.findDate(date: date, timeUnit: timeUnit, offset: offset,);
              // assert
              final DateTime expectedResult = DateTime(2027);
              final bool eval = expectedResult.compareTo(result) == 0;
              expect(eval, isTrue);
            });
          });
        });

      });

      group('Timezone Transitions and Edge Cases', (){
        test('DST Transition Start - New York', (){
          // arrange
          final location = tz.getLocation('America/New_York');
          final TimeUnit timeUnit = TimeUnit.second;
          final beforeDst = tz.TZDateTime(location, 2024, 3, 10, 1, 59, 59);
          final int offset = 1;
          // act
          final DateTime result = TimeFinder.findDate(date: beforeDst, timeUnit: timeUnit, offset: offset,);
          print(result);
          // assert
          final expectedResult = tz.TZDateTime(location, 2024, 3, 10, 3);
          final bool eval = expectedResult.compareTo(result) == 0;
          expect(eval, isTrue);
        });


      });

      group('Equivalence Between UTC and Local', (){

        group('Time Unit Calculations - Second', (){
          group('Negative Offset', (){

          });

          group('Zero Offset', (){

          });

          group('Positive Offset', (){

          });
        });

        group('Time Unit Calculations - Minute', (){
          group('Negative Offset', (){

          });

          group('Zero Offset', (){

          });

          group('Positive Offset', (){

          });
        });

        group('Time Unit Calculations - Hour', (){
          group('Negative Offset', (){

          });

          group('Zero Offset', (){

          });

          group('Positive Offset', (){

          });
        });

        group('Time Unit Calculations - Day', (){
          group('Negative Offset', (){

          });

          group('Zero Offset', (){

          });

          group('Positive Offset', (){

          });
        });

        group('Time Unit Calculations - Week', (){
          group('Negative Offset', (){

          });

          group('Zero Offset', (){

          });

          group('Positive Offset', (){

          });
        });

        group('Time Unit Calculations - Month', (){
          group('Negative Offset', (){

          });

          group('Zero Offset', (){

          });

          group('Positive Offset', (){

          });
        });

        group('Time Unit Calculations - Year', (){
          group('Negative Offset', (){

          });

          group('Zero Offset', (){

          });

          group('Positive Offset', (){

          });
        });

      });
    });

    group('findSecondWithOffset Function -', (){
      group('Negative Offset', (){

      });

      group('Zero Offset', (){

      });

      group('Positive Offset', (){

      });
    });

    group('findMinuteWithOffset Function -', (){
      group('Negative Offset', (){

      });

      group('Zero Offset', (){

      });

      group('Positive Offset', (){

      });
    });

    group('findHourWithOffset Function -', (){
      group('Negative Offset', (){

      });

      group('Zero Offset', (){

      });

      group('Positive Offset', (){

      });
    });

    group('findDayWithOffset Function -', (){
      group('Negative Offset', (){

      });

      group('Zero Offset', (){

      });

      group('Positive Offset', (){

      });
    });

    group('findWeekWithOffset Function -', (){
      group('Negative Offset', (){

      });

      group('Zero Offset', (){

      });

      group('Positive Offset', (){

      });
    });

    group('findMonthWithOffset Function -', (){
      group('Negative Offset', (){

      });

      group('Zero Offset', (){

      });

      group('Positive Offset', (){

      });
    });

    group('findYearWithOffset Function -', (){
      group('Negative Offset', (){

      });

      group('Zero Offset', (){

      });

      group('Positive Offset', (){

      });
    });

    group('...FromNow Functions -', (){

    });

    group('...FromDate Functions -', (){

    });

    group('findDateRange Function -', (){

    });
  });
}
