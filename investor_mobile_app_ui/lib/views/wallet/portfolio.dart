import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../util/appcolors.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
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
                    child: Text(
                      'Portfolio',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                ),
                Card(
                  child: SizedBox(
                    width: width - 30,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Welcome back,',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Text(
                          'Mr./Ms. {LastName}',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ],
                    ),
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
                            'Balance',
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
                            primaryXAxis: NumericAxis(
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
                              LineSeries<StockData, double>(
                                  dataSource: [
                                    StockData(12, 35, AppColors.purpleTheme),
                                    StockData(13, 28, AppColors.purpleTheme),
                                    StockData(14, 34, AppColors.purpleTheme),
                                    StockData(15, 32, AppColors.purpleTheme),
                                    StockData(16, 40, AppColors.purpleTheme)
                                  ],
                                  // Bind the color for all the data points from the data source
                                  pointColorMapper:(StockData data, _) => data.color,
                                  xValueMapper: (StockData data, _) => data.minute,
                                  yValueMapper: (StockData data, _) => data.sales
                              )
                            ]
                        )
                      ],
                    ),
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
                          'Holdings',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),),
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
class StockData {
  StockData(this.minute, this.sales, this.color);

  final double minute;
  final double sales;
  final Color color;
}


