import 'package:chongwu/values/MyColors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyBarCharts extends StatefulWidget {

  WeeklyBarCharts(
      this.dayTime,
    {
      Key key,
      this.barBackgroundColor = Colors.white,
      this.barWidth = 10,
      this.barColor = MyColors.orange,
      this.width = 100,
      this.height = 100,
      this.titleColor = MyColors.orange,
      this.tooltipBgColor = MyColors.grey,
      this.maxNumber = 6,
      this.tooltipColor = Colors.white,
      this.touchedColor = MyColors.deepOrange,
    }
  ):super(key: key);

  Color barBackgroundColor;
  Color barColor;
  Color touchedColor;
  Color titleColor;
  Color tooltipBgColor;
  Color tooltipColor;
  double height;
  double width;
  double barWidth;
  double maxNumber;
  List<double> dayTime;

  @override
  State<StatefulWidget> createState() => WeeklyBarChartsState();
}

class WeeklyBarChartsState extends State<WeeklyBarCharts> {

  Color barBackgroundColor;
  Color barColor;
  Color touchedColor ;
  Color titleColor ;
  Color tooltipBgColor;
  Color tooltipColor;
  double height;
  double width;
  double barWidth;
  double maxNumber;
  List<double> dayTime;
  Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex;

  @override
  void initState() {
    // TODO: implement initState
    this.barBackgroundColor = widget.barBackgroundColor;
    this.barColor = widget.barColor;
    this.touchedColor = widget.touchedColor;
    this.titleColor = widget.titleColor;
    this.tooltipBgColor = widget.tooltipBgColor;
    this.tooltipColor = widget.tooltipColor;
    this.height = widget.height;
    this.width = widget.width;
    this.barWidth = widget.barWidth;
    this.maxNumber = widget.maxNumber;
    this.dayTime = widget.dayTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child:  BarChart(
        mainBarData(),
        swapAnimationDuration: animDuration,
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y,
      Color barColor,
      double barWidth,
      {
        bool isTouched = false,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 0.5 : y,
          colors: isTouched ? [touchedColor] : [barColor],
          width: barWidth,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: maxNumber,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, dayTime[i], barColor,barWidth,isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, dayTime[i], barColor,barWidth,isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, dayTime[i], barColor,barWidth,isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, dayTime[i], barColor,barWidth, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, dayTime[i], barColor,barWidth, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, dayTime[i], barColor,barWidth, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, dayTime[i], barColor,barWidth, isTouched: i == touchedIndex);
      default:
        return null;
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        //点击悬浮窗
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: tooltipBgColor,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 0.5).toString(), TextStyle(color: tooltipColor));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      //列名
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) =>
          TextStyle(color: titleColor, fontWeight: FontWeight.bold, fontSize: 14),
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      //边框
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

}