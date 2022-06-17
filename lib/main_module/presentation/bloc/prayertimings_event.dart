part of 'prayertimings_bloc.dart';

abstract class PrayertimingsEvent extends Equatable {
  const PrayertimingsEvent();

  @override
  List<Object> get props => [];
}

class PrayerTimingInitEvent extends PrayertimingsEvent {
  final String lat;
  final String lng;

  const PrayerTimingInitEvent({required this.lat, required this.lng});
}
