import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MiniJuegos());
}

class MiniJuegos extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaInicio(),
    );
  }
}

class PantallaInicio extends StatefulWidget {
  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_boton("Ver video"), _boton1("Ver video")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_boton2("Ver video"), _boton3("Ver video")],
            )
          ],
        ),
      ),
    );
  }
}

Widget _boton(String texto) {
  return ElevatedButton(
    onPressed: () {
      launch("https://poki.com/es/g/pop-it-master");
    },
    child: const Text('Pop it master'),
  );
}

Widget _boton1(String texto) {
  return ElevatedButton(
    onPressed: () {
      launch("https://poki.com/es/g/maze-path-of-light");
    },
    child: const Text('Juego del laberinto'),
  );
}

Widget _boton2(String texto) {
  return ElevatedButton(
    onPressed: () {
      launch("https://poki.com/es/g/subway-surfers");
    },
    child: const Text('Subway surfers'),
  );
}

Widget _boton3(String texto) {
  return ElevatedButton(
    onPressed: () {
      launch("https://poki.com/es/g/jigsaw-deluxe");
    },
    child: const Text('Rompecabezas'),
  );
}
