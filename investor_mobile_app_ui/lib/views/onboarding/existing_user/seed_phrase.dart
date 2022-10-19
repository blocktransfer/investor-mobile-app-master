import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investor_mobile_app_ui/views/onboarding/existing_user/pass_phrase.dart';

class SeedPhrase extends StatefulWidget {
  const SeedPhrase({Key? key}) : super(key: key);

  @override
  State<SeedPhrase> createState() => _SeedPhraseState();
}

class _SeedPhraseState extends State<SeedPhrase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 170.0),
              child: Center(
                child: Text(
                  'Import Your Existing Account',
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
                    'Enter your seed phrase in a secure room without cameras',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Seed Phrase',
                    hintText: 'Enter valid seed phrase'),
                maxLines: 3,
                minLines: 1,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Your key never leaves this device',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              height: 50,
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
                        context, MaterialPageRoute(builder: (_) => PassPhrase()));
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
