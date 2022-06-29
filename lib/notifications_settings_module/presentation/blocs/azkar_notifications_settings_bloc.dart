import 'package:azkar/notifications_settings_module/data/models/not_setting_item.dart';
import 'package:azkar/notifications_settings_module/domain/usecases/disable_zikr_notification_setting_usecase.dart';
import 'package:azkar/notifications_settings_module/domain/usecases/enable_zikr_notification_setting_usecase.dart';
import 'package:azkar/notifications_settings_module/domain/usecases/fetch_notifications_settings_module_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workmanager/workmanager.dart';

part 'azkar_notifications_settings_event.dart';
part 'azkar_notifications_settings_state.dart';

class AzkarNotificationsSettingsBloc extends Bloc<
    AzkarNotificationsSettingsEvent, AzkarNotificationsSettingsState> {
  DisableZikrNotificationUseCase disableZikrNotification;
  EnableZikrNotificationUseCase enableZikrNotification;
  FetchNotificationsSettingsUseCase fetchNotificationsSettings;

  List<NotSettingItem> azkarListSettings = [];
  AzkarNotificationsSettingsBloc(
      {required this.fetchNotificationsSettings,
      required this.enableZikrNotification,
      required this.disableZikrNotification})
      : super(AzkarNotificationsSettingsInitial()) {
    on<AzkarNotificationsSettingsFetchEvent>((event, emit) async {
      emit(AzkarNotificationsSettingsLoadingState());
      final res = await fetchNotificationsSettings.execute();

      res.fold(
          (failure) => emit(
              AzkarNotificationsSettingsErrortate(message: failure.message)),
          (azkarList) {
        azkarListSettings = azkarList;
        emit(AzkarNotificationsSettingsLoadedState(settings: azkarList));
      });
    });

    on<AzkarNotificationsSettingsEnableEvent>((event, emit) async {
      emit(AzkarNotificationsSettingsEnablingState());
      final res = await enableZikrNotification.execute(event.zikrId,
          event.duration, event.periodArabic, event.periodEnglish);

      res.fold((failure) {
        emit(AzkarNotificationsSettingsErrortate(message: failure.message));
      }, (success) {
        int zikrIndex = 0;
        for (int i = 0; i < azkarListSettings.length; i++) {
          if (azkarListSettings[i].zikrAudioId == event.zikrId) {
            zikrIndex = i;
            azkarListSettings[i] = azkarListSettings[i].copyWith(
                notificationIntervalMinutes: event.duration.inMinutes,
                notificationPeriodArabic: event.periodArabic,
                notificationPeriodEnglish: event.periodEnglish,
                notificationEnabled: true);
          }
        }
        emit(
            AzkarNotificationsSettingsLoadedState(settings: azkarListSettings));
        Workmanager().registerPeriodicTask(
          "ZIKRTASK${event.zikrId}",
          "ZIKRTASK${event.zikrId}",
          initialDelay: Duration(
            minutes:
                azkarListSettings[zikrIndex].notificationIntervalMinutes ?? 15,
          ),
          frequency: Duration(
            minutes:
                azkarListSettings[zikrIndex].notificationIntervalMinutes ?? 15,
          ),
          inputData: azkarListSettings[zikrIndex].toMap(),
          constraints: Constraints(
            networkType: NetworkType.not_required,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresDeviceIdle: false,
            requiresStorageNotLow: false,
          ),
        );
      });
    });

    on<AzkarNotificationsSettingsDisableEvent>((event, emit) async {
      emit(AzkarNotificationsSettingsEnablingState());
      final res = await disableZikrNotification.execute(event.zikrId);

      res.fold(
          (failure) => emit(
              AzkarNotificationsSettingsErrortate(message: failure.message)),
          (success) {
        for (int i = 0; i < azkarListSettings.length; i++) {
          if (azkarListSettings[i].zikrAudioId == event.zikrId) {
            azkarListSettings[i] = azkarListSettings[i].copyWith(
                notificationIntervalMinutes: null, notificationEnabled: false);
          }
        }
        emit(
            AzkarNotificationsSettingsLoadedState(settings: azkarListSettings));
        Workmanager().cancelByUniqueName("ZIKRTASK${event.zikrId}");
      });
    });
  }
}
