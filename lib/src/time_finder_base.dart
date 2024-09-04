import 'package:time_finder/src/current_dates.dart';
import 'package:time_finder/src/next_dates.dart';
import 'package:time_finder/src/offset_dates.dart';
import 'package:time_finder/src/previous_dates.dart';
import 'package:time_finder/src/range_finder.dart';
import 'package:time_finder/src/unit_boundary_finder.dart';
import 'classes/time_unit_boundaries.dart';
import 'enums.dart';

/// The `TimeFinder` class provides a comprehensive set of utilities for
/// manipulating and querying `DateTime` objects in Dart. It offers methods
/// to find specific time unit boundaries, calculate dates with offsets, and
/// retrieve the start of various time units such as seconds, minutes, hours,
/// days, weeks, months, and years.
///
/// ### Key Features:
/// - **Find Specific Time Unit Boundaries:** Calculate the start and end
///   boundaries of time units (e.g., start of the month, end of the year)
///   based on a given date.
/// - **Offset Date Calculation:** Move forwards or backwards in time by
///   applying offsets to various time units, making it easy to navigate
///   through time-related data.
/// - **Support for Custom Week Start Days:** Customize the start day of the
///   week when working with week-based calculations, allowing flexibility
///   in week-based operations.
/// - **Multiple Time Units Support:** Work with different time units
///   including seconds, minutes, hours, days, weeks, months, and years,
///   providing a versatile toolkit for date and time manipulation.
///
/// ### Example Usage:
/// ```dart
/// DateTime date = DateTime(2024, 8, 21, 12, 34, 56);
///
/// // Finding the start of the current month
/// DateTime startOfCurrentMonth = TimeFinder.currentMonthFromDate(date);
/// print('Start of Current Month: $startOfCurrentMonth');
///
/// // Finding the boundaries of the current day
/// TimeUnitBoundaries dayBoundaries = TimeFinder.findTimeUnitBoundaries(
///   date: date,
///   timeUnit: TimeUnit.day,
/// );
/// print('Current Day Start: ${dayBoundaries.start}');
/// print('Current Day End: ${dayBoundaries.end}');
/// ```
///
/// The `TimeFinder` class is designed to be easy to use while offering
/// advanced functionality for complex date and time manipulations. Whether
/// you need to find the start of a week or calculate a date several months
/// ahead, `TimeFinder` provides the tools you need.
///
/// ### Note:
/// - The class includes a variety of methods to cater to different needs,
///   such as finding the start of a specific time unit, working with offsets,
///   and retrieving boundaries for date and time calculations.
/// - For methods that operate with offsets, an `offset` of `0` refers to
///   the current time unit, a positive `offset` moves forward in time,
///   and a negative `offset` moves backward in time.
class TimeFinder {
  /// Finds a `DateTime` by applying an offset to a specified [timeUnit] from the given [date].
  ///
  /// This method calculates a new `DateTime` based on the provided [date], [timeUnit], and [offset].
  /// The calculation can move forwards or backwards in time depending on whether [offset] is positive or negative.
  /// If [offset] is 0, the method returns the start of the current [timeUnit] for the given [date].
  ///
  /// The method ensures that the returned `DateTime` is aligned with the start of the specified [timeUnit].
  /// For example, if the [timeUnit] is a month and the [offset] is -1, it returns the start of the previous month.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime startOfCurrentMonth = DateFinder.findDate(
  ///   date: DateTime(2024, 8, 21, 12, 34, 56),
  ///   timeUnit: TimeUnit.month,
  ///   offset: 0,
  /// );
  /// // startOfCurrentMonth will be 2024-08-01 00:00:00.000.
  ///
  /// DateTime startOfNextMonth = DateFinder.findDate(
  ///   date: DateTime(2024, 8, 21, 12, 34, 56),
  ///   timeUnit: TimeUnit.month,
  ///   offset: 1,
  /// );
  /// // startOfNextMonth will be 2024-09-01 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///   - [timeUnit]: The unit of time to offset, such as a second, minute, hour, day, week, month, or year.
  ///   - [offset]: The number of time units to offset from the given [date]. Positive values move forward, negative values move backward, and 0 returns the start of the current [timeUnit].
  ///   - [weekStartDay]: The day of the week considered the start of the week. This is only used if [timeUnit] is `week`.
  ///
  /// - Returns: A `DateTime` that represents the start of the calculated time unit after applying the offset from the given [date].
  static DateTime findDate({
    required DateTime date,
    required TimeUnit timeUnit,
    required int offset,
    WeekStartDay weekStartDay = WeekStartDay.monday,
  }) =>
      OffsetDates.findDate(
        date: date,
        weekStartDay: weekStartDay,
        timeUnit: timeUnit,
        offset: offset,
      );

  /// Finds a new `DateTime` by adjusting the given [date] by a specified [offset] in seconds.
  /// If the [offset] is 0, the method returns the start of the current second (e.g., if the time is 5:53:27.456,
  /// the returned time will be 5:53:27.000).
  ///
  /// This method calculates the [DateTime] that is the given number of seconds ([offset])
  /// ahead of or behind the provided [date]. The [offset] can be positive (for a future date)
  /// or negative (for a past date). When the [offset] is 0, the method returns the [date]
  /// rounded down to the nearest second.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentDate = DateTime.now();
  /// DateTime newDate = DateFinder.findSecondWithOffset(date: currentDate, offset: -30);
  /// // newDate will be 30 seconds behind the start of the current second in currentDate.
  ///
  /// DateTime startOfSecond = DateFinder.findSecondWithOffset(date: currentDate, offset: 0);
  /// // startOfSecond will be the start of the current second (e.g., if currentDate is 5:53:27.456, roundedSecond will be 5:53:27.000).
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the offset is applied.
  ///   - [offset]: The number of seconds to offset the [date] by. Positive for future, negative for past. If 0, returns the start of the current second.
  ///
  /// - Returns: A new `DateTime` adjusted by the specified number of seconds, or the start of the current second if the [offset] is 0.
  static DateTime findSecondWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      OffsetDates.findSecondWithOffset(
        date: date,
        offset: offset,
      );

