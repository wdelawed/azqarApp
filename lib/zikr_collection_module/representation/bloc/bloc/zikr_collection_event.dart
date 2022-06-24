part of 'zikr_collection_bloc.dart';

abstract class ZikrCollectionEvent extends Equatable {
  const ZikrCollectionEvent();

  @override
  List<Object> get props => [];
}

class ZikrCollectionGetEvent extends ZikrCollectionEvent {}

class ZikrCollectionPlayEvent extends ZikrCollectionEvent {
  final int audioId;
  const ZikrCollectionPlayEvent(this.audioId);
}

class ZikrCollectionPauseEvent extends ZikrCollectionEvent {
  final int audioId;
  const ZikrCollectionPauseEvent(this.audioId);
}
