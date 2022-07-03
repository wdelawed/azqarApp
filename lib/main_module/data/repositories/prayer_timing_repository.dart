import 'package:azkar/main_module/data/data_sources/local_datasource.dart';
import 'package:azkar/main_module/data/data_sources/remote_datasource.dart';
import 'package:azkar/main_module/data/exceptions.dart';
import 'package:azkar/main_module/data/models/prayer_timing/prayer_timing.dart';
import 'package:azkar/main_module/data/failures.dart';
import 'package:azkar/main_module/domain/entities/prayer_timing_entity/prayer_timing_entity.dart';
import 'package:azkar/main_module/domain/repositories/abstract_prayer_timing_repository.dart';
import 'package:either_dart/either.dart';

import 'package:flutter/foundation.dart';

class PrayerTimingsRepository implements AbstractPrayerTimingsRepository {
  RemoteDataSource? remoteDataSource;
  LocalDataSource? localDataSource;
  PrayerTimingsRepository({this.remoteDataSource, this.localDataSource});

  @override
  Future<Either<Failure, PrayerTimingEntity>> getTodaysPrayerTiming(
      String lat, String lng) async {
    final today = DateTime.now();
    final month = today.month.toString();
    final year = today.year.toString();
    final int day = today.day;

    //first try to get the data from the local datasource
    try {
      List<PrayerTiming>? timings =
          await localDataSource?.getPrayerMonthCalendar(lat, lng, month, year);
      if (timings != null && timings.isNotEmpty) {
        final todaysCalendar = timings.firstWhere((t) {
          return int.parse(t.date?.gregorian?.day ?? "-1") == day;
        });
        return Right(todaysCalendar.toEntity());
      }

      throw (LocalDBException(
          "No matching day in the local database for the supplied latitude and longitude"));
    } catch (e) {
      //log this error

      if (kDebugMode) {
        print("LocalDBError ${e.toString()}");
      }
      // try to use the remote client

      try {
        List<PrayerTiming>? timings = await remoteDataSource
            ?.getPrayerMonthCalendar(lat, lng, month, year);
        if (timings != null && timings.isNotEmpty) {
          final todaysCalendar = timings.firstWhere((t) {
            return int.parse(t.date?.gregorian?.day ?? "-1") == day;
          });
          return Right(todaysCalendar.toEntity());
        }

        throw (LocalDBException("No matching day in the remote repository"));
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    }
  }
}
