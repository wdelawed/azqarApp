import 'package:azkar/main_module/data/data_sources/local_datasource.dart';
import 'package:azkar/main_module/data/data_sources/remote_datasource.dart';
import 'package:azkar/main_module/data/failures.dart';
import 'package:azkar/main_module/data/repositories/prayer_timing_repository.dart';
import 'package:azkar/main_module/domain/entities/prayer_timing_entity/prayer_timing_entity.dart';
import 'package:azkar/main_module/domain/usecases/get_prayer_timings.dart';
import 'package:azkar/main_module/presentation/bloc/prayertimings_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'prayer_timing_bloc_test.mocks.dart';

@GenerateMocks([GetPrayerTimings])
void main() {
  group("Prayer Timing Bloc Integration Tests ", () {
    http.Client client = http.Client();
    final localDataSource = LocalDataSource();
    final RemoteDataSource remoteDataSource = RemoteDataSource(client: client);

    final repo = PrayerTimingsRepository(
        remoteDataSource: remoteDataSource, localDataSource: localDataSource);

    final getPrayerTimings = GetPrayerTimings(repo: repo);

    const lat = "1";
    const lng = "2";

    blocTest("Should not emit any thing by default",
        build: () => PrayertimingsBloc(getPrayerTimings: getPrayerTimings),
        expect: () => []);

    blocTest('Should emit loading then success upon init event',
        build: () => PrayertimingsBloc(getPrayerTimings: getPrayerTimings),
        act: (PrayertimingsBloc bloc) {
          bloc.add(const PrayerTimingInitEvent(lat: lat, lng: lng));
        },
        wait: const Duration(milliseconds: 1000),
        expect: () => [
              PrayerTimingsLoading(),
              const PrayerTimingsLoaded(todaysTimings: PrayerTimingEntity())
            ]);
  });

  group("Prayer Timing Bloc Unit Tests", () {
    final mockGetPrayerTimings = MockGetPrayerTimings();
    const lat = "1";
    const lng = "2";
    when(
      mockGetPrayerTimings.execute(lat, lng),
    ).thenAnswer(
      (realInvocation) => Future.delayed(const Duration(milliseconds: 400), () {
        return const Right(
          PrayerTimingEntity(),
        );
      }),
    );

    when(
      mockGetPrayerTimings.execute(lng, lat),
    ).thenAnswer(
      (realInvocation) => Future.delayed(const Duration(milliseconds: 400), () {
        return const Left(
          Failure(message: "Can't get the data"),
        );
      }),
    );

    blocTest(
      ' Should not emit anything by default ',
      build: () => PrayertimingsBloc(getPrayerTimings: mockGetPrayerTimings),
      expect: () => [],
    );

    blocTest('Should emit loading then success upon init event',
        build: () => PrayertimingsBloc(getPrayerTimings: mockGetPrayerTimings),
        act: (PrayertimingsBloc bloc) {
          bloc.add(const PrayerTimingInitEvent(lat: lat, lng: lng));
        },
        wait: const Duration(milliseconds: 1000),
        expect: () => [
              PrayerTimingsLoading(),
              const PrayerTimingsLoaded(todaysTimings: PrayerTimingEntity())
            ]);
    blocTest('Should emit loading then error state upon init event',
        build: () => PrayertimingsBloc(getPrayerTimings: mockGetPrayerTimings),
        act: (PrayertimingsBloc bloc) =>
            bloc.add(const PrayerTimingInitEvent(lat: lng, lng: lat)),
        wait: const Duration(milliseconds: 1000),
        expect: () => [
              PrayerTimingsLoading(),
              const PrayerTimingsError(msg: "Can't get the data")
            ]);
  });
}
