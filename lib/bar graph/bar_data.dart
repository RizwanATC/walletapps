import 'package:flutter_project/bar%20graph/portion_bar.dart';

class BarData{
  final double portionOne;
  final double portionTwo;
  final double portionThree;

  BarData({
    required this.portionOne,
    required this.portionTwo,
    required this.portionThree,
  });
  String toFormattedString() {
    return 'Needs (${portionOne.toStringAsFixed(0)}%), Will (${portionTwo.toStringAsFixed(0)}%), Savings (${portionThree.toStringAsFixed(0)}%)';
  }
  List<PortionBar>barData = [];


  void initializeBarData(){
    barData = [
      PortionBar(x: 0, y: portionOne),
      PortionBar(x: 0, y: portionTwo),
      PortionBar(x: 0, y: portionThree),
    ];
  }

}