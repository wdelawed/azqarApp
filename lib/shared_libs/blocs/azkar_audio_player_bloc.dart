import 'package:azkar/azkar_cache_manager.dart';
import 'package:azkar/notifications_settings_module/data/models/not_setting_item.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

part 'azkar_audio_player_event.dart';
part 'azkar_audio_player_state.dart';

class AzkarAudioPlayerBloc
    extends Bloc<AzkarAudioPlayerEvent, AzkarAudioPlayerState> {
  int trackId = -1;
  final AudioPlayer _audioPlayer = AudioPlayer();
  AzkarAudioPlayerBloc() : super(AzkarAudioPlayerInitial()) {
    on<AzkarAudioPlayerPlayEvent>((event, emit) async {
      emit(AzkarAudioPlayerLoadingState(tackId: event.track.zikrAudioId));

      if (!_audioPlayer.playing && event.track.zikrAudioId == trackId) {
        //we need to resume this track
        emit(AzkarAudioPlayerPlayingState(tackId: trackId));
        await _audioPlayer.play();
        //wait for play to finish then stop playing
        await _audioPlayer.stop();
        trackId = -1;
        emit(AzkarAudioPlayerPausedState());
      } else {
        if (_audioPlayer.playing && event.track.zikrAudioId != trackId) {
          //playing another track need to stop it

          await _audioPlayer.stop();
        }
        //play a new track
        try {
          //first try to get the audio file from the cache
          // if this failed then play it from the internet
          final fileInfo = await AzkraCacheManager.instance
              .getFileFromCache("ZikrFile${event.track.zikrAudioId}");

          await _audioPlayer.setAudioSource(AudioSource.uri(
            fileInfo?.file.absolute.uri != null
                ? Uri.file(fileInfo?.file.absolute.path ?? "")
                : Uri.parse(event.track.soundTrackUrl),
            tag: MediaItem(
              id: event.track.zikrAudioId.toString(),
              album: "الأذكار",
              title: event.track.zikrName,
            ),
          ));

          trackId = event.track.zikrAudioId;
          emit(AzkarAudioPlayerPlayingState(tackId: trackId));
          await _audioPlayer.play();
          await _audioPlayer.stop();
          trackId = -1; //stop playing any audio
          emit(AzkarAudioPlayerPausedState());
        } catch (e) {
          if (kDebugMode) {
            print("Audio play Error ${e.toString()}");
          }
        }
      }
    });

    on<AzkarAudioPlayerPauseEvent>((event, emit) async {
      emit(AzkarAudioPlayerLoadingState(tackId: event.track.zikrAudioId));
      if (event.track.zikrAudioId == trackId) {
        await _audioPlayer.pause();
        trackId = -1;
        emit(AzkarAudioPlayerPausedState());
      }
    });
  }
}
