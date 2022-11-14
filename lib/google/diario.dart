import 'package:flutter/material.dart';

void main() {
  runApp(const MyDiary());
}

class MyDiary extends StatelessWidget {
  const MyDiary({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waby: Mi diario',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Diario'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(18.0)),
            Text(
              'Hola,que tal tu dia?',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(18.0)),
            Card(
              color: Colors.blue,
              child: Column(children: <Widget>[
                Card(
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 12, //or null
                        decoration: InputDecoration.collapsed(
                            hintText: "Describe tu dia porfavor"),
                      ),
                    ))
              ]),
            )
          ],
        ));
  }
}
