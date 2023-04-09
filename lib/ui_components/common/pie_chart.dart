import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BuildChart extends StatefulWidget {
  const BuildChart({super.key});

  @override
  State<BuildChart> createState() => _BuildChartState();
}

class _BuildChartState extends State<BuildChart> {
  late List<UserData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCircularChart(
        tooltipBehavior: _tooltipBehavior,
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        series: <CircularSeries>[
          RadialBarSeries<UserData, String>(
              enableTooltip: true,
              maximumValue: 100,
              dataSource: _chartData,
              xValueMapper: (UserData data, _) => data.continent,
              yValueMapper: (UserData data, _) => data.aloo,
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ],
      ),
    );
  }
}

List<UserData> getChartData() {
  final List<UserData> chartData = [
    UserData('Flutter', 60),
    UserData('Dart', 90),
    UserData('JavaScript', 34),
    UserData('CodePen', 52)
  ];
  return chartData;
}

class UserData {
  final String continent;
  final double aloo;

  UserData(this.continent, this.aloo);
}
