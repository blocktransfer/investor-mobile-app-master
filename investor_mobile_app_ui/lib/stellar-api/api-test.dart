import 'dart:ui';

import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';
import 'dart:developer' as logdev;

import '../util/appcolors.dart';
import '../util/assetdata.dart';
import '../util/stockdata.dart';

final StellarSDK sdk = StellarSDK.PUBLIC;

testAPI() async {
  // // String accountId = "GC5TUPFLOXCINDYHQVYYLLVYP6GKHT65ELB2Q2WLFTGN63YYIXPQTDFJ";
  // // logdev.log(accountId, name:"stellar-test");
  // // final account = await sdk.accounts.account(accountId);
  // // logdev.log("Sequence number: ${account.sequenceNumber}", name:"stellar-test");
  // final x = await getAccountBalances();
  // logdev.log("Balances: ${x}", name: "balances");
  // // account.balances?.forEach((element) {
  // //   logdev.log("${element?.assetIssuer}, ${element?.assetCode}: ${element?.balance}", name:"test");
  // // });
  // // final tradeagg = await sdk.tradeAggregations(Asset.createNonNativeAsset("AQUA", "GBNZILSTVQZ4R7IKQDGHYGY2QXL5QOFJYQMXPKWRRM5PAV7Y4M67AQUA"),
  // //     Asset.createNonNativeAsset("USDC", "GA5ZSEJYB37JRC5AVCIA5MOP4RHTM335X2KGX3IHOJAPP5RE34K4KZVN"), DateTime.now().millisecondsSinceEpoch - 3600000, DateTime.now().millisecondsSinceEpoch, 60000, 0);
  // // final tradeaggout = await tradeagg.execute();
  // // // logdev.log("Length: ${tradeaggout.records?.length}", name: "trade-agg");
  // // tradeaggout.records?.forEach((element) {
  // //   logdev.log("Timestamp - ${DateTime.fromMillisecondsSinceEpoch(int.parse(element?.timestamp ?? "3600000"))}: Close - ${element?.close}", name: "Test Trade Aggregate");
  // // });
  // // final x = createStockData();
  // // logdev.log("${x.runtimeType}", name: "stock-data");
  // final tradeaggout = await createStockData("AQUA", "GBNZILSTVQZ4R7IKQDGHYGY2QXL5QOFJYQMXPKWRRM5PAV7Y4M67AQUA");
  // logdev.log("${tradeaggout}", name: "trade-agg");
  getOrderBooksForAsset("AQUA", "GBNZILSTVQZ4R7IKQDGHYGY2QXL5QOFJYQMXPKWRRM5PAV7Y4M67AQUA");
}

Future<List<StockData>> createStockData(String asset, String issuer) async {
  final currentTime = DateTime.now().millisecondsSinceEpoch;
  final tradeagg = await sdk.tradeAggregations(Asset.createNonNativeAsset(asset, issuer),
      Asset.createNonNativeAsset("USDC", "GA5ZSEJYB37JRC5AVCIA5MOP4RHTM335X2KGX3IHOJAPP5RE34K4KZVN"),
      currentTime - 86400000, currentTime, 3600000, 0);
  final tradeaggout = await tradeagg.execute();
  logdev.log("Type: ${tradeaggout.runtimeType}", name: "runtime");
  List<StockData> stockdata = List.empty(growable: true);
  tradeaggout.records?.forEach((element) {
    stockdata.add(StockData(DateTime.fromMillisecondsSinceEpoch(int.parse(element?.timestamp ?? "3600000")), double.parse(element?.close ?? "0")));
    //logdev.log("Timestamp - ${DateTime.fromMillisecondsSinceEpoch(int.parse(element?.timestamp ?? "3600000"))}: Close - ${element?.close}", name: "Test Trade Aggregate");
  });
  return stockdata;
}

Future<List<AssetData>> getAccountHoldings() async {
  List<AssetData> holdings = List.empty(growable: true);
  String accountId = "GC5TUPFLOXCINDYHQVYYLLVYP6GKHT65ELB2Q2WLFTGN63YYIXPQTDFJ";
  logdev.log(accountId, name:"stellar-test");
  final account = await sdk.accounts.account(accountId);
  logdev.log("${(account.balances).runtimeType}", name:"stellar-test");
  account.balances?.forEach((element) {
    if (element?.assetCode != null) {
      holdings.add(AssetData(element?.assetCode ?? "error", "${double.parse((element?.balance ?? "0.00")).toStringAsFixed(2)}", element?.assetIssuer ?? "error"));
    }
    //logdev.log("${element?.assetIssuer}, ${element?.assetCode}: ${element?.balance.runtimeType}", name:"test");
  });
  return holdings;
}

Future<OrderBookResponse> getOrderBooksForAsset(String asset, String issuer) async {
  final orderBook = await sdk.orderBook.buyingAsset(Asset.createNonNativeAsset(asset, issuer)).sellingAsset(Asset.createNonNativeAsset("USDC", "GA5ZSEJYB37JRC5AVCIA5MOP4RHTM335X2KGX3IHOJAPP5RE34K4KZVN")).limit(4).execute();
  return orderBook;
}


