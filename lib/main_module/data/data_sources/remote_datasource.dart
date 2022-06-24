import 'dart:convert';

import 'package:azkar/main_module/data/data_sources/abstract_data_source.dart';
import 'package:azkar/main_module/data/data_sources/config.dart';
import 'package:azkar/main_module/data/exceptions.dart';
import 'package:azkar/main_module/data/models/prayer_timing/prayer_timing.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource implements AbstractDataSource {
  http.Client client;

  RemoteDataSource({required this.client});
  @override
  Future<List<PrayerTiming>> getPrayerMonthCalendar(
      String lat, String long, String month, String year,
      {String calculationMethod = "2"}) async {
    final res = await client.get(Uri.parse(
        "$baseUrl?latitude=$lat&longitude=$long&method=$calculationMethod&month=$month&year=$year"));
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      if (json["code"] == 200 && json["status"] == "OK") {
        return (json["data"] as List)
            .map((e) => PrayerTiming.fromMap(e))
            .toList();
      }
      throw ServerException("Invalid Data Received from ther server");
    }
    throw ServerException("Could not Fetch data from the server");
  }
}
