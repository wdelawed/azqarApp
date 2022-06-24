import 'package:azkar/main_module/data/exceptions.dart';
import 'package:azkar/zikr_collection_module/data/datasources/abstract_datasource.dart';
import 'package:azkar/zikr_collection_module/data/models/zikr.dart';

class LocalZikrDataSource extends AbstractZikrDataSource {
  @override
  @override
  Future<List<Zikr>> getAzkarList() {
    throw LocalDBException("no local version of Zikr list");
  }
}
