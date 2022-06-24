import 'dart:convert';

import 'package:azkar/zikr_collection_module/data/models/zikr.dart';
import 'package:azkar/zikr_collection_module/data/datasources/abstract_datasource.dart';
import 'package:http/http.dart' as http;

import '../../../main_module/data/exceptions.dart';

class RemoteZikrDataSource extends AbstractZikrDataSource {
  http.Client client;
  RemoteZikrDataSource({required this.client});
  @override
  Future<List<Zikr>> getAzkarList() async {
    final res = await client.get(Uri.parse(
        "http://nebroprog10-001-site1.itempurl.com/AudioFiles/AudiosList"));

    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      return (json["audioFilesList"] as List)
          .map((e) => Zikr.fromMap(e))
          .toList();
    }
    throw ServerException("Invalid response");
  }
}
