import 'enums.dart';
import 'offset_dates.dart';

class PreviousDates {
  static DateTime previousSecondFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.second,
        offset: -1,
      );

  static DateTime previousMinuteFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.minute,
        offset: -1,
      );

  static DateTime previousHourFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.hour,
        offset: -1,
      );

  static DateTime previousDayFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.day,
        offset: -1,
      );

  static DateTime previousWeekFromNow(WeekStartDay weekStartDay) =>
      OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: weekStartDay,
        timeUnit: TimeUnit.week,
        offset: -1,
      );

  static DateTime previousMonthFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.month,
        offset: -1,
      );

  static DateTime previousYearFromNow() => OffsetDates.findDate(
        date: DateTime.now().toUtc(),
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.year,
        offset: -1,
      );

  static DateTime previousSecondFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.second,
        offset: -1,
      );

  static DateTime previousMinuteFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.minute,
        offset: -1,
      );

  static DateTime previousHourFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.hour,
        offset: -1,
      );

  static DateTime previousDayFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.day,
        offset: -1,
      );

  static DateTime previousWeekFromDate(
    DateTime date,
    WeekStartDay weekStartDay,
  ) =>
      OffsetDates.findDate(
        date: date,
        weekStartDay: weekStartDay,
        timeUnit: TimeUnit.week,
        offset: -1,
      );

  static DateTime previousMonthFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.month,
        offset: -1,
      );

  static DateTime previousYearFromDate(DateTime date) => OffsetDates.findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.year,
        offset: -1,
      );
}
