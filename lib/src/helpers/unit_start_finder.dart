import 'package:time_finder/src/enums.dart';

class UnitStartFinder {
  static DateTime getUnitStart({
    required DateTime date,
    required TimeUnit timeUnit,
    required WeekStartDay weekStartDay,
  }) =>
      switch (timeUnit) {
        TimeUnit.second => _getSecondStart(date),
        TimeUnit.minute => _getMinuteStart(date),
        TimeUnit.hour => _getHourStart(date),
        TimeUnit.day => _getDayStart(date),
        TimeUnit.week => _getWeekStart(date, weekStartDay),
        TimeUnit.month => _getMonthStart(date),
        TimeUnit.year => _getYearStart(date),
      };

  static DateTime _getSecondStart(DateTime date) => DateTime(
      date.year, date.month, date.day, date.hour, date.minute, date.second);

  static DateTime _getMinuteStart(DateTime date) =>
      DateTime(date.year, date.month, date.day, date.hour, date.minute);

  static DateTime _getHourStart(DateTime date) =>
      DateTime(date.year, date.month, date.day, date.hour);

  static DateTime _getDayStart(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static DateTime _getWeekStart(DateTime date, WeekStartDay weekStartDay) {
    final DateTime startOfDay = _getDayStart(date);
    final dayOffset = _weekStartOffset(date, weekStartDay);
    final DateTime startOfWeek = startOfDay.subtract(Duration(days: dayOffset));
    return startOfWeek;
  }

  static DateTime _getMonthStart(DateTime date) =>
      DateTime(date.year, date.month, 1);

  static DateTime _getYearStart(DateTime date) => DateTime(date.year, 1, 1);

  /// calculates the offset between the date and the start of the week
  /// e.g... if the first day of the week is sunday and the given date is friday the offset is 5
  static int _weekStartOffset(DateTime date, WeekStartDay option) =>
      switch (option) {
        WeekStartDay.sunday => switch (date.weekday) {
            DateTime.monday => 1,
            DateTime.tuesday => 2,
            DateTime.wednesday => 3,
            DateTime.thursday => 4,
            DateTime.friday => 5,
            DateTime.saturday => 6,
            _ => 0
          },
        WeekStartDay.monday => switch (date.weekday) {
            DateTime.tuesday => 1,
            DateTime.wednesday => 2,
            DateTime.thursday => 3,
            DateTime.friday => 4,
            DateTime.saturday => 5,
            DateTime.sunday => 6,
            _ => 0
          },
        WeekStartDay.tuesday => switch (date.weekday) {
            DateTime.wednesday => 1,
            DateTime.thursday => 2,
            DateTime.friday => 3,
            DateTime.saturday => 4,
            DateTime.sunday => 5,
            DateTime.monday => 6,
            _ => 0
          },
        WeekStartDay.wednesday => switch (date.weekday) {
            DateTime.thursday => 1,
            DateTime.friday => 2,
            DateTime.saturday => 3,
            DateTime.sunday => 4,
            DateTime.monday => 5,
            DateTime.tuesday => 6,
            _ => 0
          },
        WeekStartDay.thursday => switch (date.weekday) {
            DateTime.friday => 1,
            DateTime.saturday => 2,
            DateTime.sunday => 3,
            DateTime.monday => 4,
            DateTime.tuesday => 5,
            DateTime.wednesday => 6,
            _ => 0
          },
        WeekStartDay.friday => switch (date.weekday) {
            DateTime.saturday => 1,
            DateTime.sunday => 2,
            DateTime.monday => 3,
            DateTime.tuesday => 4,
            DateTime.wednesday => 5,
            DateTime.thursday => 6,
            _ => 0
          },
        WeekStartDay.saturday => switch (date.weekday) {
            DateTime.sunday => 1,
            DateTime.monday => 2,
            DateTime.tuesday => 3,
            DateTime.wednesday => 4,
            DateTime.thursday => 5,
            DateTime.friday => 6,
            _ => 0
          },
      };
}
