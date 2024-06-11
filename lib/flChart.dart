import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class EKGChart extends StatelessWidget {
  final List<int> ekgData;

  EKGChart({required this.ekgData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.black, width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: _generateSpots(),
              isCurved: false,
              barWidth: 2,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
          minX: 0,
          maxX: ekgData.length.toDouble(),
          minY: -127,
          maxY: 127,
        ),
      ),
    );
  }

  List<FlSpot> _generateSpots() {
    List<FlSpot> spots = [];
    for (int i = 0; i < ekgData.length; i++) {
      spots.add(FlSpot(i.toDouble(), ekgData[i].toDouble()));
    }
    return spots;
  }
}