  /// Finds a new `DateTime` by adjusting the given [date] by a specified [offset] in minutes.
  /// If the [offset] is 0, the method returns the start of the current minute (e.g., if the time is 5:53:27,
  /// the returned time will be 5:53:00).
  ///
  /// This method calculates the [DateTime] that is the given number of minutes ([offset])
  /// ahead of or behind the provided [date]. The [offset] can be positive (for a future date)
  /// or negative (for a past date). When the [offset] is 0, the method returns the [date]
  /// rounded down to the nearest minute.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentDate = DateTime.now();
  /// DateTime newDate = DateFinder.findMinuteWithOffset(date: currentDate, offset: -15);
  /// // newDate will be 15 minutes behind the start of the current minute in currentDate.
  ///
  /// DateTime startOfMinute = DateFinder.findMinuteWithOffset(date: currentDate, offset: 0);
  /// // startOfMinute will be the start of the current minute (e.g., if currentDate is 5:53:27, roundedMinute will be 5:53:00).
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the offset is applied.
  ///   - [offset]: The number of minutes to offset the [date] by. Positive for future, negative for past. If 0, returns the start of the current minute.
  ///
  /// - Returns: A new `DateTime` adjusted by the specified number of minutes, or the start of the current minute if the [offset] is 0.
  static DateTime findMinuteWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      OffsetDates.findMinuteWithOffset(
        date: date,
        offset: offset,
      );

  /// Finds a new `DateTime` by adjusting the given [date] by a specified [offset] in hours.
  /// If the [offset] is 0, the method returns the start of the current hour (e.g., if the time is 5:53,
  /// the returned time will be 5:00).
  ///
  /// This method calculates the [DateTime] that is the given number of hours ([offset])
  /// ahead of or behind the provided [date]. The [offset] can be positive (for a future date)
  /// or negative (for a past date). When the [offset] is 0, the method returns the [date]
  /// rounded down to the nearest hour.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentDate = DateTime.now();
  /// DateTime newDate = DateFinder.findHourWithOffset(date: currentDate, offset: -2);
  /// // newDate will be 2 hours behind the start of the current hour in currentDate.
  ///
  /// DateTime startOfHour = DateFinder.findHourWithOffset(date: currentDate, offset: 0);
  /// // startOfHour will be the start of the current hour (e.g., if currentDate is 5:53, roundedHour will be 5:00).
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the offset is applied.
  ///   - [offset]: The number of hours to offset the [date] by. Positive for future, negative for past. If 0, returns the start of the current hour.
  ///
  /// - Returns: A new `DateTime` adjusted by the specified number of hours, or the start of the current hour if the [offset] is 0.
  static DateTime findHourWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      OffsetDates.findHourWithOffset(
        date: date,
        offset: offset,
      );

  /// Finds a new `DateTime` by adjusting the given [date] by a specified [offset] in days.
  /// If the [offset] is 0, the method returns the start of the current day (e.g., if the time is 5:53:27,
  /// the returned time will be 00:00:00 of the same day).
  ///
  /// This method calculates the [DateTime] that is the given number of days ([offset])
  /// ahead of or behind the provided [date]. The [offset] can be positive (for a future date)
  /// or negative (for a past date). When the [offset] is 0, the method returns the [date]
  /// set to the start of the day (midnight).
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentDate = DateTime.now();
  /// DateTime newDate = DateFinder.findDayWithOffset(date: currentDate, offset: -1);
  /// // newDate will be 1 day behind the start of the current day in currentDate.
  ///
  /// DateTime startOfDay = DateFinder.findDayWithOffset(date: currentDate, offset: 0);
  /// // startOfDay will be the start of the current day (e.g., if currentDate is 17:08:27, startOfDay will be 00:00:00 of the same day).
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the offset is applied.
  ///   - [offset]: The number of days to offset the [date] by. Positive for future, negative for past. If 0, returns the start of the current day.
  ///
  /// - Returns: A new `DateTime` adjusted by the specified number of days, or the start of the current day if the [offset] is 0.
  static DateTime findDayWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      OffsetDates.findDayWithOffset(
        date: date,
        offset: offset,
      );

  /// Finds a new `DateTime` by adjusting the given [date] by a specified [offset] in weeks, considering the starting day of the week.
  /// If the [offset] is 0, the method returns the start of the current week, based on the provided [weekStartDay].
  ///
  /// This method calculates the [DateTime] that is the given number of weeks ([offset])
  /// ahead of or behind the provided [date]. The [offset] can be positive (for a future date)
  /// or negative (for a past date). When the [offset] is 0, the method returns the [date]
  /// set to the start of the week as defined by [weekStartDay].
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentDate = DateTime.now();
  /// DateTime newDate = DateFinder.findWeekWithOffset(date: currentDate, offset: -2, weekStartDay: WeekStartDay.monday);
  /// // newDate will be 2 weeks behind the start of the current week in currentDate, assuming the week starts on Monday.
  ///
  /// DateTime startOfWeek = DateFinder.findWeekWithOffset(date: currentDate, offset: 0, weekStartDay: WeekStartDay.sunday);
  /// // startOfWeek will be the start of the current week based on Sunday (e.g., if currentDate is a Wednesday, startOfWeek will be the previous Sunday).
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the offset is applied.
  ///   - [offset]: The number of weeks to offset the [date] by. Positive for future, negative for past. If 0, returns the start of the current week.
  ///   - [weekStartDay]: The day of the week that the user specifies as the start of the week (e.g., Sunday or Monday).
  ///
  /// - Returns: A new `DateTime` adjusted by the specified [offset] in weeks from the given [date]. The returned date will be aligned to the start of the week as defined by [weekStartDay], regardless of whether the [offset] is zero or not.
  static DateTime findWeekWithOffset({
    required DateTime date,
    required int offset,
    required WeekStartDay weekStartDay,
  }) =>
      OffsetDates.findWeekWithOffset(
        date: date,
        offset: offset,
        weekStartDay: weekStartDay,
      );

