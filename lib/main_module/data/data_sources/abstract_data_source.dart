import 'package:azkar/main_module/data/models/prayer_timing/prayer_timing.dart';

abstract class AbstractDataSource {
  Future<List<PrayerTiming>> getPrayerMonthCalendar(
      String lat, String long, String month, String year,
      {String calculationMethod = "2"});
}
