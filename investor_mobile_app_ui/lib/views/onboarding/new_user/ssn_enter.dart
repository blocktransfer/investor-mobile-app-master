import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/appcolors.dart';
import '../../../util/num_pad.dart';
import '../existing_user/final_screen_existing.dart';

class SSNenter extends StatefulWidget {
  const SSNenter({Key? key}) : super(key: key);

  @override
  State<SSNenter> createState() => _SSNenterState();
}

class _SSNenterState extends State<SSNenter> {
  final TextEditingController _myController = TextEditingController();

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
                child: Image.asset('asset/images/bc_small1.png', width: width)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 15.0, right: 15.0, top: 60),
                child: Center(
                  child: Container(
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('asset/images/BT-Circle_Cut.png',
                          width: 100, height: 100)),
                ),
              ),
              Center(
                child: Text(
                  'Enter {both} your {SSN/',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Container(
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Text(
                      'EIN/FTIN(S)}',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 50,
                  child: Center(
                      child: TextField(
                        controller: _myController,
                        textAlign: TextAlign.center,
                        showCursor: false,
                        style: const TextStyle(fontSize: 40),
                        // Disable the default soft keybaord
                        keyboardType: TextInputType.none,
                      )),
                ),
              ),
              // implement the custom NumPad
              NumPad(
                buttonSize: 65,
                buttonColor: AppColors.purpleTheme,
                iconColor: AppColors.purpleTheme,
                controller: _myController,
                delete: () {
                  _myController.text = _myController.text
                      .substring(0, _myController.text.length - 1);
                },
                // do something with the input numbers
                onSubmit: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FinalScreenExisting()));
                },
              ),
            ],
          ),
        ]));
  }
}
