import 'package:azkar/main_module/data/failures.dart';
import 'package:azkar/main_module/domain/entities/prayer_timing_entity/prayer_timing_entity.dart';
import 'package:either_dart/either.dart';

abstract class AbstractPrayerTimingsRepository {
  Future<Either<Failure, PrayerTimingEntity>> getTodaysPrayerTiming(
      String lat, String lng);
}
