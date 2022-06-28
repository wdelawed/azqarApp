import 'dart:convert';

import 'package:azkar/azkar_cache_manager.dart';
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
      final azkarList =
          (json["audioFilesList"] as List).map((e) => Zikr.fromMap(e)).toList();
      for (var zikr in azkarList) {
        if (zikr.file != null && zikr.audioId != null) {
          AzkraCacheManager.instance
              .getFileFromCache("ZikrFile${zikr.audioId}")
              .then((fileinfo) => {
                    if (fileinfo == null)
                      {
                        AzkraCacheManager.instance.downloadFile(zikr.file ?? "",
                            key: "ZikrFile${zikr.audioId}", force: true)
                      }
                  });
        }
      }
      return azkarList;
    }
    throw ServerException("Invalid response");
  }
}
