import 'package:bayrak_oyunu/quiz_ekrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Bayrak Tahmin Oyunu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: Image.asset("lib/images/turkiye.png"),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red, shadowColor: Colors.black),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuizEkrani()));
                    },
                    child: Text(
                      "Oyuna Başla",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )))
          ]),
        ),
      ),
    );
  }
}
