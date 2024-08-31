import 'enums.dart';
import 'offset_dates.dart';

class CurrentDates {
  static DateTime currentSecondFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.second,
        offset: 0,
      );

  static DateTime currentMinuteFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.minute,
        offset: 0,
      );

  static DateTime currentHourFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.hour,
        offset: 0,
      );

  static DateTime currentDayFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.day,
        offset: 0,
      );

  static DateTime currentWeekFromNow(WeekStartDay weekStartDay) =>
      OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: weekStartDay,
        timeUnit: TimeUnit.week,
        offset: 0,
      );

  static DateTime currentMonthFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.month,
        offset: 0,
      );

  static DateTime currentYearFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.year,
        offset: 0,
      );

  static DateTime currentSecondFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.second,
        offset: 0,
      );

  static DateTime currentMinuteFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.minute,
        offset: 0,
      );

  static DateTime currentHourFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.hour,
        offset: 0,
      );

  static DateTime currentDayFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.day,
        offset: 0,
      );

  static DateTime currentWeekFromDate(
    DateTime date,
    WeekStartDay weekStartDay,
  ) =>
      OffsetDates.findDate(
        date: date,
        weekStartDay: weekStartDay,
        timeUnit: TimeUnit.week,
        offset: 0,
      );

  static DateTime currentMonthFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.month,
        offset: 0,
      );

  static DateTime currentYearFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.year,
        offset: 0,
      );
}
