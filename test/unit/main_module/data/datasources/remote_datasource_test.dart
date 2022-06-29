import 'package:azkar/main_module/data/exceptions.dart';
import 'package:azkar/main_module/data/data_sources/remote_datasource.dart';
import 'package:azkar/main_module/data/models/prayer_timing/prayer_timing.dart';
import 'package:azkar/main_module/domain/entities/prayer_timing_entity/prayer_timing_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group("testing remote data source", () {
    test('should return a vaild prayer time data', () async {
      //prepare
      final client = http.Client();
      final remoteDataSource = RemoteDataSource(client: client);

      //test
      bool success = false;
      try {
        final res = await remoteDataSource.getPrayerMonthCalendar(
            "51.508515", "-0.1254872", "6", "2022");
        success = res is List<PrayerTiming> &&
            res.isNotEmpty &&
            res[0].timings != null &&
            res[0].date != null;
      } on ServerException {
        success = false;
      }

      // assert
      expect(success, equals(true));
    });

    test('should be converted to an PrayerTimingEntity successfully', () async {
      //prepare
      final client = http.Client();
      final remoteDataSource = RemoteDataSource(client: client);

      //test
      bool success = false;
      try {
        final res = await remoteDataSource.getPrayerMonthCalendar(
            "51.508515", "-0.1254872", "6", "2022");
        final entity = res[0].toEntity();

        success = entity != null && entity is PrayerTimingEntity;
      } on ServerException {
        success = false;
      }

      // assert
      expect(success, equals(true));
    });
  });
}
