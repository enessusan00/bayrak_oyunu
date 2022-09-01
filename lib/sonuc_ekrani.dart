import 'package:bayrak_oyunu/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SonucEkrani extends StatefulWidget {
  const SonucEkrani({Key? key}) : super(key: key);

  @override
  State<SonucEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            "Oyuna Bitti",
          ),
          SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> MyHomePage()));
                  },
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ana Sayfa",
                      )))),
        ]),
      ),
    );
  }
}
