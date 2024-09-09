# TimeFinder

**TimeFinder** is a Dart package that provides a set of utilities for manipulating and querying `DateTime` objects based on various time units such as seconds, minutes, hours, days, weeks, months, and years. It allows developers to find specific time boundaries, calculate dates with offsets, and more.

## Features

- **Find Specific Time Boundaries:** Calculate the start and end of time units (e.g., start of the month, end of the year) based on a given date.
- **Offset Date Calculation:** Move forwards or backwards in time by applying offsets to various time units.
- **Support for Custom Week Start Days:** Customize the start day of the week when working with week-based calculations.
- **Handle Multiple Time Units:** Work with different time units including seconds, minutes, hours, days, weeks, months, and years.
- **Flexible and Powerful API:** Designed to be easy to use while offering advanced functionality for complex date manipulations.

## Use Cases

- **Reporting** Calculate the start and end of days, weeks, months, or years to generate accurate reports and summaries.
- **Event Scheduling** Determine exact time boundaries to plan and schedule events, tasks, or billing cycles.
- **Time-Based Analytics** Segment and analyze time-series data by day, week, month, or year for detailed insights.
- **Handling Offsets** Calculate time unit boundaries with specific offsets for future planning or historical analysis.

## Getting started

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  time_finder: ^1.0.1
```

Then, run `dart pub get` to install the package.

## Usage

### Finding Date with Offset

Use `TimeFinder` to calculate a date by applying an offset to a specified time unit:

```dart
import 'package:time_finder/time_finder.dart';

void main() {
  DateTime date = DateTime(2024, 8, 21, 12, 34, 56);

  // Find the start of the current month
  DateTime startOfCurrentMonth = TimeFinder.currentMonthFromDate(date);
  print(startOfCurrentMonth); // Output: 2024-08-01 00:00:00.000

  // Find the start of the next month
  DateTime startOfNextMonth = TimeFinder.nextMonthFromDate(date);
  print(startOfNextMonth); // Output: 2024-09-01 00:00:00.000
}
```

*Note: There are many more methods available in the `TimeFinder` class, such as `currentYearFromDate`, `nextYearFromDate`, `previousMonthFromDate`, etc., which offer similar functionality for different time units. You can use these methods as an alternative to the general-purpose `findDate` method for more specific operations.*

### Finding Time Unit Boundaries

Calculate the start and end of a specified time unit:

```dart
import 'package:time_finder/time_finder.dart';

void main() {
  DateTime date = DateTime(2024, 8, 21, 12, 34, 56);

  // Find the boundaries of the current month
  TimeUnitBoundaries boundaries = TimeFinder.findTimeUnitBoundaries(
    date: date,
    timeUnit: TimeUnit.month,
  );
  print(boundaries.start); // Output: 2024-08-01 00:00:00.000
  print(boundaries.end);   // Output: 2024-09-01 00:00:00.000
}
```

## API Reference

The complete API documentation can be found [here](https://pub.dev/documentation/time_finder/latest/). It includes details on all available methods and their usage.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss your ideas.

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
