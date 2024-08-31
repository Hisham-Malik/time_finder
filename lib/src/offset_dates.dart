import 'package:time_finder/src/enums.dart';
import 'helpers/unit_start_finder.dart';

class OffsetDates {
  static DateTime findSecondWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.second,
        offset: offset,
      );

  static DateTime findMinuteWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.minute,
        offset: offset,
      );

  static DateTime findHourWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.hour,
        offset: offset,
      );

  static DateTime findDayWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.day,
        offset: offset,
      );

  static DateTime findWeekWithOffset({
    required DateTime date,
    required int offset,
    required WeekStartDay weekStartDay,
  }) =>
      findDate(
        date: date,
        weekStartDay: weekStartDay,
        timeUnit: TimeUnit.week,
        offset: offset,
      );

  static DateTime findMonthWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.month,
        offset: offset,
      );

  static DateTime findYearWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      findDate(
        date: date,
        weekStartDay: WeekStartDay.sunday,
        timeUnit: TimeUnit.year,
        offset: offset,
      );

  static DateTime findDate({
    required DateTime date,
    required WeekStartDay weekStartDay,
    required TimeUnit timeUnit,
    required int offset,
  }) =>
      switch (timeUnit) {
        TimeUnit.second => _getSecond(date: date, offset: offset),
        TimeUnit.minute => _getMinute(date: date, offset: offset),
        TimeUnit.hour => _getHour(date: date, offset: offset),
        TimeUnit.day => _getDay(date: date, offset: offset),
        TimeUnit.week => _getWeek(
            date: date,
            weekStartDay: weekStartDay,
            offset: offset,
          ),
        TimeUnit.month => _getMonth(date: date, offset: offset),
        TimeUnit.year => _getYear(date: date, offset: offset),
      };

  static DateTime _getSecond({
    required DateTime date,
    required int offset,
  }) {
    // get the start of the second
    final DateTime secondStart = UnitStartFinder.getUnitStart(
      date: date,
      timeUnit: TimeUnit.second,
      weekStartDay: WeekStartDay.sunday,
    );
    if (offset == 0) {
      return secondStart;
    }
    return secondStart.add(Duration(seconds: offset));
  }

  static DateTime _getMinute({
    required DateTime date,
    required int offset,
  }) {
    // get the start of the minute
    final DateTime minuteStart = UnitStartFinder.getUnitStart(
      date: date,
      timeUnit: TimeUnit.minute,
      weekStartDay: WeekStartDay.sunday,
    );
    if (offset == 0) {
      return minuteStart;
    }
    return minuteStart.add(Duration(minutes: offset));
  }

  static DateTime _getHour({
    required DateTime date,
    required int offset,
  }) {
    // get the start of the hour
    final DateTime hourStart = UnitStartFinder.getUnitStart(
      date: date,
      timeUnit: TimeUnit.hour,
      weekStartDay: WeekStartDay.sunday,
    );
    if (offset == 0) {
      return hourStart;
    }
    return hourStart.add(Duration(hours: offset));
  }

  static DateTime _getDay({
    required DateTime date,
    required int offset,
  }) {
    // get the start of the day of the given date
    final DateTime dateDayStart = UnitStartFinder.getUnitStart(
      date: date,
      timeUnit: TimeUnit.day,
      weekStartDay: WeekStartDay.sunday,
    );
    if (offset == 0) {
      return dateDayStart;
    }
    final result = dateDayStart.add(Duration(days: offset));
    return result;
  }

  static DateTime _getWeek({
    required DateTime date,
    required WeekStartDay weekStartDay,
    required int offset,
  }) {
    // get the current week start date
    // get the date of the current week start day
    final DateTime currentWeekStart = UnitStartFinder.getUnitStart(
      date: date,
      timeUnit: TimeUnit.week,
      weekStartDay: weekStartDay,
    );
    if (offset == 0) {
      return currentWeekStart;
    } else {
      // calculate the number of days that need to be added or subtracted from the current week start date
      final int days = offset.abs() * 7;
      if (offset.isNegative) {
        return currentWeekStart.subtract(
          Duration(days: days),
        );
      } else {
        return currentWeekStart.add(
          Duration(days: days),
        );
      }
    }
  }

  static DateTime _getMonth({
    required DateTime date,
    required int offset,
  }) {
    // get the start of the month
    final DateTime monthStart = UnitStartFinder.getUnitStart(
      date: date,
      timeUnit: TimeUnit.month,
      weekStartDay: WeekStartDay.sunday,
    );
    if (offset == 0) {
      return monthStart;
    }
    final absoluteOffset = offset.abs();
    final isNegativeOffset = offset.isNegative;
    // each step move the pivotDate until the desired date is reached
    // if the offset is negative move the pivotDate back
    // move it by 1 hour because then the new month will be the previous month,
    // then compute the start of the previous month and repeat
    // if the offset is positive move the pivotDate forward
    // move it by 32 days because the new month will be the next month + some days
    // then compute the month start to remove these some days
    DateTime pivotDate = monthStart;
    for (int i = 0; i < absoluteOffset; i++) {
      DateTime tempDate = isNegativeOffset
          ? pivotDate.subtract(Duration(hours: 1))
          : pivotDate.add(Duration(days: 32));
      pivotDate = UnitStartFinder.getUnitStart(
        date: tempDate,
        timeUnit: TimeUnit.month,
        weekStartDay: WeekStartDay.sunday,
      );
    }
    return pivotDate;
  }

  static DateTime _getYear({
    required DateTime date,
    required int offset,
  }) {
    // get the start of the year
    final DateTime yearStart = UnitStartFinder.getUnitStart(
      date: date,
      timeUnit: TimeUnit.year,
      weekStartDay: WeekStartDay.sunday,
    );
    if (offset == 0) {
      return yearStart;
    }
    final absoluteOffset = offset.abs();
    final isNegativeOffset = offset.isNegative;
    // each step move the pivotDate until the desired date is reached
    // if the offset is negative move the pivotDate back
    // move it by 1 day because then the new year will be the previous year,
    // then compute the start of the previous year and repeat
    // if the offset is positive move the pivotDate forward
    // move it by 370 days because the new year will be the next year + some days
    // then compute the year start to remove these some days
    DateTime pivotDate = yearStart;
    for (int i = 0; i < absoluteOffset; i++) {
      DateTime tempDate = isNegativeOffset
          ? pivotDate.subtract(Duration(days: 1))
          : pivotDate.add(Duration(days: 370));
      pivotDate = UnitStartFinder.getUnitStart(
        date: tempDate,
        timeUnit: TimeUnit.year,
        weekStartDay: WeekStartDay.sunday,
      );
    }
    return pivotDate;
  }
}