  /// Finds a new `DateTime` by adjusting the given [date] by a specified [offset] in months.
  /// If the [offset] is 0, the method returns the start of the current month (e.g., if the date is June 15th,
  /// the returned date will be June 1st at 00:00:00).
  ///
  /// This method calculates the [DateTime] that is the given number of months ([offset])
  /// ahead of or behind the provided [date]. The [offset] can be positive (for a future date)
  /// or negative (for a past date). When the [offset] is 0, the method returns the [date]
  /// set to the start of the month.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentDate = DateTime.now();
  /// DateTime newDate = DateFinder.findMonthWithOffset(date: currentDate, offset: -3);
  /// // newDate will be 3 months behind the start of the current month in currentDate.
  ///
  /// DateTime startOfMonth = DateFinder.findMonthWithOffset(date: currentDate, offset: 0);
  /// // startOfMonth will be the start of the current month (e.g., if currentDate is July 25th, startOfMonth will be July 1st at 00:00:00).
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the offset is applied.
  ///   - [offset]: The number of months to offset the [date] by. Positive for future, negative for past. If 0, returns the start of the current month.
  ///
  /// - Returns: A new `DateTime` adjusted by the specified number of months, or the start of the current month if the [offset] is 0.
  static DateTime findMonthWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      OffsetDates.findMonthWithOffset(
        date: date,
        offset: offset,
      );

  /// Finds a new `DateTime` by adjusting the given [date] by a specified [offset] in years.
  /// If the [offset] is 0, the method returns the start of the current year (e.g., if the date is June 15th,
  /// the returned date will be January 1st at 00:00:00).
  ///
  /// This method calculates the [DateTime] that is the given number of years ([offset])
  /// ahead of or behind the provided [date]. The [offset] can be positive (for a future date)
  /// or negative (for a past date). When the [offset] is 0, the method returns the [date]
  /// set to the start of the year.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentDate = DateTime.now();
  /// DateTime newDate = DateFinder.findYearWithOffset(date: currentDate, offset: 2);
  /// // newDate will be 2 year ahead of the start of the current year in currentDate.
  ///
  /// DateTime startOfYear = DateFinder.findYearWithOffset(date: currentDate, offset: 0);
  /// // startOfYear will be the start of the current year (e.g., if currentDate is August 20th, startOfYear will be January 1st at 00:00:00).
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the offset is applied.
  ///   - [offset]: The number of years to offset the [date] by. Positive for future, negative for past. If 0, returns the start of the current year.
  ///
  /// - Returns: A new `DateTime` adjusted by the specified number of years, or the start of the current year if the [offset] is 0.
  static DateTime findYearWithOffset({
    required DateTime date,
    required int offset,
  }) =>
      OffsetDates.findYearWithOffset(
        date: date,
        offset: offset,
      );

  /// Returns the `DateTime` representing the start of the next second from the current local time.
  ///
  /// This method calculates the next full second after the current `DateTime.now()`.
  /// It sets the milliseconds and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next second.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextSecond = DateFinder.nextSecondFromNow();
  /// // If the current time is 12:34:56.789, nextSecond will be 12:34:57.000.
  /// ```
  ///
  /// - Returns: A `DateTime` set to the start of the next second from the current local time.
  static DateTime nextSecondFromNow() => NextDates.nextSecondFromNow();

  /// Returns the `DateTime` representing the start of the next minute from the current local time.
  ///
  /// This method calculates the next full minute after the current `DateTime.now()`.
  /// It sets the seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next minute.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextMinute = DateFinder.nextMinuteFromNow();
  /// // If the current time is 12:34:56, nextMinute will be 12:35:00.
  /// ```
  ///
  /// - Returns: A `DateTime` set to the start of the next minute from the current local time.
  static DateTime nextMinuteFromNow() => NextDates.nextMinuteFromNow();

  /// Returns the `DateTime` representing the start of the next hour from the current local time.
  ///
  /// This method calculates the next full hour after the current `DateTime.now()`.
  /// It sets the minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next hour.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextHour = DateFinder.nextHourFromNow();
  /// // If the current time is 12:34:56, nextHour will be 13:00:00.
  /// ```
  ///
  /// - Returns: A `DateTime` set to the start of the next hour from the current local time.
  static DateTime nextHourFromNow() => NextDates.nextHourFromNow();

  /// Returns the `DateTime` representing the start of the next day from the current local time.
  ///
  /// This method calculates the next full day after the current `DateTime.now()`.
  /// It sets the hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next day.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextDay = DateFinder.nextDayFromNow);
  /// // If the current time is August 21st, 12:34:56, nextDay will be August 22nd, 00:00:00.
  /// ```
  ///
  /// - Returns: A `DateTime` set to the start of the next day from the current local time.
  static DateTime nextDayFromNow() => NextDates.nextDayFromNow();

  /// Returns the `DateTime` representing the start of the next week from the current time, based on the specified [weekStartDay].
  ///
  /// This method calculates the start of the next week after the current `DateTime.now()`,
  /// aligned to the specified day of the week that marks the beginning of the week.
  /// It sets the hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next week.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextWeek = DateFinder.nextWeekFromNow( WeekStartDay: WeekStartDay.monday);
  /// // If the current time is Wednesday, August 21st, 2024, 12:34:56, and the week starts on Monday,
  /// // nextWeek will be Monday, August 26th, 2024, 00:00:00.
  /// ```
  ///
  /// - Parameters:
  ///   - [weekStartDay]: The day of the week that the user specifies as the start of the week (e.g., Sunday or Monday).
  ///
  /// - Returns: A `DateTime` set to the start of the next week from the current local time, based on the specified [weekStartDay].
  static DateTime nextWeekFromNow({
    required WeekStartDay weekStartDay,
  }) =>
      NextDates.nextWeekFromNow(weekStartDay);

  /// Returns the `DateTime` representing the start of the next month from the current local time.
  ///
  /// This method calculates the start of the next month after the current `DateTime.now()`.
  /// It sets the day, hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next month.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextMonth = DateFinder.nextMonthFromNow();
  /// // If the current time is August 21st, 12:34:56, nextMonth will be September 1st, 00:00:00.
  /// ```
  ///
  /// - Returns: A `DateTime` set to the start of the next month from the current local time.
  static DateTime nextMonthFromNow() => NextDates.nextMonthFromNow();

