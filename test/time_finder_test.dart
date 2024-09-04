import 'package:time_finder/time_finder.dart';
import 'package:test/test.dart';

void main() {
  // the tests will focus on the method TimeFinder.findDate
  // because its underlying method (the one in OffsetDates class) is used by all of the other methods
  // Note: In test descriptions, the terms "subtracting" or "adding" refer to adjusting the time unit, which effectively discards any fractional parts.
  group('TimeFinder Class -', () {
    group('findDate Function -', () {
      group('Time Unit Calculations - Second', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.second;
        });
        group('Negative Offset', () {
          test(
              'should return the correct date after subtracting 10 seconds from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 10);
            final int offset = -10;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 20);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after subtracting 1 seconds from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 59);
            final int offset = -1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 29);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after subtracting 120 seconds from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30);
            final int offset = -120;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 20, 30);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'should return the original date when the offset is 0 and the original date does not have fractions after the second',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 30);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current second when the offset is 0',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 28);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 30);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current second when the offset is 0 and date is at the last millisecond of the second',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 59, 59);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 30);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'should return the correct date after subtracting 10 seconds from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 26, 8, 22, 30, 10);
            final int offset = -10;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 8, 26, 8, 22, 20);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 1 seconds from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 59);
            final int offset = 1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 31);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 120 seconds from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30);
            final int offset = 120;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 24, 30);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });
      });

      group('Time Unit Calculations - Minute', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.minute;
        });
        group('Negative Offset', () {
          test(
              'should return the correct date after subtracting 1 minute from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = -1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 3, 31, 4, 47);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after subtracting 360 minute from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = -360;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 3, 30, 22, 48);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'should return the original date when the offset is 0 and the original date does not have fractions after the minute',
              () {
            // arrange
            final DateTime date = DateTime(
              2024,
              3,
              26,
              8,
              22,
            );
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(
              2024,
              3,
              26,
              8,
              22,
            );
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current minute when the offset is 0',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 28);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current minute when the offset is 0 and date is at the last second of the minute',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 59, 59, 59);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'should return the correct date after adding 1 minute from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = 1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 3, 31, 4, 49);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 360 minute from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = 360;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 3, 31, 10, 48);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });
      });

      group('Time Unit Calculations - Hour', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.hour;
        });
        group('Negative Offset', () {
          test(
              'should return the correct date after subtracting 1 hour from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = -1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 3, 31, 3);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after subtracting 25 hour from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = -25;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 3, 30, 3);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'should return the original date when the offset is 0 and the original date does not have fractions after the hour',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current hour when the offset is 0',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 28);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current minute when the offset is 0 and date is at the last minute of the hour',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 59, 59, 59, 59);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'should return the correct date after adding 1 hour from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = 1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 3, 31, 5);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 25 hour from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = 25;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 4, 1, 5);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });
      });

      group('Time Unit Calculations - Day', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.day;
        });
        group('Negative Offset', () {
          test(
              'should return the correct date after subtracting 1 day from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = -1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert

            final DateTime expectedResult = DateTime(2023, 3, 30);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after subtracting 30 day from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = -30;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 3, 1);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'should return the original date when the offset is 0 and the original date does not have fractions after the day',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current day when the offset is 0',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 28);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current day when the offset is 0 and date is at the last hour of the day',
              () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 23, 59, 59, 59, 59);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'should return the correct UTC date after adding 1 day from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = 1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 4, 1);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct UTC date after adding 10 days from the original date',
              () {
            // arrange
            final DateTime date = DateTime(
              2023,
              3,
              31,
              4,
              48,
              36,
            );
            final int offset = 10;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 4, 10);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });
      });

      group('Time Unit Calculations - Week', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.week;
        });
        group('Negative Offset', () {
          test(
              'should return the correct date after subtracting 1 week from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = -1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 8, 19);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after subtracting 3 weeks from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = -3;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 8, 5);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'should return the original date when the offset is 0 and the original date is at the start of the week',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 26);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 8, 26);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current week when the offset is 0',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 28, 8, 22, 30, 28);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 8, 26);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current week when the offset is 0 and date is at the last hour of the week',
              () {
            // arrange
            final DateTime date = DateTime(2024, 9, 1, 23, 59, 59, 59, 59);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 8, 26);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'should return the correct date after adding 1 week from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 29, 23, 59, 59, 59, 59);
            final int offset = 1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 9, 2);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 3 week from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = 3;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 9, 16);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('different weekStartDay', () {
          test(
              'should return the correct date after adding 3 week from the original date with Tuesday as the start of the week',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = 3;
            final WeekStartDay weekStartDay = WeekStartDay.tuesday;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 9, 17);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 3 week from the original date with Wednesday as the start of the week',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = 3;
            final WeekStartDay weekStartDay = WeekStartDay.wednesday;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 9, 11);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 3 week from the original date with Thursday as the start of the week',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = 3;
            final WeekStartDay weekStartDay = WeekStartDay.thursday;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 9, 12);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 3 week from the original date with Friday as the start of the week',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = 3;
            final WeekStartDay weekStartDay = WeekStartDay.friday;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 9, 13);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 3 week from the original date with Saturday as the start of the week',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = 3;
            final WeekStartDay weekStartDay = WeekStartDay.saturday;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 9, 14);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 3 week from the original date with Sunday as the start of the week',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = 3;
            final WeekStartDay weekStartDay = WeekStartDay.sunday;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 9, 15);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });
      });

      group('Time Unit Calculations - Month', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.month;
        });
        group('Negative Offset', () {
          test(
              'should return the correct date after subtracting 1 month from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = -1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 7);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after subtracting 3 months from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = -3;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 5);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'should return the original date when the offset is 0 and the original date is at the start of the month',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 8);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current month when the offset is 0',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 12, 8, 22, 30, 28);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 8);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current month when the offset is 0 and date is at the last hour of the month',
              () {
            // arrange
            final DateTime date = DateTime(2024, 9, 30, 23, 59, 59, 59, 59);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 9);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'should return the correct date after adding 1 month from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 29, 23, 59, 59, 59, 59);
            final int offset = 1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 9);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 3 months from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = 3;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 11);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });
      });

      group('Time Unit Calculations - Year', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.year;
        });
        group('Negative Offset', () {
          test(
              'should return the correct date after subtracting 1 year from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = -1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after subtracting 5 years from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = -5;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2019);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'should return the original date when the offset is 0 and the original date is at the start of the year',
              () {
            // arrange
            final DateTime date = DateTime(2024);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current year when the offset is 0',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 12, 8, 22, 30, 28);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the start of the current month when the offset is 0 and date is at the last hour of the month',
              () {
            // arrange
            final DateTime date = DateTime(2024, 12, 31, 23, 59, 59, 59, 59);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'should return the correct date after adding 1 year from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 29, 23, 59, 59, 59, 59);
            final int offset = 1;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2025);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });

          test(
              'should return the correct date after adding 3 years from the original date',
              () {
            // arrange
            final DateTime date = DateTime(2024, 8, 27, 3, 54, 12);
            final int offset = 3;
            // act
            final DateTime result = TimeFinder.findDate(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2027);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          });
        });
      });

      group('Edge cases', () {
        test('Leap year - Transitioning to February 29 with Second unit', () {
          // arrange
          final date = DateTime(2020, 2, 28, 23, 59, 59);
          final timeUnit = TimeUnit.second;
          final offset = 1;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2020, 2, 29);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Leap year - Transitioning from February 29 with Second unit', () {
          // arrange
          final date = DateTime(2020, 2, 29, 23, 59, 59);
          final timeUnit = TimeUnit.second;
          final offset = 1;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2020, 3, 1);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Leap year - Transitioning to February 29 with Day unit', () {
          // arrange
          final date = DateTime(2020, 2, 26, 12, 40, 2);
          final timeUnit = TimeUnit.day;
          final offset = 3;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2020, 2, 29);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Leap year - Transitioning from February 29 with Day unit', () {
          // arrange
          final date = DateTime(2020, 2, 29);
          final timeUnit = TimeUnit.day;
          final offset = 3;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2020, 3, 3);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Year end transition with Second unit - Positive offset', () {
          // arrange
          final date = DateTime(2020, 12, 31, 23, 59, 59);
          final timeUnit = TimeUnit.second;
          final offset = 1;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2021, 1, 1);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Year start transition with Second unit - Negative offset', () {
          // arrange
          final date = DateTime(2021, 1, 1);
          final timeUnit = TimeUnit.second;
          final offset = -1;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2020, 12, 31, 23, 59, 59);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Year end transition with Month unit - Positive offset', () {
          // arrange
          final date = DateTime(2020, 3, 31, 23, 59, 59);
          final timeUnit = TimeUnit.month;
          final offset = 10;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2021, 1, 1);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Year start transition with Month unit - Negative offset', () {
          // arrange
          final date = DateTime(2021, 2, 2);
          final timeUnit = TimeUnit.month;
          final offset = -2;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2020, 12, 1);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Second unit', () {
          // arrange
          final date = DateTime(2024, 9, 1);
          final timeUnit = TimeUnit.second;
          final offset = 457100;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2024, 9, 6, 6, 58, 20);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Second unit - 2', () {
          // arrange
          final date = DateTime(2024, 9, 1);
          final timeUnit = TimeUnit.second;
          final offset = 3480146750;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2134, 12, 13, 11, 25, 50);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Minute unit', () {
          // arrange
          final date = DateTime(2024, 9, 1);
          final timeUnit = TimeUnit.minute;
          final offset = 175000;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2024, 12, 31, 12, 40);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Minute unit - 2', () {
          // arrange
          final date = DateTime(2024, 9, 1);
          final timeUnit = TimeUnit.minute;
          final offset = 274610205;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2546, 10, 16, 12, 45);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Hour unit', () {
          // arrange
          final date = DateTime(2024, 9, 1);
          final timeUnit = TimeUnit.hour;
          final offset = 146700;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2041, 5, 27, 12);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Hour unit - 2', () {
          // arrange
          final date = DateTime(2024, 9, 1);
          final timeUnit = TimeUnit.hour;
          final offset = 10000000;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(3165, 6, 18, 16);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Day unit', () {
          // arrange
          final date = DateTime(2024, 9, 1);
          final timeUnit = TimeUnit.day;
          final offset = 10465;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2053, 4, 27);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Day unit - 2', () {
          // arrange
          final date = DateTime(2024, 9, 1);
          final timeUnit = TimeUnit.day;
          final offset = 244244;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2693, 5, 21);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Week unit', () {
          // arrange
          final date = DateTime(2024, 9, 1);
          final timeUnit = TimeUnit.week;
          final offset = 52;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2025, 8, 25);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Month unit', () {
          // arrange
          final date = DateTime(2024, 9, 1);
          final timeUnit = TimeUnit.month;
          final offset = 5000;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2441, 5, 1);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Year unit', () {
          // arrange
          final date = DateTime(2024, 9, 1);
          final timeUnit = TimeUnit.year;
          final offset = 748;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(2772, 1, 1);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });

        test('Very large offset - Year unit - 2', () {
          // arrange
          final date = DateTime(2024, 2, 1);
          final timeUnit = TimeUnit.year;
          final offset = 3756;
          // act
          final result = TimeFinder.findDate(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedResult = DateTime(5780, 1, 1);
          final eval = expectedResult.isAtSameMomentAs(result);
          expect(eval, isTrue);
        });
      });
    });

    group('findSecondWithOffset Function -', () {
      group('Negative Offset', () {
        test(
          'should return the correct date after subtracting 10 seconds from the original date',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 10);
            final int offset = -10;
            // act
            final DateTime result = TimeFinder.findSecondWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 20);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when subtracting 30 seconds',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 0, 0, 20);
            final int offset = -30;
            // act
            final DateTime result = TimeFinder.findSecondWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 25, 23, 59, 50);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Zero Offset', () {
        test(
          'should return the start of the second when the offset is zero',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 10);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findSecondWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 30);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the original date when the offset is zero and the second has no fractions',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findSecondWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 30);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Positive Offset', () {
        test(
          'should return the correct date after adding 10 seconds to the original date',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 10);
            final int offset = 10;
            // act
            final DateTime result = TimeFinder.findSecondWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22, 40);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when adding 40 seconds',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 23, 59, 30);
            final int offset = 40;
            // act
            final DateTime result = TimeFinder.findSecondWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 27, 0, 0, 10);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });
    });

    group('findMinuteWithOffset Function -', () {
      group('Negative Offset', () {
        test(
          'should return the correct date after subtracting 10 minutes from the original date',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 10);
            final int offset = -10;
            // act
            final DateTime result = TimeFinder.findMinuteWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 12);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when subtracting 30 minutes',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 0, 10, 0);
            final int offset = -30;
            // act
            final DateTime result = TimeFinder.findMinuteWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 25, 23, 40);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Zero Offset', () {
        test(
          'should return the original date with fractional seconds removed when the offset is zero',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 10);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findMinuteWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the original date when the offset is zero and the minute has no fractions',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findMinuteWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26, 8, 22);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Positive Offset', () {
        test(
          'should return the correct date after adding 10 minutes to the original date, with fractional seconds removed',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 10);
            final int offset = 10;
            // act
            final DateTime result = TimeFinder.findMinuteWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult =
                DateTime(2024, 3, 26, 8, 32); // no fractional seconds
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when adding 40 minutes, with fractional seconds removed',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 23, 50, 0);
            final int offset = 40;
            // act
            final DateTime result = TimeFinder.findMinuteWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 27, 0, 30);
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });
    });

    group('findHourWithOffset Function -', () {
      group('Negative Offset', () {
        test(
          'should return the correct date after subtracting 2 hours from the original date',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 10);
            final int offset = -2;
            // act
            final DateTime result = TimeFinder.findHourWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26,
                6); // no fractional seconds, minutes, or smaller units
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when subtracting 10 hours',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 5, 0, 0);
            final int offset = -10;
            // act
            final DateTime result = TimeFinder.findHourWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 25,
                19); // no fractional seconds, minutes, or smaller units
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Zero Offset', () {
        test(
          'should return the original date with fractional units removed when the offset is zero',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 0, 30, 10);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findHourWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26,
                8); // no fractional seconds, minutes, or smaller units
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the original date when the offset is zero and the hour has no fractions',
          () {
            // arrange
            final DateTime date =
                DateTime(2024, 3, 26, 8); // no minutes or smaller units
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findHourWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26,
                8); // no fractional seconds, minutes, or smaller units
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Positive Offset', () {
        test(
          'should return the correct date after adding 3 hours to the original date, with fractional seconds removed',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 30, 30, 10);
            final int offset = 3;
            // act
            final DateTime result = TimeFinder.findHourWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 26,
                11); // no fractional seconds, minutes, or smaller units
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when adding 10 hours, with fractional seconds removed',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 18, 0, 0);
            final int offset = 10;
            // act
            final DateTime result = TimeFinder.findHourWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3, 27,
                4); // no fractional seconds, minutes, or smaller units
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });
    });

    group('findDayWithOffset Function -', () {
      group('Negative Offset', () {
        test(
          'should return the correct date after subtracting 5 days from the original date',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 10);
            final int offset = -5;
            // act
            final DateTime result = TimeFinder.findDayWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 3, 21); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when subtracting 10 days',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 10);
            final int offset = -10;
            // act
            final DateTime result = TimeFinder.findDayWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 2, 29); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Zero Offset', () {
        test(
          'should return the original date with fractional units removed when the offset is zero',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 8, 22, 30, 10);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDayWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 3, 26); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the original date when the offset is zero and the day has no fractions',
          () {
            // arrange
            final DateTime date = DateTime(
                2024, 3, 26); // no fractional seconds, minutes, or hours
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findDayWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 3, 26); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Positive Offset', () {
        test(
          'should return the correct date after adding 5 days to the original date',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 26, 12, 18);
            final int offset = 5;
            // act
            final DateTime result = TimeFinder.findDayWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 3, 31); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when adding 12 days',
          () {
            // arrange
            final DateTime date = DateTime(2024, 3, 20);
            final int offset = 12;
            // act
            final DateTime result = TimeFinder.findDayWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 4, 1); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });
    });

    group('findWeekWithOffset Function -', () {
      group('Negative Offset', () {
        test(
          'should return the correct date after subtracting 1 week from the original date with Monday as the start of the week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 28, 12, 18);
            final int offset = -1;
            final WeekStartDay weekStartDay = WeekStartDay.monday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 8, 19); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the correct date after subtracting 1 week from the original date with Monday as the start of the week, and given a date at the very beginning of the current week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 26);
            final int offset = -1;
            final WeekStartDay weekStartDay = WeekStartDay.monday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 8, 19); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the correct date after subtracting 1 week from the original date with Monday as the start of the week, and given a date at the very end of the current week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 9, 1, 23, 59, 59, 59);
            final int offset = -1;
            final WeekStartDay weekStartDay = WeekStartDay.monday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 8, 19); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the correct date after subtracting 1 week from the original date with Sunday as the start of the week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 28, 12, 18);
            final int offset = -1;
            final WeekStartDay weekStartDay = WeekStartDay.sunday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 8, 18); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the correct date after subtracting 3 week from the original date with Sunday as the start of the week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 28, 12, 18);
            final int offset = -3;
            final WeekStartDay weekStartDay = WeekStartDay.sunday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 8, 4); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Zero Offset', () {
        test(
          'should return the correct date with zero offset from the original date with Sunday as the start of the week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 28, 12, 18);
            final int offset = 0;
            final WeekStartDay weekStartDay = WeekStartDay.sunday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 8, 25); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the correct date with zero offset from the original date with Monday as the start of the week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 28, 12, 18);
            final int offset = 0;
            final WeekStartDay weekStartDay = WeekStartDay.monday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 8, 26); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the correct date with zero offset from the original date with Monday as the start of the week and the given date is at the very start of the week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 26);
            final int offset = 0;
            final WeekStartDay weekStartDay = WeekStartDay.monday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 8, 26); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the correct date with zero offset from the original date with Monday as the start of the week and the given date is at the very end of the week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 9, 1, 23, 59, 59, 59);
            final int offset = 0;
            final WeekStartDay weekStartDay = WeekStartDay.monday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 8, 26); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Positive Offset', () {
        test(
          'should return the correct date after adding 1 week from the original date with Monday as the start of the week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 28, 12, 18);
            final int offset = 1;
            final WeekStartDay weekStartDay = WeekStartDay.monday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 9, 2); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the correct date after adding 1 week from the original date with Monday as the start of the week, and given a date at the very beginning of the current week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 26);
            final int offset = 1;
            final WeekStartDay weekStartDay = WeekStartDay.monday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 9, 2); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the correct date after adding 1 week from the original date with Monday as the start of the week, and given a date at the very end of the current week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 9, 1, 23, 59, 59, 59);
            final int offset = 1;
            final WeekStartDay weekStartDay = WeekStartDay.monday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 9, 2); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the correct date after adding 1 week from the original date with Sunday as the start of the week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 28, 12, 18);
            final int offset = 1;
            final WeekStartDay weekStartDay = WeekStartDay.sunday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 9, 1); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the correct date after adding 3 week from the original date with Sunday as the start of the week',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 28, 12, 18);
            final int offset = 3;
            final WeekStartDay weekStartDay = WeekStartDay.sunday;
            // act
            final DateTime result = TimeFinder.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            );
            // assert
            final DateTime expectedResult = DateTime(
                2024, 9, 15); // no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });
    });

    group('findMonthWithOffset Function -', () {
      group('Negative Offset', () {
        test(
          'should return the correct date after subtracting 5 months from the original date',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 26, 10);
            final int offset = -5;
            // act
            final DateTime result = TimeFinder.findMonthWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 3,
                1); // start of the month, no fractional seconds, minutes, hours, or days
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when subtracting 10 months',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 10);
            final int offset = -10;
            // act
            final DateTime result = TimeFinder.findMonthWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2023, 10,
                1); // start of the month, no fractional seconds, minutes, hours, or days
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Zero Offset', () {
        test(
          'should return the start of the current month with fractional units removed when the offset is zero',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 26, 8, 22, 30, 10);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findMonthWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 8,
                1); // start of the month, no fractional seconds, minutes, hours, or days
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the start of the current month when the offset is zero and the date has no fractions',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 1);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findMonthWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 8,
                1); // start of the month, no fractional seconds, minutes, hours, or days
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Positive Offset', () {
        test(
          'should return the correct date after adding 5 months to the original date',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 26, 12, 18);
            final int offset = 5;
            // act
            final DateTime result = TimeFinder.findMonthWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2025, 1,
                1); // start of the month, no fractional seconds, minutes, hours, or days
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when adding 12 months',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 20);
            final int offset = 12;
            // act
            final DateTime result = TimeFinder.findMonthWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2025, 8,
                1); // start of the month, no fractional seconds, minutes, hours, or days
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });
    });

    group('findYearWithOffset Function -', () {
      group('Negative Offset', () {
        test(
          'should return the correct date after subtracting 2 years from the original date',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 26, 10);
            final int offset = -2;
            // act
            final DateTime result = TimeFinder.findYearWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2022, 1,
                1); // start of the year, no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when subtracting 10 years',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 10);
            final int offset = -10;
            // act
            final DateTime result = TimeFinder.findYearWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2014, 1,
                1); // start of the year, no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Zero Offset', () {
        test(
          'should return the start of the current year with fractional units removed when the offset is zero',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 26, 8, 22, 30, 10);
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findYearWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 1,
                1); // start of the year, no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should return the start of the current year when the offset is zero and the year has no fractions',
          () {
            // arrange
            final DateTime date = DateTime(
                2024, 1, 1); // no fractional seconds, minutes, or hours
            final int offset = 0;
            // act
            final DateTime result = TimeFinder.findYearWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2024, 1,
                1); // start of the year, no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });

      group('Positive Offset', () {
        test(
          'should return the correct date after adding 3 years to the original date',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 26, 12, 18);
            final int offset = 3;
            // act
            final DateTime result = TimeFinder.findYearWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2027, 1,
                1); // start of the year, no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );

        test(
          'should handle offset causing a date change when adding 7 years',
          () {
            // arrange
            final DateTime date = DateTime(2024, 8, 20);
            final int offset = 7;
            // act
            final DateTime result = TimeFinder.findYearWithOffset(
              date: date,
              offset: offset,
            );
            // assert
            final DateTime expectedResult = DateTime(2031, 1,
                1); // start of the year, no fractional seconds, minutes, or hours
            final bool eval = expectedResult.compareTo(result) == 0;
            expect(eval, isTrue);
          },
        );
      });
    });

    group('...FromNow Functions -', () {
      test('nextSecondFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextSecondFromNow();
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextMinuteFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextMinuteFromNow();
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextHourFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextHourFromNow();
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextDayFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextDayFromNow();
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextWeekFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextWeekFromNow(
          weekStartDay: WeekStartDay.monday,
        );
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextWeekFromNow Function - different weekStartDay', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextWeekFromNow(
          weekStartDay: WeekStartDay.wednesday,
        );
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextMonthFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextMonthFromNow();
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextYearFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextYearFromNow();
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('previousSecondFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousSecondFromNow();
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousMinuteFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousMinuteFromNow();
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousHourFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousHourFromNow();
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousDayFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousDayFromNow();
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousWeekFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousWeekFromNow(
          weekStartDay: WeekStartDay.monday,
        );
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousWeekFromNow Function - different weekStartDay', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousWeekFromNow(
          weekStartDay: WeekStartDay.wednesday,
        );
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousMonthFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousMonthFromNow();
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousYearFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousYearFromNow();
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('currentSecondFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentSecondFromNow();
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentMinuteFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentMinuteFromNow();
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentHourFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentHourFromNow();
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentDayFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentDayFromNow();
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentWeekFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentWeekFromNow(
          weekStartDay: WeekStartDay.monday,
        );
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentWeekFromNow Function - different weekStartDay', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentWeekFromNow(
          weekStartDay: WeekStartDay.wednesday,
        );
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentMonthFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentMonthFromNow();
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentYearFromNow Function', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentYearFromNow();
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });
    });

    group('...FromDate Functions -', () {
      test('nextSecondFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextSecondFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextMinuteFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextMinuteFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextHourFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextHourFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextDayFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextDayFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextWeekFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextWeekFromDate(
          date: currentTime,
          weekStartDay: WeekStartDay.monday,
        );
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test(
          'nextWeekFromDate Function - test with DateTime.now() - different weekStartDay',
          () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextWeekFromDate(
          date: currentTime,
          weekStartDay: WeekStartDay.wednesday,
        );
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextMonthFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextMonthFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('nextYearFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.nextYearFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isAfter(currentTime);
        expect(eval, isTrue);
      });

      test('previousSecondFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousSecondFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousMinuteFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousMinuteFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousHourFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousHourFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousDayFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousDayFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousWeekFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousWeekFromDate(
          date: currentTime,
          weekStartDay: WeekStartDay.monday,
        );
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test(
          'previousWeekFromDate Function - test with DateTime.now() - different weekStartDay',
          () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousWeekFromDate(
          date: currentTime,
          weekStartDay: WeekStartDay.wednesday,
        );
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousMonthFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousMonthFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('previousYearFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.previousYearFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime);
        expect(eval, isTrue);
      });

      test('currentSecondFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentSecondFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentMinuteFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentMinuteFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentHourFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentHourFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentDayFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentDayFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentWeekFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentWeekFromDate(
          date: currentTime,
          weekStartDay: WeekStartDay.monday,
        );
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test(
          'currentWeekFromDate Function - test with DateTime.now() - different weekStartDay',
          () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentWeekFromDate(
          date: currentTime,
          weekStartDay: WeekStartDay.wednesday,
        );
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentMonthFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentMonthFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });

      test('currentYearFromDate Function - test with DateTime.now()', () {
        // arrange
        final currentTime = DateTime.now();
        // act
        final result = TimeFinder.currentYearFromDate(
          currentTime,
        );
        // assert
        final bool eval = result.isBefore(currentTime) ||
            result.isAtSameMomentAs(currentTime);
        expect(eval, isTrue);
      });
    });

    group('...FromDate and ...WithOffset Equivalence', () {
      // compare the results of the offset functions with their equivalence from FromDate functions, they must be the same
      test('nextSecondFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.nextSecondFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findSecondWithOffset(
          date: date,
          offset: 1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('nextMinuteFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.nextMinuteFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findMinuteWithOffset(
          date: date,
          offset: 1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('nextHourFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.nextHourFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findHourWithOffset(
          date: date,
          offset: 1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('nextDayFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.nextDayFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findDayWithOffset(
          date: date,
          offset: 1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('nextWeekFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        final WeekStartDay weekStartDay = WeekStartDay.monday;
        // act
        final fromDateResult = TimeFinder.nextWeekFromDate(
          date: date,
          weekStartDay: weekStartDay,
        );
        final withOffsetResult = TimeFinder.findWeekWithOffset(
          date: date,
          offset: 1,
          weekStartDay: weekStartDay,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('nextWeekFromDate Function - Equivalence - different weekStartDay',
          () {
        // arrange
        final date = DateTime(2024, 8, 17);
        final WeekStartDay weekStartDay = WeekStartDay.wednesday;
        // act
        final fromDateResult = TimeFinder.nextWeekFromDate(
          date: date,
          weekStartDay: weekStartDay,
        );
        final withOffsetResult = TimeFinder.findWeekWithOffset(
          date: date,
          offset: 1,
          weekStartDay: weekStartDay,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('nextMonthFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.nextMonthFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findMonthWithOffset(
          date: date,
          offset: 1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('nextYearFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.nextYearFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findYearWithOffset(
          date: date,
          offset: 1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('previousSecondFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.previousSecondFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findSecondWithOffset(
          date: date,
          offset: -1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('previousMinuteFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.previousMinuteFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findMinuteWithOffset(
          date: date,
          offset: -1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('previousHourFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.previousHourFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findHourWithOffset(
          date: date,
          offset: -1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('previousDayFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.previousDayFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findDayWithOffset(
          date: date,
          offset: -1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('previousWeekFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        final WeekStartDay weekStartDay = WeekStartDay.monday;
        // act
        final fromDateResult = TimeFinder.previousWeekFromDate(
          date: date,
          weekStartDay: weekStartDay,
        );
        final withOffsetResult = TimeFinder.findWeekWithOffset(
          date: date,
          offset: -1,
          weekStartDay: weekStartDay,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test(
          'previousWeekFromDate Function - Equivalence - different weekStartDay',
          () {
        // arrange
        final date = DateTime(2024, 8, 17);
        final WeekStartDay weekStartDay = WeekStartDay.wednesday;
        // act
        final fromDateResult = TimeFinder.previousWeekFromDate(
          date: date,
          weekStartDay: weekStartDay,
        );
        final withOffsetResult = TimeFinder.findWeekWithOffset(
          date: date,
          offset: -1,
          weekStartDay: weekStartDay,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('previousMonthFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.previousMonthFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findMonthWithOffset(
          date: date,
          offset: -1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('previousYearFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.previousYearFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findYearWithOffset(
          date: date,
          offset: -1,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('currentSecondFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.currentSecondFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findSecondWithOffset(
          date: date,
          offset: 0,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('currentMinuteFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.currentMinuteFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findMinuteWithOffset(
          date: date,
          offset: 0,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('currentHourFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.currentHourFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findHourWithOffset(
          date: date,
          offset: 0,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('currentDayFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.currentDayFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findDayWithOffset(
          date: date,
          offset: 0,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('currentWeekFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        final WeekStartDay weekStartDay = WeekStartDay.monday;
        // act
        final fromDateResult = TimeFinder.currentWeekFromDate(
          date: date,
          weekStartDay: weekStartDay,
        );
        final withOffsetResult = TimeFinder.findWeekWithOffset(
          date: date,
          offset: 0,
          weekStartDay: weekStartDay,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test(
          'currentWeekFromDate Function - Equivalence - different weekStartDay',
          () {
        // arrange
        final date = DateTime(2024, 8, 17);
        final WeekStartDay weekStartDay = WeekStartDay.wednesday;
        // act
        final fromDateResult = TimeFinder.currentWeekFromDate(
          date: date,
          weekStartDay: weekStartDay,
        );
        final withOffsetResult = TimeFinder.findWeekWithOffset(
          date: date,
          offset: 0,
          weekStartDay: weekStartDay,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('currentMonthFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.currentMonthFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findMonthWithOffset(
          date: date,
          offset: 0,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });

      test('currentYearFromDate Function - Equivalence', () {
        // arrange
        final date = DateTime(2024, 8, 17);
        // act
        final fromDateResult = TimeFinder.currentYearFromDate(
          date,
        );
        final withOffsetResult = TimeFinder.findYearWithOffset(
          date: date,
          offset: 0,
        );
        // assert
        final bool eval = fromDateResult.isAtSameMomentAs(withOffsetResult);
        expect(eval, isTrue);
      });
    });

    group('findDateRange Function -', () {
      group('Time Unit Calculations - Second', () {
        late TimeUnit interval;
        setUp(() {
          // Set up common parameters for the group of tests
          interval = TimeUnit.second;
        });
        test(
            'generates a correct list of DateTime objects given startDate and endDate - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 40, 0);
          final endDate = DateTime(2024, 9, 1, 12, 40, 5);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 40, 0),
            DateTime(2024, 9, 1, 12, 40, 1),
            DateTime(2024, 9, 1, 12, 40, 2),
            DateTime(2024, 9, 1, 12, 40, 3),
            DateTime(2024, 9, 1, 12, 40, 4),
            DateTime(2024, 9, 1, 12, 40, 5),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeStartDate is false - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 40, 0);
          final endDate = DateTime(2024, 9, 1, 12, 40, 5);
          final bool includeStartDate = false;
          final bool includeEndDate = true;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 40, 1),
            DateTime(2024, 9, 1, 12, 40, 2),
            DateTime(2024, 9, 1, 12, 40, 3),
            DateTime(2024, 9, 1, 12, 40, 4),
            DateTime(2024, 9, 1, 12, 40, 5),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeEndDate is false - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 40, 0);
          final endDate = DateTime(2024, 9, 1, 12, 40, 5);
          final bool includeStartDate = true;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 40, 0),
            DateTime(2024, 9, 1, 12, 40, 1),
            DateTime(2024, 9, 1, 12, 40, 2),
            DateTime(2024, 9, 1, 12, 40, 3),
            DateTime(2024, 9, 1, 12, 40, 4),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and both includeStartDate and includeEndDate are false - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 40, 0);
          final endDate = DateTime(2024, 9, 1, 12, 40, 5);
          final bool includeStartDate = false;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 40, 1),
            DateTime(2024, 9, 1, 12, 40, 2),
            DateTime(2024, 9, 1, 12, 40, 3),
            DateTime(2024, 9, 1, 12, 40, 4),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are a second apart - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 40, 0);
          final endDate = DateTime(2024, 9, 1, 12, 40, 1);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 40, 0),
            DateTime(2024, 9, 1, 12, 40, 1),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are less than a second apart - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 40, 0);
          final endDate = DateTime(2024, 9, 1, 12, 40, 0, 30);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 40, 0),
            DateTime(2024, 9, 1, 12, 40, 0, 30),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'throws an argument error when given startDate and endDate that are the same - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 40, 0);
          // Act & Assert
          expect(
            () => TimeFinder.findDateRange(
              startDate: startDate,
              endDate: startDate,
              interval: interval,
            ),
            throwsA(isA<ArgumentError>().having((e) => e.message, 'message',
                contains('startDate must be before endDate'))),
          );
        });
      });

      group('Time Unit Calculations - Minute', () {
        late TimeUnit interval;
        setUp(() {
          // Set up common parameters for the group of tests
          interval = TimeUnit.minute;
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate - Minute Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 10);
          final endDate = DateTime(2024, 9, 1, 12, 20);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 10),
            DateTime(2024, 9, 1, 12, 11),
            DateTime(2024, 9, 1, 12, 12),
            DateTime(2024, 9, 1, 12, 13),
            DateTime(2024, 9, 1, 12, 14),
            DateTime(2024, 9, 1, 12, 15),
            DateTime(2024, 9, 1, 12, 16),
            DateTime(2024, 9, 1, 12, 17),
            DateTime(2024, 9, 1, 12, 18),
            DateTime(2024, 9, 1, 12, 19),
            DateTime(2024, 9, 1, 12, 20),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeStartDate is false - Minute Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 10);
          final endDate = DateTime(2024, 9, 1, 12, 20);
          final bool includeStartDate = false;
          final bool includeEndDate = true;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 11),
            DateTime(2024, 9, 1, 12, 12),
            DateTime(2024, 9, 1, 12, 13),
            DateTime(2024, 9, 1, 12, 14),
            DateTime(2024, 9, 1, 12, 15),
            DateTime(2024, 9, 1, 12, 16),
            DateTime(2024, 9, 1, 12, 17),
            DateTime(2024, 9, 1, 12, 18),
            DateTime(2024, 9, 1, 12, 19),
            DateTime(2024, 9, 1, 12, 20),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeEndDate is false - Minute Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 10);
          final endDate = DateTime(2024, 9, 1, 12, 20);
          final bool includeStartDate = true;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 10),
            DateTime(2024, 9, 1, 12, 11),
            DateTime(2024, 9, 1, 12, 12),
            DateTime(2024, 9, 1, 12, 13),
            DateTime(2024, 9, 1, 12, 14),
            DateTime(2024, 9, 1, 12, 15),
            DateTime(2024, 9, 1, 12, 16),
            DateTime(2024, 9, 1, 12, 17),
            DateTime(2024, 9, 1, 12, 18),
            DateTime(2024, 9, 1, 12, 19),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and both includeStartDate and includeEndDate are false - Minute Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 10);
          final endDate = DateTime(2024, 9, 1, 12, 20);
          final bool includeStartDate = false;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 11),
            DateTime(2024, 9, 1, 12, 12),
            DateTime(2024, 9, 1, 12, 13),
            DateTime(2024, 9, 1, 12, 14),
            DateTime(2024, 9, 1, 12, 15),
            DateTime(2024, 9, 1, 12, 16),
            DateTime(2024, 9, 1, 12, 17),
            DateTime(2024, 9, 1, 12, 18),
            DateTime(2024, 9, 1, 12, 19),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are a minute apart - Minute Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 40);
          final endDate = DateTime(2024, 9, 1, 12, 41);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 40),
            DateTime(2024, 9, 1, 12, 41),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are less than a minute apart - Minute Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 40, 0);
          final endDate = DateTime(
            2024,
            9,
            1,
            12,
            40,
            30,
          );
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12, 40, 0),
            DateTime(
              2024,
              9,
              1,
              12,
              40,
              30,
            ),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'throws an argument error when given startDate and endDate that are the same - Minute Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12, 40, 0);
          // Act & Assert
          expect(
            () => TimeFinder.findDateRange(
              startDate: startDate,
              endDate: startDate,
              interval: interval,
            ),
            throwsA(isA<ArgumentError>().having((e) => e.message, 'message',
                contains('startDate must be before endDate'))),
          );
        });
      });

      group('Time Unit Calculations - Hour', () {
        late TimeUnit interval;
        setUp(() {
          // Set up common parameters for the group of tests
          interval = TimeUnit.hour;
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate - Hour Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 2);
          final endDate = DateTime(2024, 9, 1, 5);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 2),
            DateTime(2024, 9, 1, 3),
            DateTime(2024, 9, 1, 4),
            DateTime(2024, 9, 1, 5),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeStartDate is false - Hour Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 2);
          final endDate = DateTime(2024, 9, 1, 5);
          final bool includeStartDate = false;
          final bool includeEndDate = true;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 3),
            DateTime(2024, 9, 1, 4),
            DateTime(2024, 9, 1, 5),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeEndDate is false - Hour Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 2);
          final endDate = DateTime(2024, 9, 1, 5);
          final bool includeStartDate = true;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 2),
            DateTime(2024, 9, 1, 3),
            DateTime(2024, 9, 1, 4),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and both includeStartDate and includeEndDate are false - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 2);
          final endDate = DateTime(2024, 9, 1, 5);
          final bool includeStartDate = false;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 3),
            DateTime(2024, 9, 1, 4),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are an hour apart - Hour Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12);
          final endDate = DateTime(2024, 9, 1, 13);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12),
            DateTime(2024, 9, 1, 13),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are less than an hour apart - Hour Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 12);
          final endDate = DateTime(2024, 9, 1, 12, 40, 30);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1, 12),
            DateTime(2024, 9, 1, 12, 40, 30),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'throws an argument error when given startDate and endDate that are the same - Hour Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1, 5);
          // Act & Assert
          expect(
            () => TimeFinder.findDateRange(
              startDate: startDate,
              endDate: startDate,
              interval: interval,
            ),
            throwsA(isA<ArgumentError>().having((e) => e.message, 'message',
                contains('startDate must be before endDate'))),
          );
        });
      });

      group('Time Unit Calculations - Day', () {
        late TimeUnit interval;
        setUp(() {
          // Set up common parameters for the group of tests
          interval = TimeUnit.day;
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate - Day Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 8, 15, 2);
          final endDate = DateTime(2024, 8, 22);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 8, 15, 2),
            DateTime(2024, 8, 16),
            DateTime(2024, 8, 17),
            DateTime(2024, 8, 18),
            DateTime(2024, 8, 19),
            DateTime(2024, 8, 20),
            DateTime(2024, 8, 21),
            DateTime(2024, 8, 22),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeStartDate is false - Day Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 8, 15, 2);
          final endDate = DateTime(2024, 8, 22);
          final bool includeStartDate = false;
          final bool includeEndDate = true;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 8, 16),
            DateTime(2024, 8, 17),
            DateTime(2024, 8, 18),
            DateTime(2024, 8, 19),
            DateTime(2024, 8, 20),
            DateTime(2024, 8, 21),
            DateTime(2024, 8, 22),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeEndDate is false - Day Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 8, 15, 2);
          final endDate = DateTime(2024, 8, 22);
          final bool includeStartDate = true;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 8, 15, 2),
            DateTime(2024, 8, 16),
            DateTime(2024, 8, 17),
            DateTime(2024, 8, 18),
            DateTime(2024, 8, 19),
            DateTime(2024, 8, 20),
            DateTime(2024, 8, 21),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and both includeStartDate and includeEndDate are false - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 8, 15, 2);
          final endDate = DateTime(2024, 8, 22);
          final bool includeStartDate = false;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 8, 16),
            DateTime(2024, 8, 17),
            DateTime(2024, 8, 18),
            DateTime(2024, 8, 19),
            DateTime(2024, 8, 20),
            DateTime(2024, 8, 21),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are a day apart - Day Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 2);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1),
            DateTime(2024, 9, 2),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are less than a day apart - Day Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 1, 15, 40, 30);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1),
            DateTime(2024, 9, 1, 15, 40, 30),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'throws an argument error when given startDate and endDate that are the same - Day Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 8, 15);
          // Act & Assert
          expect(
            () => TimeFinder.findDateRange(
              startDate: startDate,
              endDate: startDate,
              interval: interval,
            ),
            throwsA(isA<ArgumentError>().having((e) => e.message, 'message',
                contains('startDate must be before endDate'))),
          );
        });
      });

      group('Time Unit Calculations - Week', () {
        late TimeUnit interval;
        setUp(() {
          // Set up common parameters for the group of tests
          interval = TimeUnit.week;
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate - Week Unit (default parameters)',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 20);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 8, 26),
            DateTime(2024, 9, 2),
            DateTime(2024, 9, 9),
            DateTime(2024, 9, 16),
            DateTime(2024, 9, 23),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate - Week Unit with Sunday as weekStartDay',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 20);
          final weekStartDay = WeekStartDay.sunday;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            weekStartDay: weekStartDay,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1),
            DateTime(2024, 9, 8),
            DateTime(2024, 9, 15),
            DateTime(2024, 9, 22),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate - Week Unit with Friday as weekStartDay',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 20);
          final weekStartDay = WeekStartDay.friday;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            weekStartDay: weekStartDay,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 8, 30),
            DateTime(2024, 9, 6),
            DateTime(2024, 9, 13),
            DateTime(2024, 9, 20),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeStartDate is false - Week Unit (default parameters)',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 20);
          final bool includeStartDate = false;
          final bool includeEndDate = true;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 2),
            DateTime(2024, 9, 9),
            DateTime(2024, 9, 16),
            DateTime(2024, 9, 23),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeEndDate is false - Week Unit (default parameters)',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 20);
          final bool includeStartDate = true;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 8, 26),
            DateTime(2024, 9, 2),
            DateTime(2024, 9, 9),
            DateTime(2024, 9, 16),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and both includeStartDate and includeEndDate are false - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 20);
          final bool includeStartDate = false;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 2),
            DateTime(2024, 9, 9),
            DateTime(2024, 9, 16),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are a week apart - Week Unit (default parameters)',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 2);
          final endDate = DateTime(2024, 9, 9);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 2),
            DateTime(2024, 9, 9),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are less than a week apart - Week Unit (default parameters)',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 2);
          final endDate = DateTime(2024, 9, 5);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 2),
            DateTime(2024, 9, 9),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'throws an argument error when given startDate and endDate that are the same - Week Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 8, 25);
          // Act & Assert
          expect(
            () => TimeFinder.findDateRange(
              startDate: startDate,
              endDate: startDate,
              interval: interval,
            ),
            throwsA(isA<ArgumentError>().having((e) => e.message, 'message',
                contains('startDate must be before endDate'))),
          );
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate - Week Unit with WeekDateRangeOptions.alignToStartDate',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 20);
          final weekDateRangeOptions = WeekDateRangeOptions.alignToStartDate;
          final weekStartDay = WeekStartDay.monday;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            weekDateRangeOptions: weekDateRangeOptions,
            weekStartDay: weekStartDay,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1),
            DateTime(2024, 9, 8),
            DateTime(2024, 9, 15),
            DateTime(2024, 9, 20),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeStartDate is false - Week Unit with WeekDateRangeOptions.alignToStartDate',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 20);
          final weekDateRangeOptions = WeekDateRangeOptions.alignToStartDate;
          final weekStartDay = WeekStartDay.monday;
          final includeStartDate = false;
          final includeEndDate = true;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
            weekDateRangeOptions: weekDateRangeOptions,
            weekStartDay: weekStartDay,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 8),
            DateTime(2024, 9, 15),
            DateTime(2024, 9, 20),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeEndDate is false - Week Unit with WeekDateRangeOptions.alignToStartDate',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 20);
          final weekDateRangeOptions = WeekDateRangeOptions.alignToStartDate;
          final weekStartDay = WeekStartDay.monday;
          final includeStartDate = true;
          final includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
            weekDateRangeOptions: weekDateRangeOptions,
            weekStartDay: weekStartDay,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1),
            DateTime(2024, 9, 8),
            DateTime(2024, 9, 15),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and both includeStartDate and includeEndDate are false - Week Unit with WeekDateRangeOptions.alignToStartDate',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 20);
          final weekDateRangeOptions = WeekDateRangeOptions.alignToStartDate;
          final weekStartDay = WeekStartDay.monday;
          final includeStartDate = false;
          final includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
            weekDateRangeOptions: weekDateRangeOptions,
            weekStartDay: weekStartDay,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 8),
            DateTime(2024, 9, 15),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are a week apart - Week Unit with WeekDateRangeOptions.alignToStartDate',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 8);
          final weekDateRangeOptions = WeekDateRangeOptions.alignToStartDate;
          final weekStartDay = WeekStartDay.monday;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            weekDateRangeOptions: weekDateRangeOptions,
            weekStartDay: weekStartDay,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1),
            DateTime(2024, 9, 8),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are less than a week apart - Week Unit with WeekDateRangeOptions.alignToStartDate',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 5);
          final weekDateRangeOptions = WeekDateRangeOptions.alignToStartDate;
          final weekStartDay = WeekStartDay.monday;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            weekDateRangeOptions: weekDateRangeOptions,
            weekStartDay: weekStartDay,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1),
            DateTime(2024, 9, 5),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });
      });

      group('Time Unit Calculations - Month', () {
        late TimeUnit interval;
        setUp(() {
          // Set up common parameters for the group of tests
          interval = TimeUnit.month;
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate - Month Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 1, 1);
          final endDate = DateTime(2024, 5, 1);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 1, 1),
            DateTime(2024, 2, 1),
            DateTime(2024, 3, 1),
            DateTime(2024, 4, 1),
            DateTime(2024, 5, 1),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeStartDate is false - Month Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 1, 1);
          final endDate = DateTime(2024, 5, 1);
          final bool includeStartDate = false;
          final bool includeEndDate = true;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 2, 1),
            DateTime(2024, 3, 1),
            DateTime(2024, 4, 1),
            DateTime(2024, 5, 1),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeEndDate is false - Month Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 1, 1);
          final endDate = DateTime(2024, 5, 1);
          final bool includeStartDate = true;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 1, 1),
            DateTime(2024, 2, 1),
            DateTime(2024, 3, 1),
            DateTime(2024, 4, 1),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and both includeStartDate and includeEndDate are false - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 1, 1);
          final endDate = DateTime(2024, 5, 1);
          final bool includeStartDate = false;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 2, 1),
            DateTime(2024, 3, 1),
            DateTime(2024, 4, 1),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are a month apart - Month Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 10, 1);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1),
            DateTime(2024, 10, 1),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are less than a month apart - Month Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 9, 1);
          final endDate = DateTime(2024, 9, 15);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 9, 1),
            DateTime(2024, 9, 15),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'throws an argument error when given startDate and endDate that are the same - Month Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 4);
          // Act & Assert
          expect(
            () => TimeFinder.findDateRange(
              startDate: startDate,
              endDate: startDate,
              interval: interval,
            ),
            throwsA(isA<ArgumentError>().having((e) => e.message, 'message',
                contains('startDate must be before endDate'))),
          );
        });
      });

      group('Time Unit Calculations - Year', () {
        late TimeUnit interval;
        setUp(() {
          // Set up common parameters for the group of tests
          interval = TimeUnit.year;
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate - Year Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 4, 1);
          final endDate = DateTime(2028, 5, 1);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 4, 1),
            DateTime(2025, 1, 1),
            DateTime(2026, 1, 1),
            DateTime(2027, 1, 1),
            DateTime(2028, 1, 1),
            DateTime(2028, 5, 1),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeStartDate is false - Year Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 4, 1);
          final endDate = DateTime(2028, 5, 1);
          final bool includeStartDate = false;
          final bool includeEndDate = true;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2025, 1, 1),
            DateTime(2026, 1, 1),
            DateTime(2027, 1, 1),
            DateTime(2028, 1, 1),
            DateTime(2028, 5, 1),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and includeEndDate is false - Year Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 4, 1);
          final endDate = DateTime(2028, 5, 1);
          final bool includeStartDate = true;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 4, 1),
            DateTime(2025, 1, 1),
            DateTime(2026, 1, 1),
            DateTime(2027, 1, 1),
            DateTime(2028, 1, 1),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate and both includeStartDate and includeEndDate are false - Second Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 4, 1);
          final endDate = DateTime(2028, 5, 1);
          final bool includeStartDate = false;
          final bool includeEndDate = false;
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
            includeStartDate: includeStartDate,
            includeEndDate: includeEndDate,
          );
          // assert
          final expectedResult = [
            DateTime(2025, 1, 1),
            DateTime(2026, 1, 1),
            DateTime(2027, 1, 1),
            DateTime(2028, 1, 1),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are a year apart - Year Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 1, 1);
          final endDate = DateTime(2025, 1, 1);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 1, 1),
            DateTime(2025, 1, 1),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'generates a correct list of DateTime objects given startDate and endDate that are less than a year apart - Year Unit',
            () {
          // arrange
          final startDate = DateTime(2024, 1, 1);
          final endDate = DateTime(2024, 9, 15);
          // act
          final result = TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          );
          // assert
          final expectedResult = [
            DateTime(2024, 1, 1),
            DateTime(2024, 9, 15),
          ];
          final bool equalLength = result.length == expectedResult.length;
          expect(equalLength, isTrue);
          bool equalElements = true;
          for (int i = 0; i < expectedResult.length; i++) {
            if (!expectedResult[i].isAtSameMomentAs(result[i])) {
              equalElements = false;
            }
          }
          expect(equalElements, isTrue);
        });

        test(
            'throws an argument error when given startDate and endDate that are the same - Year Unit',
            () {
          // arrange
          final startDate = DateTime(2023);
          // Act & Assert
          expect(
            () => TimeFinder.findDateRange(
              startDate: startDate,
              endDate: startDate,
              interval: interval,
            ),
            throwsA(isA<ArgumentError>().having((e) => e.message, 'message',
                contains('startDate must be before endDate'))),
          );
        });
      });

      test('throws an argument error when given startDate after endDate', () {
        // arrange
        final startDate = DateTime(2024, 9, 1, 5);
        final endDate = DateTime(2024, 5, 1, 5);
        final interval = TimeUnit.hour;
        // Act & Assert
        expect(
          () => TimeFinder.findDateRange(
            startDate: startDate,
            endDate: endDate,
            interval: interval,
          ),
          throwsA(isA<ArgumentError>().having((e) => e.message, 'message',
              contains('startDate must be before endDate'))),
        );
      });

      test(
          'returns an empty list when startDate and endDate are a day apart and both includeStartDate and includeEndDate are false - Day Unit',
          () {
        // arrange
        final startDate = DateTime(2024, 9, 1);
        final endDate = DateTime(2024, 9, 2);
        final interval = TimeUnit.day;
        final includeStartDate = false;
        final includeEndDate = false;
        // act
        final result = TimeFinder.findDateRange(
          startDate: startDate,
          endDate: endDate,
          interval: interval,
          includeStartDate: includeStartDate,
          includeEndDate: includeEndDate,
        );
        // assert
        expect(result.isEmpty, isTrue);
      });
    });

    group('findTimeUnitBoundariesWithOffset Function -', () {
      group('Time Unit Calculations - Second', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.second;
        });

        group('Negative Offset', () {
          test(
              'calculates start and end boundaries for 2 seconds prior to the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 25);
            final offset = -2;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30, 38);
            final expectedEnd = DateTime(2024, 9, 1, 4, 30, 39);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 2 seconds prior to the given date that start at the very beginning of the second',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40);
            final offset = -2;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30, 38);
            final expectedEnd = DateTime(2024, 9, 1, 4, 30, 39);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 2 seconds prior to the given date that start at the very end of the second',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 59, 59);
            final offset = -2;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30, 38);
            final expectedEnd = DateTime(2024, 9, 1, 4, 30, 39);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'calculates start and end boundaries for the current second of the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 25);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30, 40);
            final expectedEnd = DateTime(2024, 9, 1, 4, 30, 41);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current second of the given date that start at the very beginning of the second',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30, 40);
            final expectedEnd = DateTime(2024, 9, 1, 4, 30, 41);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current second of the given date that start at the very end of the second',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 59, 59);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30, 40);
            final expectedEnd = DateTime(2024, 9, 1, 4, 30, 41);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'calculates start and end boundaries for 3 seconds after the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 25);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30, 43);
            final expectedEnd = DateTime(2024, 9, 1, 4, 30, 44);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 seconds after the given date that start at the very beginning of the second',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30, 43);
            final expectedEnd = DateTime(2024, 9, 1, 4, 30, 44);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 seconds after the given date that start at the very end of the second',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 59, 59);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30, 43);
            final expectedEnd = DateTime(2024, 9, 1, 4, 30, 44);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });
      });

      group('Time Unit Calculations - Minute', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.minute;
        });

        group('Negative Offset', () {
          test(
              'calculates start and end boundaries for 5 minutes prior to the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 25);
            final offset = -5;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 25);
            final expectedEnd = DateTime(2024, 9, 1, 4, 26);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 5 minutes prior to the given date that start at the very beginning of the minute',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30);
            final offset = -5;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 25);
            final expectedEnd = DateTime(2024, 9, 1, 4, 26);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 5 minutes prior to the given date that start at the very end of the minute',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 59, 59, 59);
            final offset = -5;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 25);
            final expectedEnd = DateTime(2024, 9, 1, 4, 26);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'calculates start and end boundaries for the current minute of the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 25);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30);
            final expectedEnd = DateTime(2024, 9, 1, 4, 31);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current minute of the given date that start at the very beginning of the minute',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30);
            final expectedEnd = DateTime(2024, 9, 1, 4, 31);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current minute of the given date that start at the very end of the minute',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 59, 59, 59);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 30);
            final expectedEnd = DateTime(2024, 9, 1, 4, 31);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'calculates start and end boundaries for 3 minutes after the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 25);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 33);
            final expectedEnd = DateTime(2024, 9, 1, 4, 34);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 minutes after the given date that start at the very beginning of the minute',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 33);
            final expectedEnd = DateTime(2024, 9, 1, 4, 34);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 minutes after the given date that start at the very end of the minute',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 59, 59, 59);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4, 33);
            final expectedEnd = DateTime(2024, 9, 1, 4, 34);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });
      });

      group('Time Unit Calculations - Hour', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.hour;
        });

        group('Negative Offset', () {
          test(
              'calculates start and end boundaries for 7 hours prior to the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 14, 30, 40, 25);
            final offset = -7;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 7);
            final expectedEnd = DateTime(2024, 9, 1, 8);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 7 hours prior to the given date that start at the very beginning of the hour',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 14);
            final offset = -7;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 7);
            final expectedEnd = DateTime(2024, 9, 1, 8);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 7 hours prior to the given date that start at the very end of the hour',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 14, 59, 59, 59, 59);
            final offset = -7;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 7);
            final expectedEnd = DateTime(2024, 9, 1, 8);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'calculates start and end boundaries for the current hour of the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 25);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4);
            final expectedEnd = DateTime(2024, 9, 1, 5);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current hour of the given date that start at the very beginning of the hour',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4);
            final expectedEnd = DateTime(2024, 9, 1, 5);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current hour of the given date that start at the very end of the hour',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 59, 59, 59, 59);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 4);
            final expectedEnd = DateTime(2024, 9, 1, 5);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'calculates start and end boundaries for 3 hours after the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 25);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 7);
            final expectedEnd = DateTime(2024, 9, 1, 8);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 hours after the given date that start at the very beginning of the hour',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 7);
            final expectedEnd = DateTime(2024, 9, 1, 8);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 hours after the given date that start at the very end of the hour',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 59, 59, 59, 59);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1, 7);
            final expectedEnd = DateTime(2024, 9, 1, 8);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });
      });

      group('Time Unit Calculations - Day', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.day;
        });

        group('Negative Offset', () {
          test(
              'calculates start and end boundaries for 10 days prior to the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 15, 14, 30, 40, 25);
            final offset = -10;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 5);
            final expectedEnd = DateTime(2024, 9, 6);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 10 days prior to the given date that start at the very beginning of the day',
              () {
            // arrange
            final date = DateTime(2024, 9, 15);
            final offset = -10;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 5);
            final expectedEnd = DateTime(2024, 9, 6);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 10 days prior to the given date that start at the very end of the day',
              () {
            // arrange
            final date = DateTime(2024, 9, 15, 23, 59, 59, 59, 59);
            final offset = -10;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 5);
            final expectedEnd = DateTime(2024, 9, 6);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'calculates start and end boundaries for the current day of the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 25);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1);
            final expectedEnd = DateTime(2024, 9, 2);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current day of the given date that start at the very beginning of the day',
              () {
            // arrange
            final date = DateTime(2024, 9, 1);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1);
            final expectedEnd = DateTime(2024, 9, 2);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current day of the given date that start at the very end of the day',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 23, 59, 59, 59, 59);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1);
            final expectedEnd = DateTime(2024, 9, 2);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'calculates start and end boundaries for 3 days after the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 4, 30, 40, 25);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 4);
            final expectedEnd = DateTime(2024, 9, 5);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 days after the given date that start at the very beginning of the day',
              () {
            // arrange
            final date = DateTime(2024, 9, 1);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 4);
            final expectedEnd = DateTime(2024, 9, 5);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 days after the given date that start at the very end of the day',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 23, 59, 59, 59, 59);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 4);
            final expectedEnd = DateTime(2024, 9, 5);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });
      });

      group('Time Unit Calculations - Week', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.week;
        });

        group('Negative Offset', () {
          test(
              'calculates start and end boundaries for 2 weeks prior to the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 13, 14, 30, 40, 25);
            final offset = -2;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 8, 26);
            final expectedEnd = DateTime(2024, 9, 2);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 2 weeks prior to the given date that start at the very beginning of the week',
              () {
            // arrange
            final date = DateTime(2024, 9, 9);
            final offset = -2;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 8, 26);
            final expectedEnd = DateTime(2024, 9, 2);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 2 weeks prior to the given date that start at the very end of the week',
              () {
            // arrange
            final date = DateTime(2024, 9, 15, 23, 59, 59, 59, 59);
            final offset = -2;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 8, 26);
            final expectedEnd = DateTime(2024, 9, 2);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'calculates start and end boundaries for the current week of the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 13, 4, 30, 40, 25);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 9);
            final expectedEnd = DateTime(2024, 9, 16);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current week of the given date that start at the very beginning of the week',
              () {
            // arrange
            final date = DateTime(2024, 9, 9);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 9);
            final expectedEnd = DateTime(2024, 9, 16);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current week of the given date that start at the very end of the week',
              () {
            // arrange
            final date = DateTime(2024, 9, 15, 23, 59, 59, 59, 59);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 9);
            final expectedEnd = DateTime(2024, 9, 16);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'calculates start and end boundaries for 1 week after the given date',
              () {
            // arrange
            final date = DateTime(2024, 8, 29, 4, 30, 40, 25);
            final offset = 1;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 2);
            final expectedEnd = DateTime(2024, 9, 9);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 1 week after the given date that start at the very beginning of the week',
              () {
            // arrange
            final date = DateTime(2024, 8, 26);
            final offset = 1;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 2);
            final expectedEnd = DateTime(2024, 9, 9);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 1 week after the given date that start at the very end of the week',
              () {
            // arrange
            final date = DateTime(2024, 9, 1, 23, 59, 59, 59, 59);
            final offset = 1;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 2);
            final expectedEnd = DateTime(2024, 9, 9);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        test(
            'calculates start and end boundaries for 1 week after the given date with weekStartDay Sunday',
            () {
          // arrange
          final date = DateTime(2024, 8, 29, 4, 30, 40, 25);
          final offset = 1;
          final weekStartDay = WeekStartDay.sunday;
          // act
          final result = TimeFinder.findTimeUnitBoundariesWithOffset(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
            weekStartDay: weekStartDay,
          );
          // assert
          final expectedStart = DateTime(2024, 9, 1);
          final expectedEnd = DateTime(2024, 9, 8);
          final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
          final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
          final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
          expect(evaluateStart, isTrue);
          expect(evaluateEnd, isTrue);
          expect(isOriginTheSame, isTrue);
        });

        test(
            'calculates start and end boundaries for 1 week after the given date with weekStartDay Thursday',
            () {
          // arrange
          final date = DateTime(2024, 8, 29, 4, 30, 40, 25);
          final offset = 1;
          final weekStartDay = WeekStartDay.thursday;
          // act
          final result = TimeFinder.findTimeUnitBoundariesWithOffset(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
            weekStartDay: weekStartDay,
          );
          // assert
          final expectedStart = DateTime(2024, 9, 5);
          final expectedEnd = DateTime(2024, 9, 12);
          final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
          final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
          final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
          expect(evaluateStart, isTrue);
          expect(evaluateEnd, isTrue);
          expect(isOriginTheSame, isTrue);
        });
      });

      group('Time Unit Calculations - Month', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.month;
        });

        group('Negative Offset', () {
          test(
              'calculates start and end boundaries for 3 months prior to the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 15, 14, 30, 40, 25);
            final offset = -3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 6, 1);
            final expectedEnd = DateTime(2024, 7, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 months prior to the given date that start at the very beginning of the week',
              () {
            // arrange
            final date = DateTime(2024, 9, 1);
            final offset = -3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 6, 1);
            final expectedEnd = DateTime(2024, 7, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 months prior to the given date that start at the very end of the week',
              () {
            // arrange
            final date = DateTime(2024, 9, 30, 23, 59, 59, 59, 59);
            final offset = -3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 6, 1);
            final expectedEnd = DateTime(2024, 7, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'calculates start and end boundaries for the current month of the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 13, 4, 30, 40, 25);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1);
            final expectedEnd = DateTime(2024, 10, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current month of the given date that start at the very beginning of the month',
              () {
            // arrange
            final date = DateTime(2024, 9, 1);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1);
            final expectedEnd = DateTime(2024, 10, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current month of the given date that start at the very end of the month',
              () {
            // arrange
            final date = DateTime(2024, 9, 30, 23, 59, 59, 59, 59);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 9, 1);
            final expectedEnd = DateTime(2024, 10, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'calculates start and end boundaries for 3 months after the given date',
              () {
            // arrange
            final date = DateTime(2024, 2, 12, 4, 30, 40, 25);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 5, 1);
            final expectedEnd = DateTime(2024, 6, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 months after the given date that start at the very beginning of the month',
              () {
            // arrange
            final date = DateTime(2024, 2, 1);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 5, 1);
            final expectedEnd = DateTime(2024, 6, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 months after the given date that start at the very end of the month',
              () {
            // arrange
            final date = DateTime(2024, 2, 29, 23, 59, 59, 59, 59);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 5, 1);
            final expectedEnd = DateTime(2024, 6, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });
      });

      group('Time Unit Calculations - Year', () {
        late TimeUnit timeUnit;
        setUp(() {
          // Set up common parameters for the group of tests
          timeUnit = TimeUnit.year;
        });

        group('Negative Offset', () {
          test(
              'calculates start and end boundaries for 2 years prior to the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 15, 14, 30, 40, 25);
            final offset = -2;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2022, 1, 1);
            final expectedEnd = DateTime(2023, 1, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 2 years prior to the given date that start at the very beginning of the year',
              () {
            // arrange
            final date = DateTime(2024, 1, 1);
            final offset = -2;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2022, 1, 1);
            final expectedEnd = DateTime(2023, 1, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 2 years prior to the given date that start at the very end of the year',
              () {
            // arrange
            final date = DateTime(2024, 12, 31, 23, 59, 59, 59, 59);
            final offset = -2;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2022, 1, 1);
            final expectedEnd = DateTime(2023, 1, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Zero Offset', () {
          test(
              'calculates start and end boundaries for the current year of the given date',
              () {
            // arrange
            final date = DateTime(2024, 9, 13, 4, 30, 40, 25);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 1, 1);
            final expectedEnd = DateTime(2025, 1, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current year of the given date that start at the very beginning of the year',
              () {
            // arrange
            final date = DateTime(2024, 1, 1);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 1, 1);
            final expectedEnd = DateTime(2025, 1, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for the current year of the given date that start at the very end of the year',
              () {
            // arrange
            final date = DateTime(2024, 12, 31, 23, 59, 59, 59, 59);
            final offset = 0;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2024, 1, 1);
            final expectedEnd = DateTime(2025, 1, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });

        group('Positive Offset', () {
          test(
              'calculates start and end boundaries for 3 years after the given date',
              () {
            // arrange
            final date = DateTime(2024, 2, 12, 4, 30, 40, 25);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2027, 1, 1);
            final expectedEnd = DateTime(2028, 1, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 years after the given date that start at the very beginning of the year',
              () {
            // arrange
            final date = DateTime(2024, 1, 1);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2027, 1, 1);
            final expectedEnd = DateTime(2028, 1, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });

          test(
              'calculates start and end boundaries for 3 years after the given date that start at the very end of the year',
              () {
            // arrange
            final date = DateTime(2024, 12, 31, 23, 59, 59, 59, 59);
            final offset = 3;
            // act
            final result = TimeFinder.findTimeUnitBoundariesWithOffset(
              date: date,
              timeUnit: timeUnit,
              offset: offset,
            );
            // assert
            final expectedStart = DateTime(2027, 1, 1);
            final expectedEnd = DateTime(2028, 1, 1);
            final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
            final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
            final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
            expect(evaluateStart, isTrue);
            expect(evaluateEnd, isTrue);
            expect(isOriginTheSame, isTrue);
          });
        });
      });

      group('Edge cases', () {
        test(
            'calculates start and end boundaries for 28th of Feb in a leap year - Day Unit',
            () {
          // arrange
          final date = DateTime(2024, 2, 28, 7, 59, 59, 59, 59);
          final offset = 0;
          final timeUnit = TimeUnit.day;
          // act
          final result = TimeFinder.findTimeUnitBoundariesWithOffset(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedStart = DateTime(2024, 2, 28);
          final expectedEnd = DateTime(2024, 2, 29);
          final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
          final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
          final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
          expect(evaluateStart, isTrue);
          expect(evaluateEnd, isTrue);
          expect(isOriginTheSame, isTrue);
        });

        test(
            'calculates start and end boundaries for 29th of Feb in a leap year - Day Unit',
            () {
          // arrange
          final date = DateTime(2024, 2, 29, 7, 59, 59, 59, 59);
          final offset = 0;
          final timeUnit = TimeUnit.day;
          // act
          final result = TimeFinder.findTimeUnitBoundariesWithOffset(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedStart = DateTime(2024, 2, 29);
          final expectedEnd = DateTime(2024, 3, 1);
          final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
          final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
          final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
          expect(evaluateStart, isTrue);
          expect(evaluateEnd, isTrue);
          expect(isOriginTheSame, isTrue);
        });

        test(
            'calculates start and end boundaries for 28th of Feb in a leap year - Second Unit',
            () {
          // arrange
          final date = DateTime(2020, 2, 28, 23, 59, 59, 59, 59);
          final offset = 0;
          final timeUnit = TimeUnit.second;
          // act
          final result = TimeFinder.findTimeUnitBoundariesWithOffset(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedStart = DateTime(2020, 2, 28, 23, 59, 59);
          final expectedEnd = DateTime(2020, 2, 29);
          final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
          final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
          final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
          expect(evaluateStart, isTrue);
          expect(evaluateEnd, isTrue);
          expect(isOriginTheSame, isTrue);
        });

        test(
            'calculates start and end boundaries for 29th of Feb in a leap year - Second Unit',
            () {
          // arrange
          final date = DateTime(2020, 2, 29, 23, 59, 59, 59, 59);
          final offset = 0;
          final timeUnit = TimeUnit.second;
          // act
          final result = TimeFinder.findTimeUnitBoundariesWithOffset(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedStart = DateTime(2020, 2, 29, 23, 59, 59);
          final expectedEnd = DateTime(2020, 3, 1);
          final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
          final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
          final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
          expect(evaluateStart, isTrue);
          expect(evaluateEnd, isTrue);
          expect(isOriginTheSame, isTrue);
        });

        test('calculates start and end boundaries for 31 of Dec - Day Unit',
            () {
          // arrange
          final date = DateTime(2024, 12, 31, 7, 59, 59, 59, 59);
          final offset = 0;
          final timeUnit = TimeUnit.day;
          // act
          final result = TimeFinder.findTimeUnitBoundariesWithOffset(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedStart = DateTime(2024, 12, 31);
          final expectedEnd = DateTime(2025, 1, 1);
          final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
          final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
          final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
          expect(evaluateStart, isTrue);
          expect(evaluateEnd, isTrue);
          expect(isOriginTheSame, isTrue);
        });

        test(
            'calculates start and end boundaries for 1st January with offset -1 - Day Unit',
            () {
          // arrange
          final date = DateTime(2025, 1, 1, 12, 8);
          final offset = -1;
          final timeUnit = TimeUnit.day;
          // act
          final result = TimeFinder.findTimeUnitBoundariesWithOffset(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedStart = DateTime(2024, 12, 31);
          final expectedEnd = DateTime(2025, 1, 1);
          final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
          final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
          final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
          expect(evaluateStart, isTrue);
          expect(evaluateEnd, isTrue);
          expect(isOriginTheSame, isTrue);
        });

        test(
            'calculates start and end boundaries for the end of 31 of Dec - Second Unit',
            () {
          // arrange
          final date = DateTime(2024, 12, 31, 23, 59, 59, 59, 59);
          final offset = 0;
          final timeUnit = TimeUnit.second;
          // act
          final result = TimeFinder.findTimeUnitBoundariesWithOffset(
            date: date,
            timeUnit: timeUnit,
            offset: offset,
          );
          // assert
          final expectedStart = DateTime(2024, 12, 31, 23, 59, 59);
          final expectedEnd = DateTime(2025, 1, 1);
          final evaluateStart = expectedStart.isAtSameMomentAs(result.start);
          final evaluateEnd = expectedEnd.isAtSameMomentAs(result.end);
          final isOriginTheSame = date.isAtSameMomentAs(result.originDate);
          expect(evaluateStart, isTrue);
          expect(evaluateEnd, isTrue);
          expect(isOriginTheSame, isTrue);
        });
      });
    });
  });
}
