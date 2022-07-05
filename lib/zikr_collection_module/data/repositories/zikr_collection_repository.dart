import 'package:azkar/main_module/data/exceptions.dart';
import 'package:azkar/zikr_collection_module/data/datasources/local_zikr_datasource.dart';
import 'package:azkar/zikr_collection_module/data/datasources/remote_zikr_datasource.dart';
import 'package:azkar/zikr_collection_module/domain/entities/zikr_entity.dart';
import 'package:azkar/main_module/data/failures.dart';
import 'package:azkar/zikr_collection_module/domain/repositories/abstract_zikr_repository.dart';
import 'package:either_dart/either.dart';

class ZikrCollectionRepository extends AbstractZikrRepository {
  RemoteZikrDataSource remoteZikrDataSource;
  LocalZikrDataSource localZikrDataSource;
  ZikrCollectionRepository(
      {required this.remoteZikrDataSource, required this.localZikrDataSource});
  @override
  Future<Either<Failure, List<ZikrEntity>>> getZikrList() async {
    try {
      final zikrList = await localZikrDataSource.getAzkarList();

      return Right(zikrList.map((e) => e.toEntity()).toList());
    } on LocalDBException {
      try {
        final zikrList = await remoteZikrDataSource.getAzkarList();
        return Right(zikrList.map((e) => e.toEntity()).toList());
      } catch (e) {
        return const Left(Failure(message: "Failed to get Zikr Data"));
      }
    }
  }
}
