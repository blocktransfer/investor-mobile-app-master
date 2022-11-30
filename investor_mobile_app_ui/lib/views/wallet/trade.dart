import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TradeView extends StatefulWidget {
  const TradeView({Key? key}) : super(key: key);

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 50),
                  child: Center(
                    child: Text(
                      'Trade',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        )
    );
  }
}
