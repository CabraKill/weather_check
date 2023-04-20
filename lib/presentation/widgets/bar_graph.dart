import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:weather_check/infra/constants/gas_statistics_constants.dart';
import 'package:weather_check/infra/constants/gas_type_enum.dart';

class BarGraph extends StatefulWidget {
  final double value;
  final GasType type;

  const BarGraph({
    required this.value,
    required this.type,
    super.key,
  });

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  static const _barAnimationDuration = Duration(milliseconds: 500);
  static const _curve = Curves.easeInOutCubic;
  static const double _sideWidth = 65;
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animate = true;
      });
    });
  }

  double _convertToAlignRange(double value) {
    const transformation = 2;

    return value * transformation - 1;
  }

  @override
  Widget build(BuildContext context) {
    final gasStatistics = GasStatisticsConstants.getItFromType(widget.type);
    final maxValue = [
      ...gasStatistics.gasStatisticsMap.values,
      widget.value,
    ].reduce(max);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            SizedBox(
              width: _sideWidth,
              child: Text(
                widget.value.toString(),
                textAlign: TextAlign.end,
              ),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: _barAnimationDuration,
                        curve: _curve,
                        width: _animate
                            ? constraints.maxWidth * widget.value / maxValue
                            : 0,
                        color: CupertinoColors.systemBlue,
                      ),
                      ...gasStatistics.gasStatisticsMap.entries.map(
                        (gas) {
                          return AnimatedAlign(
                            alignment: Alignment(
                                _animate
                                    ? _convertToAlignRange(gas.value / maxValue)
                                    : -1,
                                0),
                            duration: _barAnimationDuration,
                            curve: _curve,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(gas.value.toString()),
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                ),
                                Text(gas.key),
                              ],
                            ),
                          );
                        },
                      ).toList()
                    ],
                  ),
                );
              }),
            ),
            SizedBox(
              width: _sideWidth,
              child: Text(
                widget.type.name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
