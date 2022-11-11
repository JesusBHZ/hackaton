import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
              child: Column(
                children: <Widget>[
                  Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 8, //or null
                          decoration: InputDecoration.collapsed(hintText: "Describe tu dia porfavor"),
                        ),
                      )
                  )
                ]
              ),
          )
        ],
      )

    );
  }
}
