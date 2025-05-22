import 'package:app_the_weather/bloc/weather_bloc_bloc.dart';
import 'package:app_the_weather/view/widget/Customweathertitle.dart';
import 'package:app_the_weather/view/widget/customweather_condition.dart';
import 'package:app_the_weather/view/widget/customweather_time.dart';
import 'package:app_the_weather/view/widget/customweatherdesingscreen.dart';
import 'package:app_the_weather/view/widget/customweathericon.dart';
import 'package:app_the_weather/view/widget/customweathertempminmax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                CustomWeatherDesingScreen(),
                BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                    if (state is WeatherBlocSuccess) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomWeatherTitle(
                              areaName: state.weather.areaName!,
                            ),
                            getWeatherIcon(state.weather.weatherConditionCode!),
                            CustomWeatherCondition(
                              temperature:
                                  state.weather.temperature!.celsius!.round(),
                              weatherMain:
                                  state.weather.weatherMain!.toUpperCase(),
                              date: state.weather.date!,
                            ),
                            CustomWeatherTime(
                              sunrise: state.weather.sunrise!,
                              sunset: state.weather.sunset!,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Divider(color: Colors.grey),
                            ),
                            CustomWeatherTempMinMax(
                              tempMax: state.weather.tempMax!.celsius!.round(),
                              tempMin: state.weather.tempMin!.celsius!.round(),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
