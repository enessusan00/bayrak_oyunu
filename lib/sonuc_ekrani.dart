import 'package:bayrak_oyunu/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SonucEkrani extends StatefulWidget {
  int dogruSayisi;

  SonucEkrani(this.dogruSayisi);
  @override
  State<SonucEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<SonucEkrani> {
  String basariDurumu = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (widget.dogruSayisi * 20 > 50)
              Text("TEBRİKLER")
            else
              Text("DAHA İYİSİNİ YAPABİLİRSİN !"),
            Text(
              "${widget.dogruSayisi} DOĞRU ${5 - widget.dogruSayisi} YANLIŞ",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "% ${((widget.dogruSayisi * 100) / 5).toInt()} Başarı",
              style: TextStyle(fontSize: 30, color: Colors.pink),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text("TEKRAR DENE"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
