import 'package:azkar/config/global_dart.dart';
import 'package:azkar/main_module/data/data_sources/local_datasource.dart';
import 'package:azkar/main_module/data/data_sources/remote_datasource.dart';
import 'package:azkar/main_module/data/repositories/prayer_timing_repository.dart';
import 'package:azkar/main_module/domain/entities/prayer_timing_entity/prayer_timing_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('Prayer Timing Repository ', () {
    test('Should return Prayer timings of the current day', () async {
      //prepare
      final client = http.Client();
      final reomteDataSource = RemoteDataSource(client: client);
      final localDataSource = LocalDataSource();
      final repo = PrayerTimingsRepository(
          remoteDataSource: reomteDataSource, localDataSource: localDataSource);
      final currentDate = DateTime.now();
      final day = currentDate.day.toString();
      final year = currentDate.year.toString();

      String? month = months[currentDate.month];

      const lat = "15.5007";
      const lng = "32.5599";

      // test
      final result = await repo.getTodaysPrayerTiming(lat, lng);

      //assert
      expect(true, equals(result.isRight));
      expect(result.right, isA<PrayerTimingEntity>());
      expect(day, equals(result.right.gregorian?.day));
      expect(month, equals(result.right.gregorian?.month));
      expect(year, equals(result.right.gregorian?.year));
    });
  });
}
