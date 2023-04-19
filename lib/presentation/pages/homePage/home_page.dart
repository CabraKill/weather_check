import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_check/domain/entities/homePageStates/home_page_state.dart';
import 'package:weather_check/domain/entities/homePageStates/loaded_home_page_state.dart';
import 'package:weather_check/domain/entities/homePageStates/loading_home_page_state.dart';
import 'package:weather_check/infra/injections/injectable.dart';
import 'package:weather_check/presentation/pages/homePage/home_page_controller.dart';
import 'package:weather_check/presentation/widgets/graph_area.dart';

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
                        GestureDetector(
                          onTap: _pageController.toggleVisibility,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  'Latitude: ${pageState.locationVisible ? pageState.weather.location.latitude : "-"} | Longitude: ${pageState.locationVisible ? pageState.weather.location.longitude : "-"}'),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                pageState.locationVisible
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash_fill,
                              )
                            ],
                          ),
                        ),
                      if (pageState is LoadedHomePageState)
                        Builder(builder: (context) {
                          final airQuality = pageState.weather.airQuality;

                          return Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 500,
                              ),
                              child: GraphArea(
                                gasAreaItemEntityList: _pageController
                                    .getGasAreaItemList(airQuality),
                              ),
                            ),
                          );
                        }),
                      if (pageState is LoadingHomePageState)
                        Expanded(
                          child: Center(
                            child: const CupertinoActivityIndicator(),
                          ),
                        ),
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
