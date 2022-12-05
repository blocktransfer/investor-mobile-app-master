import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investor_mobile_app_ui/util/assetdata.dart';
import 'package:investor_mobile_app_ui/util/stockcard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../util/appcolors.dart';

import 'package:investor_mobile_app_ui/stellar-api/api-test.dart';

import '../../util/stockdata.dart';
import 'dart:developer' as logdev;

class PortfolioView extends StatefulWidget {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  List<StockData> stockdataFinal = List.empty(growable: true);
  List<AssetData> holdingDataFinal = List.empty(growable: true);
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    createStockDataAndHoldingsPort();
  }

  void createStockDataAndHoldingsPort() async {
    final stockdata = await createStockData(
        "BTC", "GDPJALI4AZKUU2W426U5WKMAT6CN3AJRPIIRYR2YM54TL2GDWO5O2MZM");
    final holdings = await getAccountHoldings();
    setState(() {
      _isLoading = false;
      stockdataFinal = stockdata;
      holdingDataFinal = holdings;
    });
    logdev.log("${stockdataFinal}");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.grayPortfolio,
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
                  child: Center(),
                ),
                Card(
                  child: SizedBox(
                    width: width - 30,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Welcome back,',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Mr. Test',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
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
                        _isLoading
                            ? Center(child: CircularProgressIndicator(color: AppColors.purpleTheme,))
                            : SfCartesianChart(
                                plotAreaBorderWidth: 1,
                                plotAreaBorderColor: Colors.white,
                                primaryXAxis: DateTimeAxis(
                                  //Hide the gridlines of x-axis
                                  majorGridLines: MajorGridLines(width: 0),
                                  //Hide the axis line of x-axis
                                  axisLine: AxisLine(width: 0),
                                  intervalType: DateTimeIntervalType.hours,
                                ),
                                primaryYAxis: NumericAxis(
                                    //Hide the gridlines of y-axis
                                    majorGridLines: MajorGridLines(width: 0),
                                    isVisible: false,
                                    //Hide the axis line of y-axis
                                    axisLine: AxisLine(width: 0)),
                                series: <ChartSeries<StockData, DateTime>>[
                                    SplineSeries(
                                      dataSource: stockdataFinal,
                                      width: 4,
                                      color: AppColors.purpleTheme,
                                      xValueMapper: (StockData data, _) =>
                                          data.minute,
                                      yValueMapper: (StockData data, _) =>
                                          data.sales,
                                      animationDuration: 6500,
                                    )
                                  ])
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
                            'Portfolio',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                        _isLoading
                            ? Center(child: CircularProgressIndicator(color: AppColors.purpleTheme,))
                            : ListView.builder(
                                padding: EdgeInsets.only(top: 0),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: holdingDataFinal.length,
                                itemBuilder: (context, index) {
                                  return StockCard(
                                      asset: holdingDataFinal[index]);
                                })
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
