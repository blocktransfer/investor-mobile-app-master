import 'dart:ui';

import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';
import 'dart:developer' as logdev;

import '../util/appcolors.dart';

final StellarSDK sdk = StellarSDK.PUBLIC;

testAPI() async {
  String accountId = "GC5TUPFLOXCINDYHQVYYLLVYP6GKHT65ELB2Q2WLFTGN63YYIXPQTDFJ";
  logdev.log(accountId, name:"stellar-test");
  final account = await sdk.accounts.account(accountId);
  logdev.log("Sequence number: ${account.sequenceNumber}", name:"stellar-test");
  // account.balances?.forEach((element) {
  //   logdev.log("${element?.assetIssuer}, ${element?.assetCode}: ${element?.balance}", name:"test");
  // });
  // final tradeagg = await sdk.tradeAggregations(Asset.createNonNativeAsset("AQUA", "GBNZILSTVQZ4R7IKQDGHYGY2QXL5QOFJYQMXPKWRRM5PAV7Y4M67AQUA"),
  //     Asset.createNonNativeAsset("USDC", "GA5ZSEJYB37JRC5AVCIA5MOP4RHTM335X2KGX3IHOJAPP5RE34K4KZVN"), DateTime.now().millisecondsSinceEpoch - 3600000, DateTime.now().millisecondsSinceEpoch, 60000, 0);
  // final tradeaggout = await tradeagg.execute();
  // // logdev.log("Length: ${tradeaggout.records?.length}", name: "trade-agg");
  // tradeaggout.records?.forEach((element) {
  //   logdev.log("Timestamp - ${DateTime.fromMillisecondsSinceEpoch(int.parse(element?.timestamp ?? "3600000"))}: Close - ${element?.close}", name: "Test Trade Aggregate");
  // });
  final x = createStockData();
  logdev.log("${x.runtimeType}", name: "stock-data");
}

Future<List> createStockData() async {
  final tradeagg = await sdk.tradeAggregations(Asset.createNonNativeAsset("AQUA", "GBNZILSTVQZ4R7IKQDGHYGY2QXL5QOFJYQMXPKWRRM5PAV7Y4M67AQUA"),
      Asset.createNonNativeAsset("USDC", "GA5ZSEJYB37JRC5AVCIA5MOP4RHTM335X2KGX3IHOJAPP5RE34K4KZVN"), DateTime.now().millisecondsSinceEpoch - 3600000, DateTime.now().millisecondsSinceEpoch, 60000, 0);
  final tradeaggout = await tradeagg.execute();
  // logdev.log("Length: ${tradeaggout.records?.length}", name: "trade-agg");
  var stockdata = List.empty();
  // tradeaggout.records?.forEach((element) {
  //   stockdata.add(StockData(DateTime.fromMillisecondsSinceEpoch(int.parse(element?.timestamp ?? "3600000")), double.parse(element?.close ?? "0"), AppColors.purpleTheme));
  //   logdev.log("Timestamp - ${DateTime.fromMillisecondsSinceEpoch(int.parse(element?.timestamp ?? "3600000"))}: Close - ${element?.close}", name: "Test Trade Aggregate");
  // });
  return stockdata;
}

class StockData {
  StockData(this.minute, this.sales, this.color);

  final DateTime minute;
  final double sales;
  final Color color;
}