  /// Returns the `DateTime` representing the start of the next year from the current local time.
  ///
  /// This method calculates the start of the next year after the current `DateTime.now()`.
  /// It sets the month, day, hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next year.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextYear = DateFinder.nextYearFromNow();
  /// // If the current time is August 21st, 12:34:56, nextYear will be January 1st of the following year, 00:00:00.
  /// ```
  ///
  /// - Returns: A `DateTime` set to the start of the next year from the current local time.
  static DateTime nextYearFromNow() => NextDates.nextYearFromNow();

  /// Returns the `DateTime` representing the start of the next second from the given [date].
  ///
  /// This method calculates the next full second after the provided [date].
  /// It sets the milliseconds and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next second.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextSecond = DateFinder.nextSecondFromDate(DateTime(2024, 8, 21, 12, 34, 56));
  /// // nextSecond will be 2024-08-21 12:34:57.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the next second from the given [date].
  static DateTime nextSecondFromDate(DateTime date) =>
      NextDates.nextSecondFromDate(date);

  /// Returns the `DateTime` representing the start of the next minute from the given [date].
  ///
  /// This method calculates the next full minute after the provided [date].
  /// It sets the seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next minute.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextMinute = DateFinder.nextMinuteFromDate(DateTime(2024, 8, 21, 12, 24, 10));
  /// // nextMinute will be 2024-08-21 12:25:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the next minute from the given [date].
  static DateTime nextMinuteFromDate(DateTime date) =>
      NextDates.nextMinuteFromDate(date);

  /// Returns the `DateTime` representing the start of the next hour from the given [date].
  ///
  /// This method calculates the next full hour after the provided [date].
  /// It sets the minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next hour.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextHour = DateFinder.nextHourFromDate(DateTime(2024, 8, 21, 12, 34, 56));
  /// // nextHour will be 2024-08-21 13:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the next hour from the given [date].
  static DateTime nextHourFromDate(DateTime date) =>
      NextDates.nextHourFromDate(date);

  /// Returns the `DateTime` representing the start of the next day from the given [date].
  ///
  /// This method calculates the next full day after the provided [date].
  /// It sets the hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next day.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextDay = DateFinder.nextDayFromDate(DateTime(2024, 8, 21, 12, 34, 56));
  /// // nextDay will be 2024-08-22 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the next day from the given [date].
  static DateTime nextDayFromDate(DateTime date) =>
      NextDates.nextDayFromDate(date);

  /// Returns the `DateTime` representing the start of the next week from the given [date], based on the specified [weekStartDay].
  ///
  /// This method calculates the start of the next week after the provided [date],
  /// aligned to the specified day of the week that marks the beginning of the week.
  /// It sets the hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next week.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextWeek = DateFinder.nextWeekFromDate(DateTime(2024, 8, 21, 12, 34, 56), WeekStartDay.monday);
  /// // If the week starts on Monday, nextWeek will be Monday, August 26th, 2024, 00:00:00.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///   - [weekStartDay]: The day of the week that the user specifies as the start of the week (e.g., Sunday or Monday).
  ///
  /// - Returns: A `DateTime` set to the start of the next week from the given [date], based on the specified [weekStartDay].
  static DateTime nextWeekFromDate(
          {required DateTime date, required WeekStartDay weekStartDay}) =>
      NextDates.nextWeekFromDate(
        date,
        weekStartDay,
      );

  /// Returns the `DateTime` representing the start of the next month from the given [date].
  ///
  /// This method calculates the start of the next month after the provided [date].
  /// It sets the day, hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next month.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextMonth = DateFinder.nextMonthFromDate(DateTime(2024, 8, 21, 12, 34, 56));
  /// // nextMonth will be 2024-09-01 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the next month from the given [date].
  static DateTime nextMonthFromDate(DateTime date) =>
      NextDates.nextMonthFromDate(date);

  /// Returns the `DateTime` representing the start of the next year from the given [date].
  ///
  /// This method calculates the start of the next year after the provided [date].
  /// It sets the month, day, hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the next year.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime nextYear = DateFinder.nextYearFromDate(DateTime(2024, 8, 21, 12, 34, 56));
  /// // nextYear will be 2025-01-01 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the next year from the given [date].
  static DateTime nextYearFromDate(DateTime date) =>
      NextDates.nextYearFromDate(date);

  /// Returns the `DateTime` representing the start of the current second from the current local time.
  ///
  /// This method calculates the current full second, setting the milliseconds and microseconds
  /// to zero, ensuring that the returned `DateTime` is at the very beginning of the current second.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentSecond = DateFinder.currentSecondFromNow();
  /// // If the current time is 2024-08-21 12:34:56.789, currentSecond will be 2024-08-21 12:34:56.000.
  /// ```
  ///
  /// - Returns: A `DateTime` set to the start of the current second in local time.
  static DateTime currentSecondFromNow() => CurrentDates.currentSecondFromNow();

  /// Returns the `DateTime` representing the start of the current minute from the current local time.
  ///
  /// This method calculates the current full minute, setting the seconds, milliseconds, and microseconds
  /// to zero, ensuring that the returned `DateTime` is at the very beginning of the current minute.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentMinute = DateFinder.currentMinuteFromNow();
  /// // If the current time is 2024-08-21 12:34:56.789, currentMinute will be 2024-08-21 12:34:00.000.
  /// ```
  ///
  /// - Returns: A `DateTime` set to the start of the current minute in local time.
  static DateTime currentMinuteFromNow() => CurrentDates.currentMinuteFromNow();

  /// Returns the `DateTime` representing the start of the current hour from the current local time.
  ///
  /// This method calculates the current full hour, setting the minutes, seconds, milliseconds, and microseconds
  /// to zero, ensuring that the returned `DateTime` is at the very beginning of the current hour.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentHour = DateFinder.currentHourFromNow();
  /// // If the current time is 2024-08-21 12:34:56.789, currentHour will be 2024-08-21 12:00:00.000.
  /// ```
  ///
  /// - Returns: A `DateTime` set to the start of the current hour in local time.
  static DateTime currentHourFromNow() => CurrentDates.currentHourFromNow();

