import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/appcolors.dart';
import '../../wallet/block_transfer_parent_view.dart';

class FinalScreenExisting extends StatefulWidget {
  const FinalScreenExisting({Key? key}) : super(key: key);

  @override
  State<FinalScreenExisting> createState() => _FinalScreenExistingState();
}

class _FinalScreenExistingState extends State<FinalScreenExisting> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
              child: Image.asset('asset/images/bc_small1.png')),
        ),
        SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 100),
              child: Center(
                child: Container(
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/BT-Circle_Cut.png',
                        width: 100, height: 100)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'You entered',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                '123-45-6789',
                style: TextStyle(color: AppColors.purpleTheme, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30, top: 30, bottom: 0),
              child: Text(
                'By continuing, you assert that: the numbers shown on this page is{/are} the correct taxpayer identification number{s}. I{We} am{are} not subject to backup withholding because: {plural if joint or company}',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15.0),
            child: Container(
              height: 50,
              width: width,
              decoration: BoxDecoration(
                  color: AppColors.purpleTheme,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BlockTransferParentView()));
                },
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ),
    ]));
  }
}
