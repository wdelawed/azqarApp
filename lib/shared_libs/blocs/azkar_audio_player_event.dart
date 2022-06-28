part of 'azkar_audio_player_bloc.dart';

abstract class AzkarAudioPlayerEvent extends Equatable {
  const AzkarAudioPlayerEvent();

  @override
  List<Object> get props => [];
}

class AzkarAudioPlayerPlayEvent extends AzkarAudioPlayerEvent {
  final NotSettingItem track;
  const AzkarAudioPlayerPlayEvent({required this.track});
}

class AzkarAudioPlayerPauseEvent extends AzkarAudioPlayerEvent {
  final NotSettingItem track;
  const AzkarAudioPlayerPauseEvent({required this.track});
}