  /// Returns the `DateTime` representing the start of the current day from the current local time.
  ///
  /// This method calculates the current full day, setting the hour, minutes, seconds, milliseconds, and microseconds
  /// to zero, ensuring that the returned `DateTime` is at the very beginning of the current day.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentDay = DateFinder.currentDayFromNow();
  /// // If the current time is 2024-08-21 12:34:56.789, currentDay will be 2024-08-21 00:00:00.000.
  /// ```
  ///
  /// - Returns: A `DateTime` set to the start of the current day in local time.
  static DateTime currentDayFromNow() => CurrentDates.currentDayFromNow();

  /// Returns the `DateTime` representing the start of the current week from the current time, based on the specified [weekStartDay].
  ///
  /// This method calculates the start of the current week, aligned to the specified day of the week
  /// that marks the beginning of the week. It sets the hour, minutes, seconds, milliseconds, and microseconds
  /// to zero, ensuring that the returned `DateTime` is at the very beginning of the current week.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentWeek = DateFinder.currentWeekFromNow(WeekStartDay.monday);
  /// // If the current time is Wednesday, August 21st, 2024, and the week starts on Monday,
  /// // currentWeek will be Monday, August 19th, 2024, 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [weekStartDay]: The day of the week that the user specifies as the start of the week (e.g., Sunday or Monday).
  ///
  /// - Returns: A `DateTime` set to the start of the current week in local time, based on the specified [weekStartDay].
  static DateTime currentWeekFromNow({
    required WeekStartDay weekStartDay,
  }) =>
      CurrentDates.currentWeekFromNow(weekStartDay);

  /// Returns the `DateTime` representing the start of the current month from the current local time.
  ///
  /// This method calculates the start of the current month, setting the day, hour, minutes, seconds,
  /// milliseconds, and microseconds to zero, ensuring that the returned `DateTime` is at the very beginning of the current month.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentMonth = DateFinder.currentMonthFromNow();
  /// // If the current time is August 21st, 2024, 12:34:56.789, currentMonth will be August 1st, 2024, 00:00:00.000.
  /// ```
  ///
  ///
  /// - Returns: A `DateTime` set to the start of the current month in local time.
  static DateTime currentMonthFromNow() => CurrentDates.currentMonthFromNow();

  /// Returns the `DateTime` representing the start of the current year from the current local time.
  ///
  /// This method calculates the start of the current year, setting the month, day, hour, minutes, seconds,
  /// milliseconds, and microseconds to zero, ensuring that the returned `DateTime` is at the very beginning of the current year.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentYear = DateFinder.currentYearFromNow();
  /// // If the current time is August 21st, 2024, 12:34:56.789, currentYear will be January 1st, 2024, 00:00:00.000.
  /// ```
  ///
  ///
  /// - Returns: A `DateTime` set to the start of the current year in local time.
  static DateTime currentYearFromNow() => CurrentDates.currentYearFromNow();

  /// Returns the `DateTime` representing the start of the second for the provided [date].
  ///
  /// This method calculates the beginning of the second based on the given [date],
  /// setting the milliseconds and microseconds to zero, ensuring that the returned `DateTime`
  /// is aligned to the start of that specific second.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime givenDate = DateTime(2024, 8, 21, 12, 34, 56, 789);
  /// DateTime currentSecond = DateFinder.currentSecondFromDate(givenDate);
  /// // currentSecond will be 2024-08-21 12:34:56.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The `DateTime` from which to calculate the start of the second.
  /// - Returns: A `DateTime` set to the start of the second of the provided [date].
  static DateTime currentSecondFromDate(DateTime date) =>
      CurrentDates.currentSecondFromDate(date);

  /// Returns the `DateTime` representing the start of the minute for the provided [date].
  ///
  /// This method calculates the beginning of the minute based on the given [date],
  /// setting the seconds, milliseconds, and microseconds to zero, ensuring that the returned `DateTime`
  /// is aligned to the start of that specific minute.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime givenDate = DateTime(2024, 8, 21, 12, 34, 56, 789);
  /// DateTime currentMinute = DateFinder.currentMinuteFromDate(givenDate);
  /// // currentMinute will be 2024-08-21 12:34:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The `DateTime` from which to calculate the start of the minute.
  /// - Returns: A `DateTime` set to the start of the minute of the provided [date].
  static DateTime currentMinuteFromDate(DateTime date) =>
      CurrentDates.currentMinuteFromDate(date);

  /// Returns the `DateTime` representing the start of the hour for the provided [date].
  ///
  /// This method calculates the beginning of the hour based on the given [date],
  /// setting the minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned `DateTime`
  /// is aligned to the start of that specific hour.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime givenDate = DateTime(2024, 8, 21, 12, 34, 56, 789);
  /// DateTime currentHour = DateFinder.currentHourFromDate(givenDate);
  /// // currentHour will be 2024-08-21 12:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The `DateTime` from which to calculate the start of the hour.
  /// - Returns: A `DateTime` set to the start of the hour of the provided [date].
  static DateTime currentHourFromDate(DateTime date) =>
      CurrentDates.currentHourFromDate(date);

  /// Returns the `DateTime` representing the start of the day for the provided [date].
  ///
  /// This method calculates the beginning of the day based on the given [date],
  /// setting the hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned `DateTime`
  /// is aligned to the start of that specific day.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime givenDate = DateTime(2024, 8, 21, 12, 34, 56, 789);
  /// DateTime currentDay = DateFinder.currentDayFromDate(givenDate);
  /// // currentDay will be 2024-08-21 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The `DateTime` from which to calculate the start of the day.
  /// - Returns: A `DateTime` set to the start of the day of the provided [date].
  static DateTime currentDayFromDate(DateTime date) =>
      CurrentDates.currentDayFromDate(date);

