import 'package:azkar/main_module/data/failures.dart';
import 'package:azkar/zikr_collection_module/domain/entities/zikr_entity.dart';
import 'package:either_dart/either.dart';

abstract class AbstractZikrRepository {
  Future<Either<Failure, List<ZikrEntity>>> getZikrList();
}
