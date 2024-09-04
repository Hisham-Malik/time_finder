import 'package:time_finder/time_finder.dart';

void main() {
  DateTime date = DateTime(2024, 8, 21, 12, 34, 56);

  // Example 1: Finding the start of the current month
  DateTime startOfCurrentMonth = TimeFinder.currentMonthFromDate(date);
  print(
      'Start of Current Month: $startOfCurrentMonth'); // Output: 2024-08-01 00:00:00.000

  // Example 2: Finding the start of the next month
  DateTime startOfNextMonth = TimeFinder.nextMonthFromDate(date);
  print(
      'Start of Next Month: $startOfNextMonth'); // Output: 2024-09-01 00:00:00.000

  // Example 3: Finding the start of the previous month
  DateTime startOfPreviousMonth = TimeFinder.previousMonthFromDate(date);
  print(
      'Start of Previous Month: $startOfPreviousMonth'); // Output: 2024-07-01 00:00:00.000

  // Example 4: Finding the start of the current year
  DateTime startOfCurrentYear = TimeFinder.currentYearFromDate(date);
  print(
      'Start of Current Year: $startOfCurrentYear'); // Output: 2024-01-01 00:00:00.000

  // Example 5: Finding the start of the next year
  DateTime startOfNextYear = TimeFinder.nextYearFromDate(date);
  print(
      'Start of Next Year: $startOfNextYear'); // Output: 2025-01-01 00:00:00.000

  // Example 6: Finding the start of the previous year
  DateTime startOfPreviousYear = TimeFinder.previousYearFromDate(date);
  print(
      'Start of Previous Year: $startOfPreviousYear'); // Output: 2023-01-01 00:00:00.000

  // Example 7: Finding the start of the current week with Monday as the start day
  DateTime startOfCurrentWeek = TimeFinder.currentWeekFromDate(
    date: date,
    weekStartDay: WeekStartDay.monday,
  );
  print(
      'Start of Current Week: $startOfCurrentWeek'); // Output depends on weekStartDay

  // Example 8: Finding the start of the next week with Sunday as the start day
  DateTime startOfNextWeek = TimeFinder.nextWeekFromDate(
    date: date,
    weekStartDay: WeekStartDay.sunday,
  );
  print(
      'Start of Next Week (Sunday): $startOfNextWeek'); // Output depends on weekStartDay

  // Example 9: Finding the start of the previous day
  DateTime startOfPreviousDay = TimeFinder.previousDayFromDate(date);
  print(
      'Start of Previous Day: $startOfPreviousDay'); // Output: 2024-08-20 00:00:00.000

  // Example 10: Finding the start of the next day
  DateTime startOfNextDay = TimeFinder.nextDayFromDate(date);
  print(
      'Start of Next Day: $startOfNextDay'); // Output: 2024-08-22 00:00:00.000

  // Example 11: Finding the start of the current minute
  DateTime startOfCurrentMinute = TimeFinder.currentMinuteFromDate(date);
  print(
      'Start of Current Minute: $startOfCurrentMinute'); // Output: 2024-08-21 12:34:00.000

  // Example 12: Finding the start of the next minute
  DateTime startOfNextMinute = TimeFinder.nextMinuteFromDate(date);
  print(
      'Start of Next Minute: $startOfNextMinute'); // Output: 2024-08-21 12:35:00.000

  // Example 13: Finding the start of the previous minute
  DateTime startOfPreviousMinute = TimeFinder.previousMinuteFromDate(date);
  print(
      'Start of Previous Minute: $startOfPreviousMinute'); // Output: 2024-08-21 12:33:00.000

  // Example 14: Finding the start of the current hour
  DateTime startOfCurrentHour = TimeFinder.currentHourFromDate(date);
  print(
      'Start of Current Hour: $startOfCurrentHour'); // Output: 2024-08-21 12:00:00.000

  // Example 15: Finding the start of the next hour
  DateTime startOfNextHour = TimeFinder.nextHourFromDate(date);
  print(
      'Start of Next Hour: $startOfNextHour'); // Output: 2024-08-21 13:00:00.000

  // Example 16: Finding the start of the previous hour
  DateTime startOfPreviousHour = TimeFinder.previousHourFromDate(date);
  print(
      'Start of Previous Hour: $startOfPreviousHour'); // Output: 2024-08-21 11:00:00.000

  // Example 17: Finding the boundaries of the current month
  TimeUnitBoundaries monthBoundaries = TimeFinder.findTimeUnitBoundaries(
    date: date,
    timeUnit: TimeUnit.month,
  );
  print(
      'Current Month Start: ${monthBoundaries.start}'); // Output: 2024-08-01 00:00:00.000
  print(
      'Current Month End: ${monthBoundaries.end}'); // Output: 2024-09-01 00:00:00.000

  // Example 18: Finding the boundaries of the current day
  TimeUnitBoundaries dayBoundaries = TimeFinder.findTimeUnitBoundaries(
    date: date,
    timeUnit: TimeUnit.day,
  );
  print(
      'Current Day Start: ${dayBoundaries.start}'); // Output: 2024-08-21 00:00:00.000
  print(
      'Current Day End: ${dayBoundaries.end}'); // Output: 2024-08-22 00:00:00.000

  // Example 19: Using findDate to find the start of a month with an offset
  DateTime startOfOffsetMonth = TimeFinder.findDate(
    date: date,
    timeUnit: TimeUnit.month,
    offset: 2, // Finding the start of the month two months ahead
  );
  print(
      'Start of Month Two Months Ahead: $startOfOffsetMonth'); // Output: 2024-10-01 00:00:00.000
}