  /// Returns the `DateTime` representing the start of the week for the provided [date],
  /// aligned to the specified [weekStartDay].
  ///
  /// This method calculates the start of the week based on the given [date], aligning it to the
  /// specified [weekStartDay]. The time components (hour, minutes, seconds, milliseconds, and microseconds)
  /// are set to zero, ensuring that the returned `DateTime` is at the very beginning of that specific week.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime givenDate = DateTime(2024, 8, 21, 12, 34, 56, 789);
  /// DateTime currentWeek = DateFinder.currentWeekFromDate(givenDate, WeekStartDay.monday);
  /// // If the given date is Wednesday, August 21st, 2024, and the week starts on Monday,
  /// // currentWeek will be Monday, August 19th, 2024, 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The `DateTime` from which to calculate the start of the week.
  ///   - [weekStartDay]: The day of the week that the user specifies as the start of the week (e.g., Sunday or Monday).
  /// - Returns: A `DateTime` set to the start of the week of the provided [date], aligned to the [weekStartDay].
  static DateTime currentWeekFromDate({
    required DateTime date,
    required WeekStartDay weekStartDay,
  }) =>
      CurrentDates.currentWeekFromDate(date, weekStartDay);

  /// Returns the `DateTime` representing the start of the month for the provided [date].
  ///
  /// This method calculates the beginning of the month based on the given [date],
  /// setting the day, hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned `DateTime`
  /// is aligned to the start of that specific month.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime givenDate = DateTime(2024, 8, 21, 12, 34, 56, 789);
  /// DateTime currentMonth = DateFinder.currentMonthFromDate(givenDate);
  /// // currentMonth will be August 1st, 2024, 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The `DateTime` from which to calculate the start of the month.
  /// - Returns: A `DateTime` set to the start of the month of the provided [date].
  static DateTime currentMonthFromDate(DateTime date) =>
      CurrentDates.currentMonthFromDate(date);

  /// Returns the `DateTime` representing the start of the year for the provided [date].
  ///
  /// This method calculates the beginning of the year based on the given [date],
  /// setting the month, day, hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned `DateTime`
  /// is aligned to the start of that specific year.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime givenDate = DateTime(2024, 8, 21, 12, 34, 56, 789);
  /// DateTime currentYear = DateFinder.currentYearFromDate(givenDate);
  /// // currentYear will be January 1st, 2024, 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The `DateTime` from which to calculate the start of the year.
  /// - Returns: A `DateTime` set to the start of the year of the provided [date].
  static DateTime currentYearFromDate(DateTime date) =>
      CurrentDates.currentYearFromDate(date);

  /// Returns the `DateTime` representing the start of the previous second from the current local time.
  ///
  /// This method calculates the previous full second before the current `DateTime.now()`.
  /// It sets the milliseconds and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous second.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousSecond = DateFinder.previousSecondFromNow();
  /// // If the current time is 12:34:56.789, previousSecond will be 12:34:55.000.
  /// ```
  /// - Returns: A `DateTime` set to the start of the previous second from the current local time.
  static DateTime previousSecondFromNow() =>
      PreviousDates.previousSecondFromNow();

  /// Returns the `DateTime` representing the start of the previous minute from the current local time.
  ///
  /// This method calculates the previous full minute before the current `DateTime.now()`.
  /// It sets the seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous minute.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousMinute = DateFinder.previousMinuteFromNow();
  /// // If the current time is 12:34:56, previousMinute will be 12:33:00.
  /// ```
  /// - Returns: A `DateTime` set to the start of the previous minute from the current local time.
  static DateTime previousMinuteFromNow() =>
      PreviousDates.previousMinuteFromNow();

  /// Returns the `DateTime` representing the start of the previous hour from the current local time.
  ///
  /// This method calculates the previous full hour before the current `DateTime.now()`.
  /// It sets the minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous hour.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousHour = DateFinder.previousHourFromNow();
  /// // If the current time is 12:34:56, previousHour will be 11:00:00.
  /// ```
  ///
  /// - Returns: A `DateTime` set to the start of the previous hour from the current local time.
  static DateTime previousHourFromNow() => PreviousDates.previousHourFromNow();

  /// Returns the `DateTime` representing the start of the previous day from the current local time.
  ///
  /// This method calculates the previous full day before the current `DateTime.now()`.
  /// It sets the hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous day.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousDay = DateFinder.previousDayFromNow();
  /// // If the current time is August 21st, 2024, 12:34:56, previousDay will be August 20th, 2024, 00:00:00.
  /// ```
  /// - Returns: A `DateTime` set to the start of the previous day from the current local time.
  static DateTime previousDayFromNow() => PreviousDates.previousDayFromNow();

  /// Returns the `DateTime` representing the start of the previous week from the current time, based on the specified [weekStartDay].
  ///
  /// This method calculates the start of the previous week before the current `DateTime.now()`,
  /// aligned to the specified day of the week that marks the beginning of the week.
  /// It sets the hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous week.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousWeek = DateFinder.previousWeekFromNow(weekStartDay: WeekStartDay.monday);
  /// // If the current time is Wednesday, August 21st, 2024, 12:34:56, and the week starts on Monday, previousWeek will be Monday, August 12th, 2024, 00:00:00.
  /// ```
  ///
  /// - Parameters:
  ///   - [weekStartDay]: The day of the week that the user specifies as the start of the week (e.g., Sunday or Monday).
  ///
  /// - Returns: A `DateTime` set to the start of the previous week from the current local time, based on the specified [weekStartDay].
  static DateTime previousWeekFromNow({
    required WeekStartDay weekStartDay,
  }) =>
      PreviousDates.previousWeekFromNow(weekStartDay);

  /// Returns the `DateTime` representing the start of the previous month from the current local time.
  ///
  /// This method calculates the start of the previous month before the current `DateTime.now()`.
  /// It sets the day, hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous month.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousMonth = DateFinder.previousMonthFromNow();
  /// // If the current time is August 21st, 2024, 12:34:56, previousMonth will be July 1st, 2024, 00:00:00.
  /// ```
  /// - Returns: A `DateTime` set to the start of the previous month from the current local time.
  static DateTime previousMonthFromNow() =>
      PreviousDates.previousMonthFromNow();

  /// Returns the `DateTime` representing the start of the previous year from the current local time.
  ///
  /// This method calculates the start of the previous year before the current `DateTime.now()`.
  /// It sets the month, day, hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous year.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousYear = DateFinder.previousYearFromNow();
  /// // If the current time is August 21st, 2024, 12:34:56, previousYear will be January 1st, 2023, 00:00:00.
  /// ```
  /// - Returns: A `DateTime` set to the start of the previous year from the current local time.
  static DateTime previousYearFromNow() => PreviousDates.previousYearFromNow();

