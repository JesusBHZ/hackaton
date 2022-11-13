import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset =
      "assets/audio/musica-para-relajarse-5-minmusica-relajante-de-la-naturaleza-5-minutosmusica-relajante-naturaleza.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      ByteData bytes =
          await rootBundle.load(audioasset); //load audio from assets
      audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      //convert ByteData to Uint8List

      player.onDurationChanged.listen((Duration d) {
        //get the duration of audio
        maxduration = d.inMilliseconds;
        setState(() {});
      });

      player.onAudioPositionChanged.listen((Duration p) {
        currentpos =
            p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int shours = Duration(milliseconds: currentpos).inHours;
        int sminutes = Duration(milliseconds: currentpos).inMinutes;
        int sseconds = Duration(milliseconds: currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rhours:$rminutes:$rseconds";

        setState(() {
          //refresh the UI
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool valuefirst = false;

    return Scaffold(
        appBar: AppBar(
          title: Text("Expediente"),
        ),
        body: ListView(children: <Widget>[
          Padding(padding: EdgeInsets.all(18.0)),
          Text(
            'Que tan enojado te sientes ahora?',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("muy bien"),
              Radio(
                value: 2,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("bien"),
              Radio(
                value: 3,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("sin opinion"),
              Radio(
                value: 4,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("regular"),
              Radio(
                value: 5,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("mal"),
            ],
          ),
          Padding(padding: EdgeInsets.all(18.0)),
          Padding(padding: EdgeInsets.all(18.0)),
          Text(
            'Que tan fracasado te sientes hoy?',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("muy bien"),
              Radio(
                value: 2,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("bien"),
              Radio(
                value: 3,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("sin opinion"),
              Radio(
                value: 4,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("regular"),
              Radio(
                value: 5,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("mal"),
            ],
          ),
          Padding(padding: EdgeInsets.all(18.0)),
          Padding(padding: EdgeInsets.all(18.0)),
          Text(
            'Que tan pesimista te sientes hoy',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("muy bien"),
              Radio(
                value: 2,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("bien"),
              Radio(
                value: 3,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("sin opinion"),
              Radio(
                value: 4,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("regular"),
              Radio(
                value: 5,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("mal"),
            ],
          ),
          Padding(padding: EdgeInsets.all(18.0)),
          Padding(padding: EdgeInsets.all(18.0)),
          Text(
            'Que escala de culpabilidad te identifas hoy?',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("muy bien"),
              Radio(
                value: 2,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("bien"),
              Radio(
                value: 3,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("sin opinion"),

              Text("sin opinion"),
              Radio(
                value: 4,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("regular"),
              Radio(
                value: 5,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("mal"),
            ],
          ),
          Padding(padding: EdgeInsets.all(18.0)),
          Padding(padding: EdgeInsets.all(18.0)),
          Text(
            'Cunto consideras que dormiste hoy?',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("muy bien"),
              Radio(
                value: 2,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("bien"),
              Radio(
                value: 3,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("sin opinion"),
              Radio(
                value: 4,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("regular"),
              Radio(
                value: 5,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("mal"),
            ],
          ),
          Padding(padding: EdgeInsets.all(18.0)),
          Padding(padding: EdgeInsets.all(18.0)),
          Text(
            'Que nivel de tristeza consideras que tines hoy?',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("muy bien"),
              Radio(
                value: 2,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("bien"),
              Radio(
                value: 3,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("sin opinion"),

              Text("sin opinion"),
              Radio(
                value: 4,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("regular"),
              Radio(
                value: 5,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("mal"),
            ],
          ),
          Padding(padding: EdgeInsets.all(18.0)),
          Padding(padding: EdgeInsets.all(18.0)),
          Text(
            'Que tan motivado estas el dia de hoy?',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("muy bien"),
              Radio(
                value: 2,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("bien"),
              Radio(
                value: 3,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("sin opinion"),

              Radio(
                value: 4,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("regular"),
              Radio(
                value: 5,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("mal"),
            ],
          ),
          Padding(padding: EdgeInsets.all(18.0)),
          Padding(padding: EdgeInsets.all(18.0)),
          Text(
            'Cual es tu nivel de felicidad hoy',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("muy bien"),
              Radio(
                value: 2,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("bien"),
              Radio(
                value: 3,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("sin opinion"),

              Radio(
                value: 4,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("regular"),
              Radio(
                value: 5,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("mal"),
            ],
          ),
          Padding(padding: EdgeInsets.all(18.0)),
          Padding(padding: EdgeInsets.all(18.0)),
          Text(
            'Que tan seguro(a) te sientes hoy?',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("muy bien"),
              Radio(
                value: 2,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("bien"),
              Radio(
                value: 3,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("sin opinion"),

              Text("sin opinion"),
              Radio(
                value: 4,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("regular"),
              Radio(
                value: 5,
                groupValue: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = true;
                  });
                },
              ),
              Text("mal"),
            ],
          ),
          Padding(padding: EdgeInsets.all(18.0))
        ]));
  }
}
