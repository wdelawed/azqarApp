import 'package:azkar/main_module/data/failures.dart';
import 'package:azkar/main_module/data/models/prayer_timing/prayer_timing.dart';
import 'package:either_dart/either.dart';

abstract class AbstractPrayerTimingsRepository {
  Future<Either<Failure, PrayerTiming>> getTodaysPrayerTiming(
      String lat, String lng);
}
