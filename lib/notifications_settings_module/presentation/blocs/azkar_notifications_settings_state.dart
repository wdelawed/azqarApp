part of 'azkar_notifications_settings_bloc.dart';

abstract class AzkarNotificationsSettingsState extends Equatable {
  const AzkarNotificationsSettingsState();

  @override
  List<Object> get props => [];
}

class AzkarNotificationsSettingsInitial
    extends AzkarNotificationsSettingsState {}

class AzkarNotificationsSettingsLoadingState
    extends AzkarNotificationsSettingsState {}

class AzkarNotificationsSettingsEnablingState
    extends AzkarNotificationsSettingsState {}

class AzkarNotificationsSettingsDisablingState
    extends AzkarNotificationsSettingsState {}

class AzkarNotificationsSettingsLoadedState
    extends AzkarNotificationsSettingsState {
  final List<NotSettingItem> settings;
  const AzkarNotificationsSettingsLoadedState({required this.settings});
}

class AzkarNotificationsSettingsErrortate
    extends AzkarNotificationsSettingsState {
  final String message;
  const AzkarNotificationsSettingsErrortate({required this.message});
}
