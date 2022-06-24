part of 'zikr_collection_bloc.dart';

abstract class ZikrCollectionState extends Equatable {
  const ZikrCollectionState();

  @override
  List<Object> get props => [];
}

class ZikrCollectionInitial extends ZikrCollectionState {}

class ZikrCollectionLoadingState extends ZikrCollectionState {}

class ZikrCollectionErrorState extends ZikrCollectionState {
  final String message;
  const ZikrCollectionErrorState(this.message);
}

class ZikrCollectionLoadedState extends ZikrCollectionState {
  final List<ZikrEntity> zikrCollection;
  const ZikrCollectionLoadedState(this.zikrCollection);
}
