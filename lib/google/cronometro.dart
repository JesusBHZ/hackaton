// Navigation Drawer
import 'package:exito/google/homepage.dart';
import 'package:flutter/material.dart';
import 'package:exito/Clase03/Page3.dart';
import 'package:exito/google/home.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'homepage.dart';
import 'package:exito/google/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'singin.dart';
import 'cronometro.dart';
import 'minijuegos.dart';
import 'countdown/main.dart';
import 'diario_audio/diario.dart';
import 'diario_audio/main.dart';

void main() => runApp(const Page2());

class Page2 extends StatelessWidget {
  const Page2({super.key});

  static const appTitle = 'Cuatrimestre';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: const Center(
          child: Text(
            '4-°',
            style: TextStyle(
              fontSize: 25.0,
            ),
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
}

Future<void> logout() async {
  await FirebaseAuth.instance.signOut();
  print("User logged out");
}
