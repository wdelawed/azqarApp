part of 'azkar_audio_player_bloc.dart';

abstract class AzkarAudioPlayerState extends Equatable {
  const AzkarAudioPlayerState();

  @override
  List<Object> get props => [];
}

class AzkarAudioPlayerInitial extends AzkarAudioPlayerState {}

class AzkarAudioPlayerLoadingState extends AzkarAudioPlayerState {
  final int tackId;
  const AzkarAudioPlayerLoadingState({required this.tackId});
}

class AzkarAudioPlayerPlayingState extends AzkarAudioPlayerState {
  final int tackId;
  const AzkarAudioPlayerPlayingState({required this.tackId});
}

class AzkarAudioPlayerPausedState extends AzkarAudioPlayerState {}
