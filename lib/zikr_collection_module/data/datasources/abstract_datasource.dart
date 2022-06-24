import 'package:azkar/zikr_collection_module/data/models/zikr.dart';

abstract class AbstractZikrDataSource {
  Future<List<Zikr>> getAzkarList();
}
