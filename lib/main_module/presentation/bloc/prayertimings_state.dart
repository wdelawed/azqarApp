part of 'prayertimings_bloc.dart';

abstract class PrayertimingsState extends Equatable {
  const PrayertimingsState();

  @override
  List<Object> get props => [];
}

class PrayertimingsInitial extends PrayertimingsState {}

class PrayerTimingsLoading extends PrayertimingsState {}

class PrayerTimingsLoaded extends PrayertimingsState {
  final PrayerTimingEntity todaysTimings;
  const PrayerTimingsLoaded({required this.todaysTimings});
}

class PrayerTimingsError extends PrayertimingsState {
  final String msg;
  const PrayerTimingsError({required this.msg});
}