  /// Returns the `DateTime` representing the start of the previous second from the given [date].
  ///
  /// This method calculates the previous full second before the provided [date].
  /// It sets the milliseconds and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous second.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousSecond = DateFinder.previousSecondFromDate(DateTime(2024, 8, 21, 12, 34, 56));
  /// // previousSecond will be 2024-08-21 12:34:55.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the previous second from the given [date].
  static DateTime previousSecondFromDate(DateTime date) =>
      PreviousDates.previousSecondFromDate(date);

  /// Returns the `DateTime` representing the start of the previous minute from the given [date].
  ///
  /// This method calculates the previous full minute before the provided [date].
  /// It sets the seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous minute.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousMinute = DateFinder.previousMinuteFromDate(DateTime(2024, 8, 21, 12, 34, 56));
  /// // previousMinute will be 2024-08-21 12:33:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the previous minute from the given [date].
  static DateTime previousMinuteFromDate(DateTime date) =>
      PreviousDates.previousMinuteFromDate(date);

  /// Returns the `DateTime` representing the start of the previous hour from the given [date].
  ///
  /// This method calculates the previous full hour before the provided [date].
  /// It sets the minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous hour.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousHour = DateFinder.previousHourFromDate(DateTime(2024, 8, 21, 12, 34, 56));
  /// // previousHour will be 2024-08-21 11:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the previous hour from the given [date].
  static DateTime previousHourFromDate(DateTime date) =>
      PreviousDates.previousHourFromDate(date);

  /// Returns the `DateTime` representing the start of the previous day from the given [date].
  ///
  /// This method calculates the previous full day before the provided [date].
  /// It sets the hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous day.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousDay = DateFinder.previousDayFromDate(DateTime(2024, 8, 21, 12, 34, 56));
  /// // previousDay will be 2024-08-20 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the previous day from the given [date].
  static DateTime previousDayFromDate(DateTime date) =>
      PreviousDates.previousDayFromDate(date);

  /// Returns the `DateTime` representing the start of the previous week from the given [date], based on the specified [weekStartDay].
  ///
  /// This method calculates the start of the previous week before the provided [date],
  /// aligned to the specified day of the week that marks the beginning of the week.
  /// It sets the hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous week.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousWeek = DateFinder.previousWeekFromDate(DateTime(2024, 8, 21, 12, 34, 56), WeekStartDay.monday);
  /// // If the week starts on Monday, previousWeek will be Monday, August 12th, 2024, 00:00:00.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///   - [weekStartDay]: The day of the week that the user specifies as the start of the week (e.g., Sunday or Monday).
  ///
  /// - Returns: A `DateTime` set to the start of the previous week from the given [date], based on the specified [weekStartDay].
  static DateTime previousWeekFromDate({
    required DateTime date,
    required WeekStartDay weekStartDay,
  }) =>
      PreviousDates.previousWeekFromDate(date, weekStartDay);

  /// Returns the `DateTime` representing the start of the previous month from the given [date].
  ///
  /// This method calculates the start of the previous month before the provided [date].
  /// It sets the day, hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous month.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousMonth = DateFinder.previousMonthFromDate(DateTime(2024, 8, 21, 12, 34, 56));
  /// // previousMonth will be 2024-07-01 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the previous month from the given [date].
  static DateTime previousMonthFromDate(DateTime date) =>
      PreviousDates.previousMonthFromDate(date);

  /// Returns the `DateTime` representing the start of the previous year from the given [date].
  ///
  /// This method calculates the start of the previous year before the provided [date].
  /// It sets the month, day, hour, minutes, seconds, milliseconds, and microseconds to zero, ensuring that the returned
  /// `DateTime` is at the very beginning of the previous year.
  ///
  ///
  /// Example usage:
  /// ```dart
  /// DateTime previousYear = DateFinder.previousYearFromDate(DateTime(2024, 8, 21, 12, 34, 56));
  /// // previousYear will be 2023-01-01 00:00:00.000.
  /// ```
  ///
  /// - Parameters:
  ///   - [date]: The original `DateTime` from which the calculation starts.
  ///
  /// - Returns: A `DateTime` set to the start of the previous year from the given [date].
  static DateTime previousYearFromDate(DateTime date) =>
      PreviousDates.previousYearFromDate(date);

