import 'dart:collection';

import 'package:bayrak_oyunu/bayrak.dart';
import 'package:bayrak_oyunu/bayrak_dao.dart';
import 'package:bayrak_oyunu/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {
  @override
  _QuizEkraniState createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  var sorular = <Bayrak>[];
  var yanlisSecenekler = <Bayrak>[];
  late Bayrak dogruSoru;
  var tumSecenekler = HashSet<Bayrak>();

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;

  String bayrakResimAdi = "placeholder.png";
  String buttonAyazi = "";
  String buttonByazi = "";
  String buttonCyazi = "";
  String buttonDyazi = "";

  @override
  void initState() {
    super.initState();

    sorulariAl();
  }

  Future<void> sorulariAl() async {
    sorular = await BayrakDao().BayrakGetir();
    soruYukle();
  }

  Future<void> soruYukle() async {
    dogruSoru = sorular[soruSayac];

    bayrakResimAdi = dogruSoru.bayrak_resim;

    yanlisSecenekler = await BayrakDao().YanlisGetir(dogruSoru.bayrak_id);

    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    buttonAyazi = tumSecenekler.elementAt(0).bayrak_ad;
    buttonByazi = tumSecenekler.elementAt(1).bayrak_ad;
    buttonCyazi = tumSecenekler.elementAt(2).bayrak_ad;
    buttonDyazi = tumSecenekler.elementAt(3).bayrak_ad;

    setState(() {});
  }

  void soruSayacKontrol() {
    soruSayac = soruSayac + 1;

    if (soruSayac != 5) {
      soruYukle();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SonucEkrani(
                    dogruSayac,
                  )));
    }
  }

  void dogruKontrol(String buttonYazi) {
    if (dogruSoru.bayrak_ad == buttonYazi) {
      dogruSayac = dogruSayac + 1;
    } else {
      yanlisSayac = yanlisSayac + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Doğru : $dogruSayac",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Yanlış : $yanlisSayac",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            soruSayac != 5
                ? Text(
                    "${soruSayac + 1}. Soru",
                    style: TextStyle(fontSize: 30),
                  )
                : Text(
                    "5. Soru",
                    style: TextStyle(fontSize: 30),
                  ),
            Image.asset("lib/images/$bayrakResimAdi"),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonAyazi),
                onPressed: () {
                  dogruKontrol(buttonAyazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonByazi),
                onPressed: () {
                  dogruKontrol(buttonByazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonCyazi),
                onPressed: () {
                  dogruKontrol(buttonCyazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(buttonDyazi),
                onPressed: () {
                  dogruKontrol(buttonDyazi);
                  soruSayacKontrol();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
