import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/appcolors.dart';
import 'existing_user/seed_phrase.dart';
import 'new_user/why_bt_1.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Text(
                  'Welcome to',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Container(
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/VerticalSmall.png',
                        width: 200, height: 150)),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: AppColors.purpleTheme,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => WhyBTOne()));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SeedPhrase()));
              },
              child: Text(
                'IMPORT EXISTING ACCOUNT',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30, top: 30, bottom: 0),
              child: Text(
                'By using our services, you represent that you have read, understand, and agree to our Terms of Service, Privacy Policy, and Transfer Standards as are linked and priodically amended.',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
