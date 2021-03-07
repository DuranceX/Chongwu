import 'package:chongwu/values/MyColors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class CustomLineChart extends StatefulWidget{

  CustomLineChart({
    @required this.times,
    this.width = 200,
  });

  List<double> times;
  double width;

  CustomLineChartState createState() => CustomLineChartState();
}

class CustomLineChartState extends State<CustomLineChart>{

  List<double> times;
  double width;
  List<FlSpot> spots = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.times = widget.times;
    this.width = widget.width;

    for(int i=0;i<times.length;i++){
      this.spots.add(
          FlSpot((i+1).toDouble(),times[i])
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              SizedBox(width: 5,),
              Container(
                width: width,
                child: LineChart(
                  LineChartData(
                    borderData: FlBorderData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                        leftTitles: SideTitles(
                            showTitles: false
                        )
                    ),
                    maxX: DateTime.now().day.toDouble()+1,
                    minX: 1,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: <LineChartBarData>[
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        barWidth: 8,
                        isStrokeCapRound: true,
                        colors: [MyColors.deepOrange],
                        dotData: FlDotData(
                            show: false
                        ),
                      )
                    ]
                  ),
                ),
              ),
              SizedBox(width: 5,)
            ],
          ),
        )
    );
  }
}