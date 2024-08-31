import 'package:time_finder/src/current_dates.dart';
import 'package:time_finder/src/enums.dart';
import 'package:time_finder/src/next_dates.dart';

class RangeFinder {
  static List<DateTime> findDateRange({
    required DateTime startDate,
    required DateTime endDate,
    required TimeUnit interval,
    bool includeStartDate = true,
    bool includeEndDate = true,
    WeekDateRangeOptions weekDateRangeOptions =
        WeekDateRangeOptions.alignToWeekStart,
    WeekStartDay weekStartDay = WeekStartDay.monday,
  }) {
    assert(startDate.isBefore(endDate) || startDate.isAtSameMomentAs(endDate),
        'startDate must be before or the same as endDate');
    if (startDate.isAfter(endDate)) {
      throw ArgumentError('startDate must be before or the same as endDate');
    }
    List<DateTime> resultDatesList = [];
    // deal with includeStartDate
    if (includeStartDate) {
      DateTime firstDate = interval == TimeUnit.week &&
              weekDateRangeOptions == WeekDateRangeOptions.alignToWeekStart
          ? CurrentDates.currentWeekFromDate(startDate, weekStartDay)
          : startDate;
      resultDatesList.add(firstDate);
    }
    // find the in between range
    switch (interval) {
      case TimeUnit.second:
        final List<DateTime> inBetweenList =
            _findSecondsDateRange(startDate: startDate, endDate: endDate);
        resultDatesList.addAll(inBetweenList);
        break;
      case TimeUnit.minute:
        final List<DateTime> inBetweenList =
            _findMinutesDateRange(startDate: startDate, endDate: endDate);
        resultDatesList.addAll(inBetweenList);
        break;
      case TimeUnit.hour:
        final List<DateTime> inBetweenList =
            _findHoursDateRange(startDate: startDate, endDate: endDate);
        resultDatesList.addAll(inBetweenList);
        break;
      case TimeUnit.day:
        final List<DateTime> inBetweenList =
            _findDaysDateRange(startDate: startDate, endDate: endDate);
        resultDatesList.addAll(inBetweenList);
        break;
      case TimeUnit.week:
        switch (weekDateRangeOptions) {
          case WeekDateRangeOptions.alignToWeekStart:
            final List<DateTime> inBetweenList = _findWeeksDateRangeAdjusted(
              startDate: startDate,
              endDate: endDate,
              weekStartDay: weekStartDay,
            );
            resultDatesList.addAll(inBetweenList);
            break;
          case WeekDateRangeOptions.keepStartDate:
            final List<DateTime> inBetweenList = _daysBasedIntervalDivider(
              startDate: startDate,
              endDate: endDate,
              intervalWidth: 7,
            );
            resultDatesList.addAll(inBetweenList);
            break;
        }
        break;
      case TimeUnit.month:
        final List<DateTime> inBetweenList =
            _findMonthsDateRange(startDate: startDate, endDate: endDate);
        resultDatesList.addAll(inBetweenList);
        break;
      case TimeUnit.year:
        final List<DateTime> inBetweenList =
            _findYearsDateRange(startDate: startDate, endDate: endDate);
        resultDatesList.addAll(inBetweenList);
        break;
    }

    // deal with includeEndDate
    if (includeEndDate) {
      DateTime lastDate = interval == TimeUnit.week &&
              weekDateRangeOptions == WeekDateRangeOptions.alignToWeekStart
          ? NextDates.nextWeekFromDate(startDate, weekStartDay)
          : endDate;
      resultDatesList.add(lastDate);
    }
    return [];
  }

  static List<DateTime> _daysBasedIntervalDivider({
    required DateTime startDate,
    required DateTime endDate,
    int intervalWidth = 1,
  }) {
    List<DateTime> datesList = [];
    // find the intervals between the start and end date
    // by creating a pivot and moving it accordingly
    // find the intervals between and excluding start and end dates because they will be handled by findDateRange function
    DateTime pivotDate = startDate.add(Duration(days: intervalWidth));
    while (
        pivotDate.isBefore(endDate) && !pivotDate.isAtSameMomentAs(endDate)) {
      // add to the list
      datesList.add(pivotDate);
      // move on to the interval
      pivotDate = startDate.add(Duration(days: intervalWidth));
    }
    return datesList;
  }

  static List<DateTime> _findWeeksDateRangeAdjusted({
    required DateTime startDate,
    required DateTime endDate,
    required WeekStartDay weekStartDay,
  }) {
    List<DateTime> datesList = [];
    // find the intervals between the start and end date
    // by creating a pivot and moving it accordingly
    // find the intervals between and excluding start and end dates because they will be handled by findDateRange function
    DateTime pivotDate = NextDates.nextWeekFromDate(startDate, weekStartDay);
    final DateTime lastReachableDate = CurrentDates.currentWeekFromDate(
      endDate,
      weekStartDay,
    );
    // if the last reachable date is the same as end date then don't count it in the list
    while (pivotDate.isBefore(lastReachableDate) ||
        (pivotDate.isAtSameMomentAs(lastReachableDate) &&
            !lastReachableDate.isAtSameMomentAs(endDate))) {
      // add to the list
      datesList.add(pivotDate);
      // move on to the interval
      pivotDate = NextDates.nextWeekFromDate(pivotDate, weekStartDay);
    }
    return datesList;
  }

