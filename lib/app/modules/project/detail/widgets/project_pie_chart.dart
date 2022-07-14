import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProjectPieChart extends StatelessWidget {
  int projectEstimate;
  int totalTasks;
  ProjectPieChart({
    Key? key,
    required this.projectEstimate,
    required this.totalTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final residual = (projectEstimate - totalTasks);
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.loose,
        children: [
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: residual.toDouble(),
                  color: theme.primaryColor,
                  showTitle: true,
                  title: '${residual}h',
                  titleStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                PieChartSectionData(
                    value: totalTasks.toDouble(),
                    color: theme.primaryColorLight,
                    showTitle: true,
                    title: '${totalTasks} h',
                    titleStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                '${projectEstimate} h',
                style: TextStyle(
                  fontSize: 25,
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
