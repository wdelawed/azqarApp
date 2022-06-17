import 'package:azkar/main_module/data/failures.dart';
import 'package:azkar/main_module/data/models/prayer_timing/prayer_timing.dart';
import 'package:azkar/main_module/data/repositories/prayer_timing_repository.dart';
import 'package:azkar/main_module/domain/entities/prayer_timing_entity/prayer_timing_entity.dart';
import 'package:azkar/main_module/domain/repositories/abstract_prayer_timing_repository.dart';
import 'package:either_dart/either.dart';

class GetPrayerTimings {
  final PrayerTimingsRepository repo;
  GetPrayerTimings({required this.repo});

  Future<Either<Failure, PrayerTimingEntity>> execute(
      String lat, String lng) async {
    return repo.getTodaysPrayerTiming(lat, lng);
  }
}
