import 'package:dashboard_ui_with_chart/config/style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CovidBarChart extends StatelessWidget {
  final List<double> covidCases;

  // final Color dark = const Color(0xff3b8c75);
  // final Color normal = const Color(0xff64caad);
  // final Color light = const Color(0xff73e8c9);

  final Color dark = Colors.red;
  final Color normal = Colors.red;
  final Color light = Colors.red;

  CovidBarChart({required this.covidCases});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              barTouchData: BarTouchData(
                enabled: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) =>
                      const TextStyle(color: Color(0xff939393), fontSize: 10),
                  margin: 20,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'May 24';
                      case 1:
                        return 'May 25';
                      case 2:
                        return 'May 26';
                      case 3:
                        return 'May 27';
                      case 4:
                        return 'May 28';
                      case 5:
                        return 'May 29';
                      case 6:
                        return 'May 30';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                        color: Color(
                          0xff939393,
                        ),
                        fontSize: 10),
                    margin: 10,
                    getTitles: (value) {
                      if (value == 0) {
                        return '0';
                      } else if (value % 3 == 0) {
                        return '${value ~/ 3 * 5}K';
                      }
                      return '';
                    }),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 3 == 0,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.black12,
                  strokeWidth: 1.0,
                  dashArray: [5],
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 35,
              barGroups: covidCases
                  .asMap()
                  .map((key, value) => MapEntry(
                      key,
                      BarChartGroupData(
                        x: key,
                        barRods: [
                          BarChartRodData(
                            y: value,
                            rodStackItems: [
                              BarChartRodStackItem(0, 2000000000, dark),
                              BarChartRodStackItem(
                                  2000000000, 12000000000, normal),
                              BarChartRodStackItem(
                                  12000000000, 17000000000, light),
                            ],
                          ),
                        ],
                      )))
                  .values
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
