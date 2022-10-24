import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investor_mobile_app_ui/views/onboarding/new_user/ssn_enter.dart';

import '../../../util/appcolors.dart';

class AccountType extends StatelessWidget {
  const AccountType({Key? key}) : super(key: key);

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
                    'Select Account Type:',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      color: AppColors.purpleTheme,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SSNenter()));
                    },
                    child: Text(
                      'Joint',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      color: AppColors.purpleTheme,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SSNenter()));
                    },
                    child: Text(
                      'Minor',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      color: AppColors.purpleTheme,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SSNenter()));
                    },
                    child: Text(
                      'Trust',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      color: AppColors.purpleTheme,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SSNenter()));
                    },
                    child: Text(
                      'Company',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      color: AppColors.purpleTheme,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SSNenter()));
                    },
                    child: Text(
                      'International Individual',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
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
                      MaterialPageRoute(builder: (_) => SSNenter()));
                },
                child: Text(
                  'US Individual',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

