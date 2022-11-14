import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(EjerFisicos());
}

class EjerFisicos extends StatelessWidget {
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
              children: [_boton2("Ver video")],
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
      launch("https://www.youtube.com/watch?v=1J8CRcoFekE");
    },
    child: const Text('Ejercicios de yoga'),
  );
}

Widget _boton1(String texto) {
  return ElevatedButton(
    onPressed: () {
      launch("https://www.youtube.com/watch?v=0dyebB9e-vM");
    },
    child: const Text('Juego de respiracion'),
  );
}

Widget _boton2(String texto) {
  return ElevatedButton(
    onPressed: () {
      launch("https://www.youtube.com/watch?v=ZiT33JKydL4");
    },
    child: const Text('Ejercicios de cardio'),
  );
}
