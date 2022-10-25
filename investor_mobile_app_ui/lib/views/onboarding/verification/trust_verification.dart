import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/appcolors.dart';
import '../new_user/account_type.dart';

class TrustVerification extends StatefulWidget {
  const TrustVerification({Key? key}) : super(key: key);

  @override
  State<TrustVerification> createState() => _TrustVerificationState();
}

class _TrustVerificationState extends State<TrustVerification> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                child: Image.asset('asset/images/bc_small1.png', width: width)),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 100),
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
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Center(
                    child: Text(
                      'Trust Verification',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 75),
              child: Container(
                height: 300,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text(
                  'user uploads trust documents -> Persona for trustor',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
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
                        MaterialPageRoute(builder: (_) => AccountType()));
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
