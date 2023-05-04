import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'bar_data.dart';



class PortionBarGraph extends StatelessWidget {
  final List portionSum;
  const PortionBarGraph({super.key,
    required this.portionSum,
  });






  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    BarData myBarData = BarData(
      portionOne: portionSum[0],
      portionTwo: portionSum[1],
      portionThree: portionSum[2],
    );
    myBarData.initializeBarData();
   return BarChart(
     BarChartData(//
       maxY: 100,
       minY: 0,
       gridData: FlGridData(show: false),
       borderData: FlBorderData(show: false),
       titlesData: FlTitlesData(
         show: true,
         topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
         leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
         rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
         bottomTitles: AxisTitles(
           sideTitles: SideTitles(
             showTitles: true,
             getTitlesWidget: (value, meta) => getBottomTittles(value, meta, myBarData),
           ),
         ),


       ),
       barGroups: myBarData.barData
         .map((data) => BarChartGroupData(
           x: data.x,
           barRods: [
             BarChartRodData(toY: data.y,
             color: Colors.deepPurple,
             width: 30,
             borderRadius: BorderRadius.circular(4),
             backDrawRodData: BackgroundBarChartRodData(
               show: true,
               toY: 100,
               color: Colors.grey[200],
             )),

           ],
       ),
    ).toList(),
     ),
   );
  }
}

Widget getBottomTittles(double value, TitleMeta meta, BarData myBarData) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  late Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text(
        'Portion One: ${myBarData.portionOne.toStringAsFixed(2)}%',
        style: style,
      );
      break;
    case 1:
      text = Text(
        'Portion Two: ${myBarData.portionTwo.toStringAsFixed(2)}%',
        style: style,
      );
      break;
    case 2:
      text = Text(
        'Portion Three: ${myBarData.portionThree.toStringAsFixed(2)}%',
        style: style,
      );
      break;
    default:
      text = Container();
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}


