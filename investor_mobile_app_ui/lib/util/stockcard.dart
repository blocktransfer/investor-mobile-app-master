import 'package:flutter/material.dart';
import 'package:investor_mobile_app_ui/util/appcolors.dart';
import 'package:investor_mobile_app_ui/views/wallet/assetview.dart';

import 'assetdata.dart';

class StockCard extends StatelessWidget {
  final AssetData asset;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        print("Tapped a Asset: ${asset.getName()}");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AssetView(asset)));
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: AppColors.purpleTheme,
                    width: 1
                ),
              )
          ),
          width: width - 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.pie_chart, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.blue, // <-- Button color
                ),
              ),
              Column(
                  children: <Widget>[
                    Text(
                      asset.getName(),
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      "Balance: ${asset.getBalances()}",
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    ),
                  ],
              ),
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.green, borderRadius: BorderRadius.circular(20)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                  '${asset.getBalances()}',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                ),
              )
            ],
          )),
    );
  }

  StockCard({required this.asset});
}
