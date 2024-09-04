/// A class representing the start and end boundaries of a time unit,
/// based on an origin date.
///
/// This class is used to encapsulate the start and end `DateTime`
/// objects that define the boundaries of a specific time unit
/// (e.g., a day, week, month, or year). The boundaries are calculated
/// based on an `originDate`.
///
/// Example:
/// ```dart
/// final boundaries = TimeUnitBoundaries(
///   start: DateTime(2024, 9, 1),
///   end: DateTime(2024, 10, 1),
///   originDate: DateTime(2024, 9, 15),
/// );
///
/// print(boundaries.start); // 2024-09-01 00:00:00.000
/// print(boundaries.end);   // 2024-10-01 00:00:00.000
/// print(boundaries.originDate); // 2024-09-15 00:00:00.000
/// ```
class TimeUnitBoundaries {
  /// The start boundary of the time unit.
  ///
  /// This `DateTime` represents the very beginning of the time unit, such as
  /// the start of a day, week, month, or year.
  final DateTime start;

  /// The end boundary of the time unit.
  ///
  /// This `DateTime` represents the start of the next time unit, such as
  /// the start of the next day, week, month, or year.
  final DateTime end;

  /// The origin date used to calculate the boundaries.
  ///
  /// This `DateTime` is the reference date from which the start and end boundaries
  /// are derived. It typically represents a specific point in time within the
  /// time unit.
  final DateTime originDate;

  /// Creates an instance of [TimeUnitBoundaries] with the specified start,
  /// end, and origin date.
  ///
  /// The [start] defines the beginning of the time unit, [end] defines the start
  /// of the next time unit, and [originDate] is the date from which these
  /// boundaries were calculated.
  const TimeUnitBoundaries({
    required this.start,
    required this.end,
    required this.originDate,
  });
}
