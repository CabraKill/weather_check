import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_check/domain/entities/homePageStates/home_page_state.dart';
import 'package:weather_check/domain/entities/homePageStates/loaded_home_page_state.dart';
import 'package:weather_check/infra/injections/injectable.dart';
import 'package:weather_check/presentation/pages/homePage/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = getIt<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Weather Check'),
      ),
      child: Center(
        child: BlocBuilder<HomePageController, HomePageState>(
            bloc: _pageController,
            builder: (context, pageState) {
              final showExpanded = _pageController.showExpanded;
              final loaded = pageState is LoadedHomePageState;

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize:
                        showExpanded ? MainAxisSize.max : MainAxisSize.min,
                    mainAxisAlignment: loaded
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                    children: [
                      if (loaded)
                        Text(
                            'Latitude: ${pageState.weather.location.latitude} | Longitude: ${pageState.weather.location.longitude}'),
                      if (pageState is LoadedHomePageState)
                        Builder(builder: (context) {
                          final airQuality = pageState.weather.airQuality;

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("So: ${airQuality.so2}"),
                              Text("No: ${airQuality.no2}"),
                              Text("Pm10: ${airQuality.pm10}"),
                              Text("Pm25: ${airQuality.pm25}"),
                              Text("O3: ${airQuality.o3}"),
                              Text("Co: ${airQuality.co}"),
                              Text("Nh3: ${airQuality.nh3}"),
                            ],
                          );
                        }),
                      CupertinoButton.filled(
                        child: Text('Update Location'),
                        onPressed: _pageController.onPressed,
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