  /// Returns a list of `DateTime` objects representing a range of dates between the specified [startDate] and [endDate].
  ///
  /// The dates in the range are calculated based on the provided [interval], which can be seconds, minutes, hours, days, weeks, months, or years.
  /// The method can include or exclude the [startDate] and [endDate] based on the [includeStartDate] and [includeEndDate] parameters.
  ///
  /// For the "week" interval, the method offers options for how to handle the range when the [startDate] is in the middle of the week.
  /// By default, the range will align to the start of the week as specified by [weekStartDay]. However, you can customize this behavior using [weekDateRangeOptions].
  ///
  /// Example usage:
  /// ```dart
  /// DateTime startDate = DateTime(2024, 8, 21);
  /// DateTime endDate = DateTime(2024, 9, 21);
  ///
  /// List<DateTime> dateRange = DateFinder.findDateRange(
  ///   startDate: startDate,
  ///   endDate: endDate,
  ///   interval: TimeUnit.day,
  ///   includeStartDate: true,
  ///   includeEndDate: false,
  /// );
  /// // The list will contain dates from the start date to one day before the end date.
  /// ```
  ///
  /// - Parameters:
  ///   - [startDate]: The `DateTime` representing the beginning of the range. If [includeStartDate] is true, this date will be included in the result.
  ///   - [endDate]: The `DateTime` representing the end of the range. If [includeEndDate] is true, this date will be included in the result.
  ///   - [interval]: The `TimeUnit` to determine the interval between dates in the range. This can be seconds, minutes, hours, days, weeks, months, or years.
  ///   - [includeStartDate]: A boolean indicating whether the [startDate] should be included in the result. Defaults to true.
  ///   - [includeEndDate]: A boolean indicating whether the [endDate] should be included in the result. Defaults to true.
  ///   - [weekDateRangeOptions]: Specifies how to handle the range if [interval] is set to weeks, especially when [startDate] is not at the start of the week. Defaults to aligning to the start of the week.
  ///   - [weekStartDay]: The day of the week considered as the start of the week. Defaults to Monday.
  ///
  /// - Returns: A list of `DateTime` objects representing the range of dates between the [startDate] and [endDate].
  ///
  /// - Throws:
  ///   - `ArgumentError` if [startDate] is after or the same as [endDate].
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
    if (startDate.isAfter(endDate) || startDate.isAtSameMomentAs(endDate)) {
      throw ArgumentError('startDate must be before endDate');
    }
    return RangeFinder.findDateRange(
      startDate: startDate,
      endDate: endDate,
      interval: interval,
      weekStartDay: weekStartDay,
      includeEndDate: includeEndDate,
      includeStartDate: includeStartDate,
      weekDateRangeOptions: weekDateRangeOptions,
    );
  }

  /// Finds the start and end boundaries of the specified time unit for the given date.
  ///
  /// This method returns the start and end boundaries of the time unit
  /// (e.g., day, week, month, year) that the provided `date` falls within.
  /// The boundaries are calculated based on the specified time unit and
  /// the starting day of the week if the time unit is a week.
  ///
  /// The returned boundaries are in the form of a `TimeUnitBoundaries` object,
  /// which contains:
  /// - `start`: The start of the specified time unit. For example, if the
  ///   `timeUnit` is `month`, `start` will be the first moment of the first day
  ///   of that month.
  /// - `end`: The end of the specified time unit, which is the very start of
  ///   the next time unit. For example, if the `timeUnit` is `month`, `end`
  ///   will be the very start of the first day of the next month.
  /// - `originDate`: The original `date` passed to the method.

  ///
  /// If `timeUnit` is `TimeUnit.week`, the `weekStartDay` parameter determines
  /// the day on which the week starts. By default, this is set to Monday.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime date = DateTime.now();
  /// TimeUnitBoundaries boundaries = findTimeUnitBoundaries(
  ///   date: date,
  ///   timeUnit: TimeUnit.month,
  /// );
  /// // boundaries.start will be the first day of the current month.
  /// // boundaries.end will be the last day of the current month.
  /// // boundaries.originDate will be the original date passed in.
  /// ```
  ///
  /// Parameters:
  /// - `date` (`DateTime`): The date for which to find the time unit boundaries.
  /// - `timeUnit` (`TimeUnit`): The time unit (e.g., day, week, month, year) to find the boundaries for.
  /// - `weekStartDay` (`WeekStartDay`): The day on which the week starts, used only if the `timeUnit` is `week`.
  ///
  /// Returns:
  /// - `TimeUnitBoundaries`: An object containing the start, end, and the original date.
  static TimeUnitBoundaries findTimeUnitBoundaries({
    required DateTime date,
    required TimeUnit timeUnit,
    WeekStartDay weekStartDay = WeekStartDay.monday,
  }) =>
      UnitBoundaryFinder.findBoundaries(
        date: date,
        timeUnit: timeUnit,
        offset: 0,
      );

  /// Finds the start and end boundaries of the specified time unit for the given date,
  /// applying an offset to the time unit.
  ///
  /// This method returns the start and end boundaries of the time unit
  /// (e.g., day, week, month, year) that is offset from the provided `date`
  /// by the specified `offset`. The boundaries are calculated based on the
  /// specified time unit and the starting day of the week if the time unit is a week.
  ///
  /// The returned boundaries are in the form of a `TimeUnitBoundaries` object,
  /// which contains:
  /// - `start`: The start of the specified time unit, adjusted by the `offset`.
  ///   - If the `offset` is 0, `start` will be the start of the current time unit.
  ///   - If the `offset` is positive, `start` will be shifted forward by that number of time units.
  ///   - If the `offset` is negative, `start` will be shifted backward by that number of time units.
  /// - `end`: The end of the specified time unit, also adjusted by the `offset`.
  ///   - If the `offset` is 0, `end` will be the start of the next time unit.
  ///   - If the `offset` is positive, `end` will be the start of the time unit following the adjusted `start`.
  ///   - If the `offset` is negative, `end` will be the start of the time unit following the adjusted `start`.
  /// - `originDate`: The original `date` passed to the method.
  ///
  /// If `timeUnit` is `TimeUnit.week`, the `weekStartDay` parameter determines
  /// the day on which the week starts. By default, this is set to Monday.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime date = DateTime.now();
  /// TimeUnitBoundaries boundaries = findTimeUnitBoundariesWithOffset(
  ///   date: date,
  ///   timeUnit: TimeUnit.month,
  ///   offset: 1,
  /// );
  /// // boundaries.start will be the first day of the next month.
  /// // boundaries.end will be the very start of the first day of the month after the next month.
  /// // boundaries.originDate will be the original date passed in.
  /// ```
  ///
  /// If the `offset` is 0, the boundaries will correspond to the current time unit.
  /// If the `offset` is positive, the boundaries will be for a future time unit.
  /// If the `offset` is negative, the boundaries will be for a past time unit.
  ///
  /// Parameters:
  /// - `date` (`DateTime`): The date for which to find the time unit boundaries.
  /// - `timeUnit` (`TimeUnit`): The time unit (e.g., day, week, month, year) to find the boundaries for.
  /// - `offset` (`int`): The number of time units to offset from the original date.
  /// - `weekStartDay` (`WeekStartDay`): The day on which the week starts, used only if the `timeUnit` is `week`.
  ///
  /// Returns:
  /// - `TimeUnitBoundaries`: An object containing the start, end, and the original date.
  static TimeUnitBoundaries findTimeUnitBoundariesWithOffset({
    required DateTime date,
    required TimeUnit timeUnit,
    required int offset,
    WeekStartDay weekStartDay = WeekStartDay.monday,
  }) =>
      UnitBoundaryFinder.findBoundaries(
        date: date,
        timeUnit: timeUnit,
        offset: offset,
        weekStartDay: weekStartDay,
      );
}
