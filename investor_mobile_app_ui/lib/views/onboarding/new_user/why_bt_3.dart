import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investor_mobile_app_ui/views/onboarding/new_user/why_bt_4.dart';

class WhyBTThree extends StatelessWidget {
  const WhyBTThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Center(
                child: Container(
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/returns.png',
                        width: width, height: 300)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Center(
                child: Text(
                  'Trade with other investors for free.',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Center(
                child: Text(
                  'A leading decentralized',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            Center(
              child: Text(
                'exchange fairly matches and',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                'settles orders in 5 seconds flat',
                style: TextStyle(color: Colors.black, fontSize: 20),
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
                      context, MaterialPageRoute(builder: (_) => WhyBTFour()));
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
