/// Enum representing the days of the week.
///
/// This enum provides a set of constants for each day of the week.
/// It can be used to specify which day should be considered the start
/// of the week in various time-related calculations.
///
/// Example:
/// ```dart
/// WeekStartDay startDay = WeekStartDay.monday;
/// if (startDay == WeekStartDay.monday) {
///   // Do something specific for weeks starting on Monday.
/// }
/// ```
enum WeekStartDay {
  /// Represents Sunday as the start of the week.
  sunday,

  /// Represents Monday as the start of the week.
  monday,

  /// Represents Tuesday as the start of the week.
  tuesday,

  /// Represents Wednesday as the start of the week.
  wednesday,

  /// Represents Thursday as the start of the week.
  thursday,

  /// Represents Friday as the start of the week.
  friday,

  /// Represents Saturday as the start of the week.
  saturday,
}

/// Enum representing different time units.
///
/// This enum provides constants for various time units. It is used to
/// specify the granularity of time for calculations and formatting.
///
/// Example:
/// ```dart
/// TimeUnit unit = TimeUnit.month;
/// if (unit == TimeUnit.month) {
///   // Perform operations related to months.
/// }
/// ```
enum TimeUnit {
  /// Represents a time unit of seconds.
  second,

  /// Represents a time unit of minutes.
  minute,

  /// Represents a time unit of hours.
  hour,

  /// Represents a time unit of days.
  day,

  /// Represents a time unit of weeks.
  week,

  /// Represents a time unit of months.
  month,

  /// Represents a time unit of years.
  year,
}

/// Enum representing options for aligning date ranges.
///
/// This enum provides options for aligning date ranges based on the start
/// of the week or the start date itself.
///
/// Example:
/// ```dart
/// WeekDateRangeOptions option = WeekDateRangeOptions.alignToStartDate;
/// if (option == WeekDateRangeOptions.alignToStartDate) {
///   // Align date ranges to the start date.
/// }
/// ```
enum WeekDateRangeOptions {
  /// Align date ranges to the start of the week.
  ///
  /// This option adjusts the date range to start at the beginning of the week
  /// based on the specified start day.
  alignToWeekStart,

  /// Align date ranges to the specified start date.
  ///
  /// This option keeps the date range aligned with the given start date.
  alignToStartDate,
}
