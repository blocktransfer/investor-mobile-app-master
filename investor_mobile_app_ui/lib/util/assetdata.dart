import 'dart:ui';

class AssetData {
  AssetData(this.assetName, this.balances, this.issuerID);

  final String assetName;
  final String balances;
  final String issuerID;

  String getName() {
    return assetName;
  }

  String getIssuerID() {
    return issuerID;
  }

  String getBalances() {
    return balances;
  }
}