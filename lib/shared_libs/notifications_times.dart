import 'package:azkar/shared_libs/zikr_notification_duration.dart';

const notificationTimes = [
  ZikrNotificationDuration(
      durationMinutes: 15,
      periodArabic: "15 دقيقة",
      periodEnglish: "15 Minutes"),
  ZikrNotificationDuration(
      durationMinutes: 30,
      periodArabic: "30 دقيقة",
      periodEnglish: "30 Minutes"),
  ZikrNotificationDuration(
      durationMinutes: 60, periodArabic: "ساعة", periodEnglish: "One Hour"),
  ZikrNotificationDuration(
      durationMinutes: 60 * 6,
      periodArabic: "6 ساعات",
      periodEnglish: "6 Hours"),
  ZikrNotificationDuration(
      durationMinutes: 12 * 60,
      periodArabic: "12 ساعة",
      periodEnglish: "12 Hours"),
  ZikrNotificationDuration(
      durationMinutes: 24 * 60, periodArabic: "يوم", periodEnglish: "Day"),
  ZikrNotificationDuration(
      durationMinutes: 7 * 24 * 60,
      periodArabic: "أسبوع",
      periodEnglish: "Week"),
  ZikrNotificationDuration(
      durationMinutes: 30 * 24 * 60,
      periodArabic: "شهر",
      periodEnglish: "Month"),
];
