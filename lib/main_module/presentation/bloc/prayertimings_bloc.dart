import 'package:azkar/main_module/domain/entities/prayer_timing_entity/prayer_timing_entity.dart';
import 'package:azkar/main_module/domain/usecases/get_prayer_timings.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'prayertimings_event.dart';
part 'prayertimings_state.dart';

class PrayertimingsBloc extends Bloc<PrayertimingsEvent, PrayertimingsState> {
  GetPrayerTimings getPrayerTimings;
  PrayertimingsBloc({required this.getPrayerTimings})
      : super(PrayertimingsInitial()) {
    on<PrayerTimingInitEvent>((event, emit) async {
      emit(PrayerTimingsLoading());

      final _res = await getPrayerTimings.execute(event.lat, event.lng);
      _res.fold((failure) {
        emit(PrayerTimingsError(msg: failure.message));
      }, (data) {
        emit(PrayerTimingsLoaded(todaysTimings: data));
      });
    });
  }
}
