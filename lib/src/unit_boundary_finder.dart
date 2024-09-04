import 'package:time_finder/src/classes/time_unit_boundaries.dart';
import 'package:time_finder/src/enums.dart';
import 'package:time_finder/src/offset_dates.dart';

class UnitBoundaryFinder {
  static TimeUnitBoundaries findBoundaries({
    required DateTime date,
    required TimeUnit timeUnit,
    required int offset,
    WeekStartDay weekStartDay = WeekStartDay.monday,
  }) =>
      switch (timeUnit) {
        TimeUnit.second => TimeUnitBoundaries(
            start: OffsetDates.findSecondWithOffset(
              date: date,
              offset: offset,
            ),
            end: OffsetDates.findSecondWithOffset(
              date: date,
              offset: offset + 1,
            ),
            originDate: date,
          ),
        TimeUnit.minute => TimeUnitBoundaries(
            start: OffsetDates.findMinuteWithOffset(
              date: date,
              offset: offset,
            ),
            end: OffsetDates.findMinuteWithOffset(
              date: date,
              offset: offset + 1,
            ),
            originDate: date,
          ),
        TimeUnit.hour => TimeUnitBoundaries(
            start: OffsetDates.findHourWithOffset(
              date: date,
              offset: offset,
            ),
            end: OffsetDates.findHourWithOffset(
              date: date,
              offset: offset + 1,
            ),
            originDate: date,
          ),
        TimeUnit.day => TimeUnitBoundaries(
            start: OffsetDates.findDayWithOffset(
              date: date,
              offset: offset,
            ),
            end: OffsetDates.findDayWithOffset(
              date: date,
              offset: offset + 1,
            ),
            originDate: date,
          ),
        TimeUnit.week => TimeUnitBoundaries(
            start: OffsetDates.findWeekWithOffset(
              date: date,
              offset: offset,
              weekStartDay: weekStartDay,
            ),
            end: OffsetDates.findWeekWithOffset(
              date: date,
              offset: offset + 1,
              weekStartDay: weekStartDay,
            ),
            originDate: date,
          ),
        TimeUnit.month => TimeUnitBoundaries(
            start: OffsetDates.findMonthWithOffset(
              date: date,
              offset: offset,
            ),
            end: OffsetDates.findMonthWithOffset(
              date: date,
              offset: offset + 1,
            ),
            originDate: date,
          ),
        TimeUnit.year => TimeUnitBoundaries(
            start: OffsetDates.findYearWithOffset(
              date: date,
              offset: offset,
            ),
            end: OffsetDates.findYearWithOffset(
              date: date,
              offset: offset + 1,
            ),
            originDate: date,
          ),
      };
}
