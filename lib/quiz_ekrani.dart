import 'package:bayrak_oyunu/sonuc_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({Key? key}) : super(key: key);

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Soruları Cevapla")),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text("Doğru sayısı :"), Text("Yanlış Sayısı : ")],
          ),
          Image.asset("lib/images/turkiye.png"),
          SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SonucEkrani()));
                  },
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Oyuna Başla",
                      )))),
          SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Oyuna Başla",
                      )))),
          SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Oyuna Başla",
                      )))),
          SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Oyuna Başla",
                      )))),
        ]),
      ),
    );
  }
}
