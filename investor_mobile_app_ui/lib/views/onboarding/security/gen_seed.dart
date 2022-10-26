import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/appcolors.dart';

class GenSeed extends StatefulWidget {
  const GenSeed({Key? key}) : super(key: key);

  @override
  State<GenSeed> createState() => _GenSeedState();
}

class _GenSeedState extends State<GenSeed> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
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
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Center(
                    child: Text(
                      'Your Digital',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Center(
                    child: Text(
                      'Account Certificate',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Write this down somewhere',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Center(
                  child: Text(
                    'safe in a secure room',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Center(
                  child: Text(
                    'without cameras',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 270,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => WhyBTFour()));
                      },
                      child: Text(
                        'Tap to generate\ndigital certificate',
                        style: TextStyle(color: AppColors.purpleTheme, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.lock_outline, color: Colors.black),
                        Text(
                          'Your key never leaves this device',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ]),
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
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => WhyBTFour()));
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
