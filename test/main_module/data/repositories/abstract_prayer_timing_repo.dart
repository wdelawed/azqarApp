import 'package:azkar/main_module/data/failures.dart';
import 'package:azkar/main_module/data/models/prayer_timing/prayer_timing.dart';
import 'package:either_dart/either.dart';

abstract class AbstractPrayerTimingRepository {
  Future<Either<Failure, PrayerTiming>> getTodayPrayersTime();
}