  static List<DateTime> _findSecondsDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    List<DateTime> datesList = [];
    // find the intervals between the start and end date
    // by creating a pivot and moving it accordingly
    // find the intervals between and excluding start and end dates because they will be handled by findDateRange function
    DateTime pivotDate = NextDates.nextSecondFromDate(startDate);
    final DateTime lastReachableDate =
        CurrentDates.currentSecondFromDate(endDate);
    // if the last reachable date is the same as end date then don't count it in the list
    while (pivotDate.isBefore(lastReachableDate) ||
        (pivotDate.isAtSameMomentAs(lastReachableDate) &&
            !lastReachableDate.isAtSameMomentAs(endDate))) {
      // add to the list
      datesList.add(pivotDate);
      // move on to the interval
      pivotDate = NextDates.nextSecondFromDate(pivotDate);
    }
    return datesList;
  }

  static List<DateTime> _findMinutesDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    List<DateTime> datesList = [];
    // find the intervals between the start and end date
    // by creating a pivot and moving it accordingly
    // find the intervals between and excluding start and end dates because they will be handled by findDateRange function
    DateTime pivotDate = NextDates.nextMinuteFromDate(startDate);
    final DateTime lastReachableDate =
        CurrentDates.currentMinuteFromDate(endDate);
    // if the last reachable date is the same as end date then don't count it in the list
    while (pivotDate.isBefore(lastReachableDate) ||
        (pivotDate.isAtSameMomentAs(lastReachableDate) &&
            !lastReachableDate.isAtSameMomentAs(endDate))) {
      // add to the list
      datesList.add(pivotDate);
      // move on to the interval
      pivotDate = NextDates.nextMinuteFromDate(pivotDate);
    }
    return datesList;
  }

  static List<DateTime> _findHoursDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    List<DateTime> datesList = [];
    // find the intervals between the start and end date
    // by creating a pivot and moving it accordingly
    // find the intervals between and excluding start and end dates because they will be handled by findDateRange function
    DateTime pivotDate = NextDates.nextHourFromDate(startDate);
    final DateTime lastReachableDate =
        CurrentDates.currentHourFromDate(endDate);
    // if the last reachable date is the same as end date then don't count it in the list
    while (pivotDate.isBefore(lastReachableDate) ||
        (pivotDate.isAtSameMomentAs(lastReachableDate) &&
            !lastReachableDate.isAtSameMomentAs(endDate))) {
      // add to the list
      datesList.add(pivotDate);
      // move on to the interval
      pivotDate = NextDates.nextHourFromDate(pivotDate);
    }
    return datesList;
  }

  static List<DateTime> _findDaysDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    List<DateTime> datesList = [];
    // find the intervals between the start and end date
    // by creating a pivot and moving it accordingly
    // find the intervals between and excluding start and end dates because they will be handled by findDateRange function
    DateTime pivotDate = NextDates.nextDayFromDate(startDate);
    final DateTime lastReachableDate = CurrentDates.currentDayFromDate(endDate);
    // if the last reachable date is the same as end date then don't count it in the list
    while (pivotDate.isBefore(lastReachableDate) ||
        (pivotDate.isAtSameMomentAs(lastReachableDate) &&
            !lastReachableDate.isAtSameMomentAs(endDate))) {
      // add to the list
      datesList.add(pivotDate);
      // move on to the interval
      pivotDate = NextDates.nextDayFromDate(pivotDate);
    }
    return datesList;
  }

  static List<DateTime> _findMonthsDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    List<DateTime> datesList = [];
    // find the intervals between the start and end date
    // by creating a pivot and moving it accordingly
    // find the intervals between and excluding start and end dates because they will be handled by findDateRange function
    DateTime pivotDate = NextDates.nextMonthFromDate(startDate);
    final DateTime lastReachableDate =
        CurrentDates.currentMonthFromDate(endDate);
    // if the last reachable date is the same as end date then don't count it in the list
    while (pivotDate.isBefore(lastReachableDate) ||
        (pivotDate.isAtSameMomentAs(lastReachableDate) &&
            !lastReachableDate.isAtSameMomentAs(endDate))) {
      // add to the list
      datesList.add(pivotDate);
      // move on to the interval
      pivotDate = NextDates.nextMonthFromDate(pivotDate);
    }
    return datesList;
  }

  static List<DateTime> _findYearsDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    List<DateTime> datesList = [];
    // find the intervals between the start and end date
    // by creating a pivot and moving it accordingly
    // find the intervals between and excluding start and end dates because they will be handled by findDateRange function
    DateTime pivotDate = NextDates.nextYearFromDate(startDate);
    final DateTime lastReachableDate =
        CurrentDates.currentYearFromDate(endDate);
    // if the last reachable date is the same as end date then don't count it in the list
    while (pivotDate.isBefore(lastReachableDate) ||
        (pivotDate.isAtSameMomentAs(lastReachableDate) &&
            !lastReachableDate.isAtSameMomentAs(endDate))) {
      // add to the list
      datesList.add(pivotDate);
      // move on to the interval
      pivotDate = NextDates.nextYearFromDate(pivotDate);
    }
    return datesList;
  }
}
