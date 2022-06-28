import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AzkraCacheManager {
  static const String key = "azkarCacheManager";
  static CacheManager instance = CacheManager(Config(
    key,
    stalePeriod: const Duration(days: 90),
    maxNrOfCacheObjects: 100,
    repo: JsonCacheInfoRepository(databaseName: key),
  ));
}
