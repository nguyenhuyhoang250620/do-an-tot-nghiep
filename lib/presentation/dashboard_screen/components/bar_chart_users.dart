import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class BarChartUsers extends StatelessWidget {
  const BarChartUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        borderData: FlBorderData(border: Border.all(width: 0)),
        groupsSpace: 15,
        titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
                showTitles: true,
                margin: appPadding,
                getTitles: (double value) {
                  if (value == 1) {
                    return 'T1';
                  }
                  if (value == 2) {
                    return 'T2';
                  }
                  if (value == 3) {
                    return 'T3';
                  }
                  if (value == 4) {
                    return 'T4';
                  }
                  if (value == 5) {
                    return 'T5';
                  }
                  if (value == 6) {
                    return 'T6';
                  }
                  if (value == 7) {
                    return 'T7';
                  }
                  if (value == 8) {
                    return 'T8';
                  }
                  if (value == 9) {
                    return 'T9';
                  }
                  if (value == 10) {
                    return 'T10';
                  }
                  if (value == 11) {
                    return 'T11';
                  }
                  if (value == 12) {
                    return 'T12';
                  }else {
                    return '';
                  }
                }),
          leftTitles: SideTitles(
              showTitles: true,
              margin: appPadding,
              getTitles: (double value) {
                if (value == 1) {
                  return '1';
                }if (value == 2) {
                  return '2';
                }if (value == 3) {
                  return '3';
                }if (value == 4) {
                  return '4';
                }if (value == 5) {
                  return '5';
                }if (value == 6) {
                  return '6';
                }if (value == 7) {
                  return '7';
                }if (value == 8) {
                  return '8';
                }if (value == 9) {
                  return '9';
                }if (value == 10) {
                  return '10';
                }else {
                  return '';
                }
              })
        ),
        barGroups: [
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
              y: 10,
              width: 20,
              colors: [primaryColor],
              borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
                y: 3,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
                y: 12,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
                y: 8,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
                y: 6,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(
                y: 10,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 7, barRods: [
            BarChartRodData(
                y: 16,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 8, barRods: [
            BarChartRodData(
                y: 6,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 9, barRods: [
            BarChartRodData(
                y: 4,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 10, barRods: [
            BarChartRodData(
                y: 9,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 11, barRods: [
            BarChartRodData(
                y: 12,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 12, barRods: [
            BarChartRodData(
                y: 2,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
        ]));
  }
}
