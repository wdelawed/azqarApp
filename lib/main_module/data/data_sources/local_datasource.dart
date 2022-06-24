import 'package:azkar/main_module/data/data_sources/abstract_data_source.dart';
import 'package:azkar/main_module/data/exceptions.dart';
import 'package:azkar/main_module/data/models/prayer_timing/prayer_timing.dart';

class LocalDataSource implements AbstractDataSource {
  @override
  Future<List<PrayerTiming>> getPrayerMonthCalendar(
      String lat, String long, String month, String year,
      {String calculationMethod = "2"}) {
    throw LocalDBException("No local version of prayer timing");
  }
}
