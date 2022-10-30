import 'dart:ffi';
import 'dart:math';

import 'package:money_manager/Widget/custom_colors.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:flutter/material.dart';
class BarChart extends StatelessWidget {
  const BarChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.5,
      width: 395.5,
      padding: const EdgeInsets.all(24.0),
      child:Chart(
        layers: [
          ChartAxisLayer(
            settings: ChartAxisSettings(
              x: ChartAxisSettingsAxis(
                frequency: 1.0,
                max: double.parse('12.45'),
                min: double.parse('1.45'),
                textStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 0.0,
                ),
              ),
              y: ChartAxisSettingsAxis(
                frequency: 100.0,
                max: 300.0,
                min: 0.0,
                textStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 0,
                ),
              ),
            ),
            labelX: (value) => value.toInt().toString(),
            labelY: (value) => value.toInt().toString(),
          ),
          ChartBarLayer(
            items: List.generate(
              13 - 7 + 1,
                  (index) => ChartBarDataItem(
                color: CustomColors.colorYellow,
                value: Random().nextInt(280) + 20,
                x: index.toDouble() + 7,
              ),
            ),
            settings: const ChartBarSettings(
              thickness: 8.0,
              radius: BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
        ],
      ),
    );
  }
}