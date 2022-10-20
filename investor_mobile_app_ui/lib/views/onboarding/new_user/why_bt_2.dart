import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investor_mobile_app_ui/views/onboarding/new_user/why_bt_3.dart';

class WhyBTTwo extends StatelessWidget {
  const WhyBTTwo({Key? key}) : super(key: key);

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
                  'Don\'t lose 0.5% per year from hidden broker spreads.*',
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
                  '*On average for a diversified portfoio at a leading broker.',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          Center(
            child: Text(
              'Disclosure',
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
                      context, MaterialPageRoute(builder: (_) => WhyBTThree()));
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
