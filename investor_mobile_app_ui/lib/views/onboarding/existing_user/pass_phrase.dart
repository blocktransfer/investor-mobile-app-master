import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investor_mobile_app_ui/views/onboarding/existing_user/final_screen_existing.dart';

import '../../../util/num_pad.dart';

class PassPhrase extends StatefulWidget {
  const PassPhrase({Key? key}) : super(key: key);

  @override
  State<PassPhrase> createState() => _PassPhraseState();
}

class _PassPhraseState extends State<PassPhrase> {
  final TextEditingController _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // display the entered numbers
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Center(
              child: Text(
                'Pass Phrase',
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
                child: Text(
                  'Enter the last four digts of your tax ID number',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 70,
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
            buttonSize: 75,
            buttonColor: Colors.purple,
            iconColor: Colors.purple,
            controller: _myController,
            delete: () {
              _myController.text = _myController.text
                  .substring(0, _myController.text.length - 1);
            },
            // do something with the input numbers
            onSubmit: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => FinalScreenExisting()));
            },
          ),
        ],
      ),
    );
  }
}
