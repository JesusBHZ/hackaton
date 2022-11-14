import 'package:exito/google/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'singin.dart';
import 'minijuegos.dart';
import 'countdown/main.dart';
import 'audios.dart';
import 'respiracion.dart';
import 'diario.dart';
import 'expediente.dart';
import 'videos.dart';
import 'ejercicioF.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Waby",
          ),
          backgroundColor: Colors.teal,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Hola, Bienvenido",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Image.asset(
              'assets/tranquilidad.jpg',
              width: 200,
              height: 200,
            ),
          ],
        )),
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
                  color: Colors.teal,
                ),
                child: Text('Menu'),
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text(
                  'Asistencia',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Ejercicio fisico'),
                trailing: Icon(Icons.fitness_center_outlined),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EjerFisicos()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Mini juegos'),
                trailing: Icon(Icons.games),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MiniJuegos()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Video'),
                trailing: Icon(Icons.play_arrow),
                onTap: () {
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));*/
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Audios'),
                trailing: Icon(Icons.music_note),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Metodo Komodoro'),
                trailing: Icon(Icons.punch_clock),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Komodoro()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Respiracion'),
                trailing: Icon(Icons.sentiment_satisfied),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Respiracion()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text(
                  'Seguimiento',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Diaro'),
                trailing: Icon(Icons.account_balance_wallet),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyDiary()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Expediente'),
                trailing: Icon(Icons.list_alt),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Expediente()));
                },
              ),
              ListTile(
                // DefaultTabController & BottonNavigationBar
                title: const Text('Cerrar sesion'),
                trailing: Icon(Icons.logout),
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
