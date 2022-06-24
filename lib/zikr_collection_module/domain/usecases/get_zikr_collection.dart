import 'package:azkar/main_module/data/failures.dart';
import 'package:azkar/zikr_collection_module/data/repositories/zikr_collection_repository.dart';
import 'package:azkar/zikr_collection_module/domain/entities/zikr_entity.dart';
import 'package:either_dart/either.dart';

class GetZikrCollection {
  ZikrCollectionRepository zikrCollectionRepository;
  GetZikrCollection({required this.zikrCollectionRepository});
  Future<Either<Failure, List<ZikrEntity>>> execute() {
    return zikrCollectionRepository.getZikrList();
  }
}
