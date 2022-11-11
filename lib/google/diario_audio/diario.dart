import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:typed_data';
import 'package:exito/google/main.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../singin.dart';
import '../cronometro.dart';
import '../minijuegos.dart';
import '../countdown/main.dart';
import '../diario_audio/diario.dart';
import '../diario_audio/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingControllerNUM1 = TextEditingController();
  TextEditingController textEditingControllerNUM2 = TextEditingController();
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Operaciones Básicas"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: "Primer Número"),
                    controller: textEditingControllerNUM1,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Segundo Número"),
                    controller: textEditingControllerNUM2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(hintText: "Resultado Operación"),
                    controller: textEditingController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //Primera fila de botones
                    children: [
                      MaterialButton(
                        onPressed: () => doAddition(),
                        child: Text(
                          "+",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.w700),
                        ),
                        color: Colors.blueAccent,
                      ),
                      MaterialButton(
                        onPressed: () => doRest(),
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 35.0,
                          ),
                        ),
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //Primera fila de botones
                    children: [
                      MaterialButton(
                        onPressed: () => doMultiplication(),
                        child: Text(
                          "x",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 35.0,
                          ),
                        ),
                        color: Colors.yellowAccent,
                      ),
                      MaterialButton(
                        onPressed: () => doDivision(),
                        child: Text(
                          "/",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 35.0,
                          ),
                        ),
                        color: Colors.greenAccent,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu'),
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Asistencia'),
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Ejercicio fisico'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Mini juegos'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Video'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Audios'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Metodo Komodoro'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Komodoro()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Respiracion'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Seguimiento'),
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Diaro'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Expediente'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Cerrar sesion'),
                trailing: Icon(Icons.home),
                onTap: () {
                  logout();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SingIn()));
                },
              ),
            ],
          ),
        ));
  }

  void doAddition() {
    setState(() {
      double? n1 = double.tryParse(textEditingControllerNUM1.text);
      double? n2 = double.tryParse(textEditingControllerNUM2.text);
      total = n1! + n2!;
      textEditingControllerNUM1.text = "";
      textEditingControllerNUM2.text = "";
      textEditingController.text = total.toString();
    });
  }

  void doRest() {
    setState(() {
      double? n1 = double.tryParse(textEditingControllerNUM1.text);
      double? n2 = double.tryParse(textEditingControllerNUM2.text);
      total = n1! - n2!;
      textEditingControllerNUM1.text = "";
      textEditingControllerNUM2.text = "";
      textEditingController.text = total.toString();
    });
  }

  void doMultiplication() {
    setState(() {
      double? n1 = double.tryParse(textEditingControllerNUM1.text);
      double? n2 = double.tryParse(textEditingControllerNUM2.text);
      total = n1! * n2!;
      textEditingControllerNUM1.text = "";
      textEditingControllerNUM2.text = "";
      textEditingController.text = total.toString();
    });
  }

  void doDivision() {
    setState(() {
      double? n1 = double.tryParse(textEditingControllerNUM1.text);
      double? n2 = double.tryParse(textEditingControllerNUM2.text);
      if (n2 == 0) {
        textEditingController.text = " - Division Not Valid - ";
        textEditingControllerNUM1.text = "";
        textEditingControllerNUM2.text = "";
      } else {
        total = n1! / n2!;
        textEditingControllerNUM1.text = "";
        textEditingControllerNUM2.text = "";
        textEditingController.text = total.toString();
      }
    });
  }
}

Future<void> logout() async {
  await FirebaseAuth.instance.signOut();
  print("User logged out");
}
