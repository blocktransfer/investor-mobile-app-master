import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../util/appcolors.dart';
import '../../util/stockdata.dart';

class TradeView extends StatefulWidget {
  const TradeView({Key? key}) : super(key: key);

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  child:
                  Image.asset('asset/images/bc_small2.png', width: width)),
            ),
            SingleChildScrollView(
              child: Column(children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 50),
                  child: Center(
                  ),
                ),
                Card(
                  child: SizedBox(
                    width: width - 30,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Aqua',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\$1,281,450.34',
                            style: TextStyle(
                                color: AppColors.purpleTheme, fontSize: 25),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '+ \$12,455 (0.97%)',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        SfCartesianChart(
                            primaryXAxis: DateTimeAxis(
                              //Hide the gridlines of x-axis
                              majorGridLines: MajorGridLines(width: 0),
                              //Hide the axis line of x-axis
                              axisLine: AxisLine(width: 0),
                            ),

                            primaryYAxis: NumericAxis(
                              //Hide the gridlines of y-axis
                                majorGridLines: MajorGridLines(width: 0),
                                //Hide the axis line of y-axis
                                axisLine: AxisLine(width: 0)
                            ),

                            series: <ChartSeries>[
                              LineSeries<StockData, DateTime>(
                                  dataSource: [],
                                  //   StockData(1669828500000, 0.0007838, AppColors.purpleTheme),
                                  //   StockData(1669828680000, 0.0007837, AppColors.purpleTheme),
                                  //   StockData(1669828740000, 0.0007837, AppColors.purpleTheme),
                                  //   StockData(1669828920000, 0.0007835, AppColors.purpleTheme),
                                  //   StockData(1669828980000, 0.0007821, AppColors.purpleTheme),
                                  //   StockData(1669829040000, 0.0007774, AppColors.purpleTheme),
                                  //   StockData(1669829100000, 0.0007771, AppColors.purpleTheme),
                                  //   StockData(1669829160000, 0.0007761, AppColors.purpleTheme),
                                  //   StockData(1669829340000, 0.0007806, AppColors.purpleTheme),
                                  //   StockData(1669830180000, 0.0007759, AppColors.purpleTheme),
                                  // ],
                                  // Bind the color for all the data points from the data source
                                  xValueMapper: (StockData data, _) => data.minute,
                                  yValueMapper: (StockData data, _) => data.sales
                              )
                            ]
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ));
  }

}
