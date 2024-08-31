import 'package:time_finder/src/enums.dart';
import 'package:time_finder/src/offset_dates.dart';

class NextDates {
  static DateTime nextSecondFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.second,
        offset: 1,
      );

  static DateTime nextMinuteFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.minute,
        offset: 1,
      );

  static DateTime nextHourFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.hour,
        offset: 1,
      );

  static DateTime nextDayFromNow() => OffsetDates.findDate(
    date: DateTime.now().toUtc(),
    weekStartDay: WeekStartDay.sunday,
    timeUnit: TimeUnit.day,
    offset: 1,
  );

  static DateTime nextWeekFromNow(WeekStartDay weekStartDay) =>
      OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: weekStartDay,
        timeUnit: TimeUnit.week,
        offset: 1,
      );

  static DateTime nextMonthFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.month,
        offset: 1,
      );

  static DateTime nextYearFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.year,
        offset: 1,
      );

  static DateTime nextSecondFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.second,
        offset: 1,
      );

  static DateTime nextMinuteFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.minute,
        offset: 1,
      );

  static DateTime nextHourFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.hour,
        offset: 1,
      );

  static DateTime nextDayFromDate(DateTime date) => OffsetDates.findDate(
    date: date,
    weekStartDay: WeekStartDay.sunday,
    timeUnit: TimeUnit.day,
    offset: 1,
  );

  static DateTime nextWeekFromDate(DateTime date, WeekStartDay weekStartDay) =>
      OffsetDates.findDate(
        date: date,
        weekStartDay: weekStartDay,
        timeUnit: TimeUnit.week,
        offset: 1,
      );

  static DateTime nextMonthFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.month,
        offset: 1,
      );

  static DateTime nextYearFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.year,
        offset: 1,
      );
}
