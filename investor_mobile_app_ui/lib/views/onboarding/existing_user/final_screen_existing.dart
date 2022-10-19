import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../wallet/block_transfer_parent_view.dart';

class FinalScreenExisting extends StatefulWidget {
  const FinalScreenExisting({Key? key}) : super(key: key);

  @override
  State<FinalScreenExisting> createState() => _FinalScreenExistingState();
}

class _FinalScreenExistingState extends State<FinalScreenExisting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 50),
              child: Center(
                child: Container(
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/BT_logo.png',
                        width: 200, height: 150)),
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
                style: TextStyle(color: Colors.purple, fontSize: 30),
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
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => BlockTransferParentView()));
                },
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
