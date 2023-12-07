import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/Practice/Features/Weather/Application/weather_service.dart';
import 'package:riverpod_practice/Practice/Features/Weather/Domain/weather_model.dart';

class WeatherHome extends ConsumerWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherService = ref.read(weatherServiceProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () =>
            ref.refresh(weatherService.currentWeatherFutureProvider.future),
        child: ListView(
          children: [
            SizedBox(
                height: 30,
                width: double.infinity,
                child: TextField(
                  controller: ref.read(weatherService.queryTextProvider),
                  onSubmitted: (value) {
                    weatherService.refereshCurrentWeather();
                  },
                )),
            const SizedBox(
              height: 40,
            ),
            Consumer(builder: (context, ref, child) {
              final weatherService = ref.read(weatherServiceProvider);
              //currentWeather ko datatype always AsyncValue
              final currentWeather =
                  ref.watch(weatherService.currentWeatherFutureProvider);
              return currentWeather.when(
                  data: (currentModel) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Column(children: [
                                Text(
                                    "Locaiton Name: ${currentModel.location.name}"),
                                Text("TEMP: ${currentModel.current.tempC} °C")
                              ]),
                            )
                          ]),
                  error: (e, s) => Text("$e"),
                  loading: () => const Center(
                          child: CircularProgressIndicator(
                        color: Colors.grey,
                      )));
            }),
          ],
        ),
      ),
    );
  }
}
