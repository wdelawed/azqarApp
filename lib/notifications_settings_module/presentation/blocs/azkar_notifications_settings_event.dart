part of 'azkar_notifications_settings_bloc.dart';

abstract class AzkarNotificationsSettingsEvent extends Equatable {
  const AzkarNotificationsSettingsEvent();

  @override
  List<Object> get props => [];
}

class AzkarNotificationsSettingsFetchEvent
    extends AzkarNotificationsSettingsEvent {}

class AzkarNotificationsSettingsEnableEvent
    extends AzkarNotificationsSettingsEvent {
  final int zikrId;
  final Duration duration;
  final String periodArabic;
  final String periodEnglish;
  const AzkarNotificationsSettingsEnableEvent(
      {required this.zikrId,
      required this.duration,
      required this.periodArabic,
      required this.periodEnglish});
}

class AzkarNotificationsSettingsDisableEvent
    extends AzkarNotificationsSettingsEvent {
  final int zikrId;
  const AzkarNotificationsSettingsDisableEvent({required this.zikrId});
}
