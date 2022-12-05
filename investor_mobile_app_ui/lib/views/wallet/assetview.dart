import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investor_mobile_app_ui/util/assetdata.dart';
import 'package:investor_mobile_app_ui/util/bidsandasks.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../stellar-api/api-test.dart';
import '../../util/appcolors.dart';
import '../../util/num_pad.dart';
import '../../util/stockdata.dart';
import 'dart:developer' as logdev;

class AssetView extends StatefulWidget {
  final AssetData assetData;
  const AssetView(this.assetData);

  @override
  AssetViewState createState() => AssetViewState();
}

class AssetViewState extends State<AssetView> {
  List<StockData> stockdataFinal = List.empty(growable: true);
  List<BidsAndAsks> bids = List.empty(growable: true);
  List<BidsAndAsks> asks = List.empty(growable: true);
  double initPrice = 0.0;
  double finalPrice = 0.0;
  double percentChange = 0.0;
  bool _isLoading = false;
  final TextEditingController _myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    createStockDataAndOrderBook();
  }

  void createStockDataAndOrderBook() async {
    final stockdata = await createStockData(
        widget.assetData.getName(), widget.assetData.getIssuerID());
    final orderBook = await getOrderBooksForAsset(
        widget.assetData.getName(), widget.assetData.getIssuerID());
    orderBook.asks?.forEach((element) {
      logdev.log("${element?.amount}, ${element?.price}");
      asks.insert(
          0,
          BidsAndAsks(double.parse(element?.amount ?? "0.00"),
              double.parse(element?.price ?? "0.00")));
    });
    orderBook.bids?.forEach((element) {
      logdev.log("${element?.amount}, ${element?.price}");
      bids.insert(
          0,
          BidsAndAsks(double.parse(element?.amount ?? "0.00"),
              double.parse(element?.price ?? "0.00")));
    });
    setState(() {
      _isLoading = false;
      stockdataFinal = stockdata;
      initPrice = stockdataFinal[0].sales;
      finalPrice = stockdataFinal[stockdataFinal.length - 1].sales;
      percentChange = ((finalPrice - initPrice) / (initPrice)) * 100;
    });
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
                            widget.assetData.assetName,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: _isLoading
                              ? Text(
                                  'Loading',
                                  style: TextStyle(
                                      color: AppColors.purpleTheme,
                                      fontSize: 25),
                                )
                              : Text(
                                  '\$${finalPrice}',
                                  style: TextStyle(
                                      color: AppColors.purpleTheme,
                                      fontSize: 25),
                                ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: _isLoading
                              ? Text(
                                  'Loading',
                                  style: TextStyle(
                                      color: AppColors.purpleTheme,
                                      fontSize: 25),
                                )
                              : Text(
                                  '+ \$${(finalPrice - initPrice).toStringAsFixed(8)} '
                                  '(${percentChange.toStringAsFixed(3)}%)',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                        ),
                        _isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: AppColors.purpleTheme,
                              ))
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
                                    //Hide the axis line of y-axis
                                    axisLine: AxisLine(width: 0),
                                    isVisible: false
                                ),
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
                    child: Column(children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Order Book',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                      _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                              color: AppColors.purpleTheme,
                            ))
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(top: 10),
                              shrinkWrap: true,
                              itemCount: asks.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 10, right: 10),
                                      child: Container(
                                        height: 35,
                                        width: (width - 60) / 2,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '${bids[index].price.toStringAsFixed(3)} x ${bids[index].amount.toStringAsFixed(3)}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10, left: 10),
                                        child: Container(
                                          height: 35,
                                          width: (width - 60) / 2,
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '${asks[index].amount.toStringAsFixed(3)} x ${asks[index].price.toStringAsFixed(3)}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ))
                                  ],
                                );
                              })
                    ]),
                  ),
                ),
              ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 15, right: 15, bottom: 15.0),
                child: Container(
                  height: 50,
                  width: width - 60,
                  decoration: BoxDecoration(
                      color: AppColors.purpleTheme,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      slideTradeSheet();
                    },
                    child: Text(
                      'Trade',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
  void slideTradeSheet() {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    showModalBottomSheet(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: height - 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)),
              color: AppColors.darkTradeWidget,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_down_sharp, color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Buy',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    Text('Sell',
                        style: TextStyle(color: Colors.white, fontSize: 25))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [
                    Text('At',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    SizedBox( // <-- SEE HERE
                      width: 200,
                      child: TextField(
                        controller: _myController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: '\$${finalPrice}',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [
                    Text('For',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    SizedBox( // <-- SEE HERE
                      width: 200,
                      child: TextField(
                        controller: _myController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: '\$900',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],),
                NumPad(
                  buttonSize: 44,
                  buttonColor: AppColors.purpleTheme,
                  iconColor: AppColors.purpleTheme,
                  controller: _myController,
                  delete: () {
                    _myController.text = _myController.text
                        .substring(0, _myController.text.length - 1);
                  },
                  // do something with the input numbers
                  onSubmit: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => FinalScreenExisting()));
                  },
                ),
              ],
            ),
          );
        });
  }
}
