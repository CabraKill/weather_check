import 'package:flutter/cupertino.dart';
import 'package:weather_check/domain/entities/gas_area_item_entity.dart';
import 'package:weather_check/presentation/widgets/bar_graph.dart';

class GraphArea extends StatelessWidget {
  final List<GasAreaItemEntity> gasAreaItemEntityList;
  const GraphArea({
    required this.gasAreaItemEntityList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: gasAreaItemEntityList
          .map(
            (e) => BarGraph(
              type: e.type,
              value: e.value,
            ),
          )
          .toList(),
    );
  }
}
