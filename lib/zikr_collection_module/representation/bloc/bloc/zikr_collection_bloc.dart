import 'package:azkar/zikr_collection_module/domain/entities/zikr_entity.dart';
import 'package:azkar/zikr_collection_module/domain/usecases/get_zikr_collection.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

part 'zikr_collection_event.dart';
part 'zikr_collection_state.dart';

class ZikrCollectionBloc
    extends Bloc<ZikrCollectionEvent, ZikrCollectionState> {
  GetZikrCollection getZikrCollection;
  AudioPlayer audioPlayer = AudioPlayer();
  int playingId = -1;
  ZikrCollectionBloc(this.getZikrCollection) : super(ZikrCollectionInitial()) {
    on<ZikrCollectionGetEvent>((event, emit) async {
      emit(ZikrCollectionLoadingState());
      final res = await getZikrCollection.execute();

      res.fold((left) => emit(ZikrCollectionErrorState(left.message)),
          (right) => emit(ZikrCollectionLoadedState(right, audioPlayer)));
    });
  }
}
