import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 200,
            child: PieChart(PieChartData(sections: [
              PieChartSectionData(
                  value: 20,
                  title: "sells",
                  showTitle: true,
                  radius: 70,
                  color: Colors.purple),
              PieChartSectionData(
                  value: 20,
                  title: "sells",
                  showTitle: true,
                  radius: 70,
                  color: Colors.blue),
              PieChartSectionData(
                  value: 70,
                  title: "revenue",
                  showTitle: true,
                  radius: 70,
                  color: Colors.green),
            ])),
          ),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                  // read about it in the BarChartData section
                  ),
              duration: const Duration(milliseconds: 150), // Optional
              curve: Curves.linear, // Optional
            ),
          )
        ],
      ),
    );
  }
}
